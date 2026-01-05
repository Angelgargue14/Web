<?php
/*CLIENTES*/
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['selcliente'])) {
    $asignarClientes=true;
    unset($_SESSION['cliente']); // Borra cliente anterior
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['buscarINP']) && $_POST['buscarINP']!='') {
    $asignarClientes=true;
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['cliente'])) {
    if (isset($_POST['cliente']) != ''){
        $_SESSION['cliente']=$_POST['cliente'];
        if (chkPedidoAbierto($_SESSION['mesa']) === true) {
            #El pedido ya está creado, con lo cual solo updateamos el cliente
            updateClientePedido($_SESSION['cliente'],$_SESSION['mesa']);
        } else {
            #El pedido no está creado, con lo cual lo creamos y después updateamos el cliente
            insertPedido($_SESSION['mesa'], $_SESSION['ID_EMPLEADO']); 
            updateClientePedido($_SESSION['cliente'],$_SESSION['mesa']);
        }
    }else{
        $_SESSION['cliente']="Cliente";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['quitarCliente'])) {
    if (isset($_POST['quitarCliente']) != ''){
        deleteClientePedido($_SESSION['mesa']);
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['btnAddCliente'])) {
    $_SESSION['addClientes'] = true;
    $MonCliParticulares=true;
    $MonCliEmpresas=false;
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['btnParticulares'])) {
    $MonCliParticulares=true;
    $MonCliEmpresas=false;
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['btnEmpresas'])) {
    $MonCliParticulares=false;
    $MonCliEmpresas=true;
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['btnCliDescartar'])) {
    $_SESSION['addClientes'] = false;
}

/*Cambiar de color el botón dependiendo de cual pulses*/
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST['btnParticulares'])) {
        $_SESSION['botonActivo'] = 'particulares';
    } elseif (isset($_POST['btnEmpresas'])) {
        $_SESSION['botonActivo'] = 'empresas';
    }
}

// Lógica para guardar CLIENTE PARTICULAR
if (isset($_POST['btnGuardarParticular'])) {
    
    // 1. Recogemos datos del formulario
    $nombre      = trim($_POST['nombre']);
    $apellidos   = trim($_POST['apellidos']);
    $tipoDoc     = $_POST['tipo_documento']; // NIF, NIE, PASAPORTE...
    $nif         = strtoupper(trim($_POST['identidad']));
    $email       = trim($_POST['correo']);
    $telefono    = trim($_POST['telefono']);
    $fechaNac    = $_POST['fecha_nacimiento']; // Puede venir vacío

    // 2. Generamos datos automáticos
    // Usamos el NIF para el ID único (Evita duplicados)
    $idCliente   = md5($nif); 
    $fechaHoy    = date('Y-m-d');
    $fechaHora   = date('Y-m-d H:i:s');
    
    // Nombre completo para FacturaScripts (FS solo tiene un campo nombre)
    $nombreCompleto = $nombre . " " . $apellidos;

    // 3. Insertamos en LOTYSHOP (Tu base de datos)
    // Nota: Dejamos Razón Social, Dirección y Ciudad vacíos o NULL porque no se piden en este form
    $sqlLocal = "INSERT INTO clientes (
                    ID_CLIENTE, NOMBRE, APELLIDOS, TIPO_DOCUMENTO, IDENTIDAD, 
                    FECHA_NACIMIENTO, CORREO, TELEFONO, 
                    PAIS, TIPO_CLIENTE, ALTA, MODIFICACION
                ) VALUES (
                    '$idCliente', '$nombre', '$apellidos', '$tipoDoc', '$nif', 
                    " . ($fechaNac ? "'$fechaNac'" : "NULL") . ", '$email', '$telefono',
                    'España', 'PARTICULAR', '$fechaHoy', '$fechaHora'
                )";

    if ($conn->query($sqlLocal) === TRUE) {
        
        // --- 4. SINCRONIZACIÓN CON FACTURASCRIPTS (API) ---
        $datosFS = [
            'codcliente' => $idCliente,      // Mismo ID MD5
            'nombre'     => $nombreCompleto, // Concatenamos Nombre + Apellidos
            'cifnif'     => $nif,
            'telefono1'  => $telefono,
            'email'      => $email,
            'codpais'    => 'ESP',
            'debaja'     => false
        ];

        // Llamada cURL
        $ch = curl_init($fs_url_api . '/clientes');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($datosFS));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'X-API-Key: ' . $fs_api_key,
            'Content-Type: application/json'
        ]);

        $respuesta = curl_exec($ch);
        $httpCode  = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($httpCode >= 200 && $httpCode < 300) {
            echo "<script>alert('Cliente Particular guardado y sincronizado correctamente.');</script>";
        } else {
            echo "<script>alert('Guardado en local, pero error en FacturaScripts (Código: $httpCode).');</script>";
        }

        // Cerramos la ventana modal
        $addClientes = false; 

    } else {
        echo "<script>alert('Error al guardar en base de datos local: " . $conn->error . "');</script>";
    }
}

