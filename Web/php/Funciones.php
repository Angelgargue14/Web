<?php
/**
 * Comprueba si una mesa tiene un pedido pendiente.
 *
 * @param string $mesa El identificador de la mesa.
 * @return bool Devuelve true si hay un pedido pendiente para la mesa, false si no.
 */
function chkPedidoAbierto($mesa) {
    global $conn;
    global $dbname;

    // Consulta SQL corregida
    $q_chkPedidoAbierto = "SELECT * FROM $dbname.PEDIDOS WHERE MESA = ? AND ESTADO = 'PENDIENTE'";

    // Preparar consulta
    $stmt = $conn->prepare($q_chkPedidoAbierto);
    $stmt->bind_param("s", $mesa);
    $stmt->execute();
    $result = $stmt->get_result();

    if (!$result) {
        // Opcional: mostrar error si algo falla
        echo "Error al consultar pedidos: " . $stmt->error;
        return false;
    }

    // Verifica si hay filas
    $numRows = $result->num_rows;

    $stmt->close();

    // Retorna true si hay al menos un pedido pendiente
    return ($numRows > 0);
}

/**
 * Crea un nuevo pedido en la base de datos para una mesa y un empleado específicos.
 *
 * Esta función genera un ID de pedido basado en la fecha y en el número de empleado, y luego inserta un nuevo registro 
 * en la tabla `PEDIDOS` con el estado `PENDIENTE` y otros valores predeterminados.
 *
 * @param string $mesa El identificador de la mesa para la cual se crea el pedido.
 * @param string $empleado El identificador del empleado que está creando el pedido.
 * 
 * @return void No devuelve valor. Solo muestra un mensaje de error si ocurre algún problema al insertar el pedido.
 */
function insertPedido($mesa, $empleado) {
    global $conn;
    global $dbname;

    // Prepara la consulta para evitar inyecciones SQL
    $i_Pedido = "
    INSERT INTO $dbname.PEDIDOS 
    (ID_PEDIDO, ID_CLIENTE, ID_EMPLEADO, MESA, FECHA_COMPRA, ESTADO, NOTA_PEDIDO,
    INICIO_PREPARACION, FIN_PREPARACION, TOTAL_PAGADO, FECHA_PAGO, TOTAL, DESCUENTO, COMENTARIO)
    SELECT 
    CONCAT(
        DAYOFYEAR(NOW()), 
        DATE_FORMAT(NOW(),'%Y'), '-', 
        LPAD((SELECT NUM_EMPLEADO FROM EMPLEADOS WHERE ID_EMPLEADO = ?), 3, '0'), '#',
        LPAD((SELECT (COUNT(*) + 1) FROM PEDIDOS WHERE FECHA_COMPRA > CURDATE() AND ID_EMPLEADO = ?), 4, '0')
    ) AS ID_PEDIDO, -- ID_PEDIDO
    NULL, -- ID_CLIENTE
    (SELECT ID_EMPLEADO FROM $dbname.EMPLEADOS WHERE ID_EMPLEADO = ?), -- ID_EMPLEADO
    ?, -- MESA
    NULL, -- FECHA_COMPRA
    'PENDIENTE', -- ESTADO
    NULL, -- NOTA_PEDIDO
    NOW(), -- INICIO_PREPARACION
    NULL, -- FIN_PREPARACION
    0, -- TOTAL_PAGADO
    NULL, -- FECHA_PAGO
    0, -- TOTAL
    0, -- DESCUENTO
    NULL -- COMENTARIO;";

    // Prepara la consulta
    $stmt = $conn->prepare($i_Pedido);
    
    // Víncula los parámetros
    $stmt->bind_param("ssss", $empleado, $empleado, $empleado, $mesa);
    
    // Ejecuta la consulta
    if (!$stmt->execute()) {
        // Si ocurre un error, muestra el mensaje de error
        echo "Error al crear el pedido: " . $stmt->error;
    }
    
    // Cierra la declaración
    $stmt->close();
}

/**
 * Asigna un cliente (por su hash MD5) a un pedido pendiente de una mesa.
 *
 * @param string $cliente DNI u otro identificador del cliente (se usará su hash MD5).
 * @param string $mesa Identificador de la mesa asociada al pedido pendiente.
 *
 * @return void Solo muestra un mensaje si ocurre un error en la consulta.
 */