// Lógica para guardar EMPRESA
if (isset($_POST['btnGuardarEmpresa'])) {
    
    // 1. Recogemos y limpiamos datos del formulario
    $razonSocial = trim($_POST['razon_social']);
    $cif         = strtoupper(trim($_POST['identidad_empresa']));
    $direccion   = trim($_POST['direccion']);
    $cp          = trim($_POST['codigo_postal']);
    $ciudad      = trim($_POST['ciudad']);
    $email       = trim($_POST['correo_empresa']);
    $telefono    = trim($_POST['telefono_empresa']);

    // 2. Generamos datos automáticos
    // Usamos el CIF para generar el ID único MD5 (Evita duplicados)
    $idCliente   = md5($cif); 
    $fechaHoy    = date('Y-m-d');
    $fechaHora   = date('Y-m-d H:i:s');

    // 3. Insertamos en LOTYSHOP (Base de datos local)
    // Nota: Guardamos Razón Social en 'NOMBRE' también para búsquedas rápidas
    $sqlLocal = "INSERT INTO clientes (
                    ID_CLIENTE, NOMBRE, APELLIDOS, TIPO_DOCUMENTO, IDENTIDAD, 
                    CORREO, TELEFONO, DIRECCION, CODIGO_POSTAL, CIUDAD, 
                    PAIS, RAZON_SOCIAL, TIPO_CLIENTE, ALTA, MODIFICACION
                ) VALUES (
                    '$idCliente', '$razonSocial', '', 'CIF', '$cif', 
                    '$email', '$telefono', '$direccion', '$cp', '$ciudad', 
                    'España', '$razonSocial', 'EMPRESA', '$fechaHoy', '$fechaHora'
                )";

    if ($conn->query($sqlLocal) === TRUE) {
        
        // --- 4. SINCRONIZACIÓN CON FACTURASCRIPTS (API) ---
        // Preparamos el array de datos según lo que pide FS
        $datosFS = [
            'codcliente' => $idCliente,     // Usamos el mismo ID
            'nombre'     => $razonSocial,   // En FS el nombre es la Razón Social
            'cifnif'     => $cif,
            'direccion'  => $direccion,
            'codpostal'  => $cp,
            'ciudad'     => $ciudad,
            'telefono1'  => $telefono,
            'email'      => $email,
            'codpais'    => 'ESP',          // Obligatorio 'ESP'
            'debaja'     => false
        ];

        // Iniciamos cURL usando las variables de tu config.php
        $ch = curl_init($fs_url_api . '/clientes');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($datosFS));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'X-API-Key: ' . $fs_api_key,
            'Content-Type: application/json'
        ]);

        $respuesta = curl_exec($ch);
        $httpCode  = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($httpCode >= 200 && $httpCode < 300) {
            echo "<script>alert('Empresa guardada en LotyShop y sincronizada con FacturaScripts correctament.');</script>";
        } else {
            // Si falla FS, avisamos pero el dato local ya está guardado
            echo "<script>alert('Guardado en local, pero error al conectar con FacturaScripts. Código: $httpCode');</script>";
        }

        // Cerramos el panel de añadir clientes
        $addClientes = false; 

    } else {
        echo "<script>alert('Error SQL Local: " . $conn->error . "');</script>";
    }
}

?>