function updateClientePedido($cliente,$mesa){
    global $conn;
    global $dbname;


    // Calcula el hash MD5 del cliente 
    $cliente_hash = md5($cliente);

    //Prepara la consulta para evitar inyecciones SQL
    $u_Pedido="
    UPDATE $dbname.PEDIDOS 
    SET 
        ID_CLIENTE = ? 
    WHERE 
        MESA = ? AND 
        ESTADO ='PENDIENTE';
    ";

    // Prepara la consulta
    $stmt = $conn->prepare($u_Pedido);
    
    // Víncula los parámetros
    $stmt->bind_param("ss", $cliente_hash, $mesa);

    // Ejecuta la consulta
    if (!$stmt->execute()) {
        // Si ocurre un error, muestra el mensaje de error
        echo "Error al actualizar el pedido: " . $stmt->error;
    }

    // Cierra la declaración
    $stmt->close();
}

/**
 * Elimina la asociación de un cliente a un pedido pendiente de una mesa específica.
 *
 * Esta función actualiza la tabla de PEDIDOS estableciendo el campo ID_CLIENTE a NULL 
 * para el pedido asociado a la mesa indicada.
 *
 * @param string $mesa Identificador de la mesa cuyo pedido debe desvincularse del cliente.
 *
 * @return void Solo muestra un mensaje si ocurre un error en la ejecución de la consulta SQL.
 */
function deleteClientePedido($mesa){
    global $conn;
    global $dbname;

    //Prepara la consulta para evitar inyecciones SQL
    $d_Cliente="
    UPDATE $dbname.PEDIDOS 
    SET 
        ID_CLIENTE = NULL
    WHERE 
        MESA = ?;
    ";

    // Prepara la consulta
    $stmt = $conn->prepare($d_Cliente);

    // Víncula los parámetros
    $stmt->bind_param("s", $mesa);

    // Ejecuta la consulta
    if (!$stmt->execute()) {
        // Si ocurre un error, muestra el mensaje de error
        echo "Error al actualizar el pedido: " . $stmt->error;
    }

    // Cierra la declaración
    $stmt->close();
}


/**
 * Muestra el nombre del cliente asociado a una mesa con un pedido pendiente.
 *
 * @param string $mesa Identificador de la mesa.
 * @return void
 */
function voidClienteMesa($mesa) {
    global $conn;
    global $dbname;

    // Consulta segura con prepared statement
    $sql = "
        SELECT C.NOMBRE
        FROM $dbname.PEDIDOS P
        JOIN $dbname.CLIENTES C ON C.ID_CLIENTE = P.ID_CLIENTE
        WHERE P.MESA = ? AND P.ESTADO = 'PENDIENTE'
        LIMIT 1;
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $mesa);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        echo htmlspecialchars($row["NOMBRE"]);
    } else {
        echo "Cliente";
    }

    $stmt->close();
}


/**
 * Consulta datos geográficos de un código postal usando la API de CartoCiudad.
 *
 * Realiza una petición HTTP a la API oficial de CartoCiudad para obtener información
 * del municipio o municipios asociados al código postal proporcionado.
 *
 * @param string $codigoPostal Código postal que se desea consultar (por ejemplo, "28001").
 *
 * @return array Devuelve un array con información de los municipios asociados al CP.
 *               En caso de error, devuelve un array con clave 'error' y descripción.
 *
 * Ejemplo de respuesta:
 * [
 *     [
 *         'municipio'  => 'Madrid',
 *         'provincia'  => 'Madrid',
 *         'ccaa'       => 'Comunidad de Madrid',
 *         'cod_muni'   => '079',
 *         'cod_prov'   => '28',
 *         'cod_ccaa'   => '13'
 *     ]
 * ]
 *
 * Ejemplo de error:
 * ['error' => 'No se encontraron datos para el código postal.']
 */
function obtenerDatosPorCP($codigoPostal) {
    $url = "https://www.cartociudad.es/cartografia/api/consulta/codigopostal/" . urlencode($codigoPostal);

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $respuesta = curl_exec($ch);

    if (curl_errno($ch)) {
        return ['error' => curl_error($ch)];
    }

    curl_close($ch);

    $datos = json_decode($respuesta, true);

    if (!$datos || !isset($datos['municipios'])) {
        return ['error' => 'No se encontraron datos para el código postal.'];
    }

    // Devolver datos importantes
    $resultado = [];
    foreach ($datos['municipios'] as $muni) {
        $resultado[] = [
            'municipio'  => $muni['nm'],
            'provincia'  => $muni['np'],
            'ccaa'       => $muni['nccaa'],
            'cod_muni'   => $muni['cm'],
            'cod_prov'   => $muni['cp'],
            'cod_ccaa'   => $muni['ccaa']
        ];
    }

    return $resultado;
}
?>