<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/Colores.css">
  <link rel="stylesheet" href="css/Fuente.css">
  <link rel="stylesheet" href="css/styleGrid.css">
  <link rel="stylesheet" href="css/Categorias.css">  
  <link rel="stylesheet" href="css/Headers.css">
  <link rel="stylesheet" href="css/Mesas.css">
  <link rel="stylesheet" href="css/Monitor.css">  
  <link rel="stylesheet" href="css/typicons.css">
  <link rel="stylesheet" href="css/scrollbar.css">  
  <link rel="stylesheet" href="css/Botonera.css"> 
  <link rel="stylesheet" href="css/Clientes.css"> 
  <script src="sumain.js" defer></script> 
  <title>LottyShop</title>    
</head>
<body>
<?php
session_start(); // Iniciar la sesión   
include 'php/config.php';
include 'php/Funciones.php';
include 'php/articulos.php';
include 'php/usuarios.php';
include 'php/mesas.php';
include 'php/Monitor.php';
include 'php/botonera.php';
?> 

    <header>  
        <div id="bloqueo" style="display: <?php echo $usuarioLogueado ? 'flex' : 'none'; ?>;">  
          <form id="login" name="login" method="POST" action="">
            <input type="password" id="password" name="password" maxlength="4" readonly>
            <button type="button" class="button" onclick="addDigit(1)">1</button>
            <button type="button" class="button" onclick="addDigit(2)">2</button>
            <button type="button" class="button" onclick="addDigit(3)">3</button>
            <button type="button" class="button" onclick="addDigit(4)">4</button>
            <button type="button" class="button" onclick="addDigit(5)">5</button>
            <button type="button" class="button" onclick="addDigit(6)">6</button>
            <button type="button" class="button" onclick="addDigit(7)">7</button>
            <button type="button" class="button" onclick="addDigit(8)">8</button>
            <button type="button" class="button" onclick="addDigit(9)">9</button>     
            <button type="button" class="button" id="desaparece">&nbsp;</button>
            <button type="button" class="button" onclick="addDigit(0)">0</button>
            <button type="button" class="button" id="desaparece">&nbsp;</button>
          
            <button type="button" id="borrar" onclick="clearPassword()">Borrar</button>
            <button type="submit" name="button" id="loguear">Acceder</button>
          </form>
        </div>
        <div id="div_mesas_bloqueo" style="display: <?php echo $mesaBloqueo ? 'flex' : 'none'; ?>;"> 
          <div id="div_mesas">
            <form id="ubicacion" name="ubicacion" method="POST">
            <?php
            if ($ubicaciones->num_rows > 0) {
              // Salida de cada filaa
              while($ubicacion = $ubicaciones->fetch_assoc()) {
                echo '<input type="submit" name="ubicacion" class="ubicacion" value="'.htmlspecialchars($ubicacion["UBICACION"]).'">';
              }
            } else {
              echo "No hay ubicaciones disponibles.";
            }
            ?>
            </form>
            <form id="form_mesas" name="form_mesas" method="POST">
              <?php
                if ($mesas->num_rows > 0) {
                  // Salida de cada filaa
                  //(MESA, NOMBRE, MAX_COMENSALES, MIN_COMENSALES, OCUPADA, UBICACION, TIPO_MESA, NOTAS)
                  while($mesa = $mesas->fetch_assoc()) {
                        echo '<button type="submit" name="mesa" class="mesa" value="'.htmlspecialchars($mesa["MESA"]).'" style="background-color: '.(htmlspecialchars($mesa["OCUPADA"]) ? 'rgb(198, 239, 199)' : 'white').';">
                        <span><b>'.htmlspecialchars($mesa["MESA"]).'</b><br>
                        <span>  '.htmlspecialchars($mesa["NOMBRE"]).'<br>
                        Entre '.htmlspecialchars($mesa["MIN_COMENSALES"]).' y '.htmlspecialchars($mesa["MAX_COMENSALES"]).' comensales<br> 
                        Mesa '.htmlspecialchars($mesa["TIPO_MESA"]).'<br> 
                        <small>'.htmlspecialchars($mesa["NOTAS"]).'</small><br></span> </span>
                        </button>'; 
                  }         
                } else {
                  echo "No hay mesas disponibles.";
                }
              ?>
            </form>
          </div>
        </div>
        <nav>
            <img id="logo" src="img/logo/lotyshop-rectangulo.png">
            <form method="POST" id="unlogin">
              <button type="submit" name="logout"><?php echo $_SESSION['usuario']; ?></button>
            </form>
            <form method="POST" id="desmesar">
              <button type="submit" name="btn_mesa"><?php echo $_SESSION['mesa']; ?></button>
            </form>
        </nav>
        <section>
            <div id="Monitor">
              <form id="vcarrito" name="vcarrito" method="POST">
              <?php
              //consultamos el contenido de la mesa seleccionada
              $q_vcarrito="SELECT * FROM VCARRITO WHERE MESA='".htmlspecialchars($_SESSION['mesa'])."' ORDER BY INSERCION";
              $vcarritos=mysqli_query($conn, $q_vcarrito);
              if ($vcarritos->num_rows > 0) {
                while($vcarrito = $vcarritos->fetch_assoc()) {
                  echo '<button type="submit" name="vcarrito" id="vcarrito" value="'.htmlspecialchars($vcarrito["ID_ARTICULO"]).'">
                        <span>
                        <span id="nombre"><b>'.htmlspecialchars($vcarrito["NOMBRE"]).'</b></span><br>
                        <span id="cantidad">'.htmlspecialchars($vcarrito["CANTIDAD"]).' x '.htmlspecialchars($vcarrito["PRECIO"]).'€  / Unidades </span>
                        <span id="precio"><b>'.htmlspecialchars($vcarrito["TOTAL"]).'€</b></span>
                        </span>
                        </button>';
                }
              }
              ?>
              </form>
            </div>
        </section> 
        <aside>
            <div id="totales"> 
              <span><?php
              //Consultamos el total de los productos dentro del carrito
              $q_total_vcarrito="SELECT SUM(TOTAL) AS TOTAL, SUM(CANTIDAD) AS PRODUCTOS FROM VCARRITO WHERE MESA='".htmlspecialchars($_SESSION['mesa'])."'";
              $total_vcarritos=mysqli_query($conn, $q_total_vcarrito);
              if($total_vcarritos->num_rows > 0) {
                while ($total_vcarrito = $total_vcarritos->fetch_assoc()) {
                  if ($total_vcarrito["TOTAL"] > 0){
                    echo '<span id="productos">Productos</span><span id="cantidad">'.$total_vcarrito["PRODUCTOS"].'</span><br>';
                    echo '<span id="titulo"><b>TOTAL</b></span><span id="precio"><b>'.$total_vcarrito["TOTAL"].' €</b></span><br>';
                  } else{
                    echo '<span id="titulo"><b>TOTAL</b></span><span id="precio"><b>0€</b></span>';
                  }
                }
              }
              ?></span>
            </div>
            <div id="botonera">
            <form id="botonera" name="botonera" method="POST">
              <?php
                if($_SESSION['cliente'] == ''){
                  $_SESSION['cliente']='Cliente';
                }
              ?>
              <button type="submit" name="selcliente" class="cabecera"><span class="typcn typcn-user-add-outline"></span></br><?php voidClienteMesa(htmlspecialchars($_SESSION['mesa'])); ?></button>
              <button class="cabecera"><span class="typcn typcn-clipboard"></span></br> Nota Producto</button>
              <button class="cabecera"><span class="typcn typcn-cog-outline"></span></br>Funcines</button></br>
              <button class="cuerpo">1</button>
              <button class="cuerpo">2</button>
              <button class="cuerpo">3</button>
              <button class="cuerpo">ctd.</button></br>
              <button class="cuerpo">4</button>
              <button class="cuerpo">5</button>
              <button class="cuerpo">6</button>
              <button class="cuerpo">%</button></br>
              <button class="cuerpo">7</button>
              <button class="cuerpo">8</button>
              <button class="cuerpo">9</button>
              <button class="cuerpo">precio</button></br>
              <button class="cuerpo">+/-</button>
              <button class="cuerpo">0</button>
              <button class="cuerpo">,</button>
              <button class="cuerpo" id="deshacer"><span class="typcn typcn-backspace"></span></button></br>
              <button class="pie"><span>Comandar</span></button>
              <button class="pie" id="pagar"><span>Pago</span></button>
            </form>
            </div>
            
          <div id="bloqueoClientes" style="display: <?php echo $asignarClientes ? 'flex' : 'none'; ?>;">    
            <form id="asignarClientes" name="asignarClientes" method="POST">
                <div id="buscarDIV">
                  <button id="buscarBUT"><span class="typcn typcn-zoom-outline"></span></button>
                  <input type="text" id="buscarINP" name="buscarINP" placeholder="buscar..."/>
                </div>
                  <div id="listaClientes">
                    <?php
                      $buscar = isset($_POST['buscarINP']) ? htmlspecialchars($_POST['buscarINP']) : '';
                      
                      $q_buscaClientes = "SELECT * FROM CLIENTES 
                                          WHERE 
                                          NOMBRE LIKE '%$buscar%' OR
                                          IDENTIDAD LIKE '%$buscar%' OR
                                          CORREO LIKE '%$buscar%' OR
                                          TELEFONO LIKE '%$buscar%' 
                                          ORDER BY MODIFICACION DESC;";

                      $buscaClientes=mysqli_query($conn, $q_buscaClientes);

                      if($buscaClientes->num_rows > 0) {
                        while ($buscaCliente = $buscaClientes->fetch_assoc()) {
                      echo  '<div id="cliente">'
                          .'<button type="submit" name="cliente" id="cliente" value='.htmlspecialchars($buscaCliente["IDENTIDAD"]).'>'
                          .'<div id="nombreCliente">'.htmlspecialchars($buscaCliente["NOMBRE"]).' '.htmlspecialchars($buscaCliente["APELLIDOS"]).'</div>'
                          .'<div id="direccionCliente"><span class="typcn typcn-home"></span> '.htmlspecialchars($buscaCliente["DIRECCION"])
                          .' '.htmlspecialchars($buscaCliente["CODIGO_POSTAL"])
                          .' '.htmlspecialchars($buscaCliente["CIUDAD"])
                          .' ('.htmlspecialchars($buscaCliente["PROVINCIA"]).')'
                          .'</div>'
                          .'<div id="datosCliente"><span class="typcn typcn-at"></span> '.htmlspecialchars($buscaCliente["CORREO"]).'</br>'
                          .'<span class="typcn typcn-device-phone"></span> '.htmlspecialchars($buscaCliente["TELEFONO"]).'</div>'
                          .' </button>'
                          .'<button id="ajustesCliente" value='.htmlspecialchars($buscaCliente["IDENTIDAD"]).' name="btnAddCliente"><span class="typcn typcn-edit"></span></button>'
                          .'</div>';
                        }
                      }
                    ?>
                  </div>
                  <button id="descartar">Descartar</button>
                  <button id="añadir" name="quitarCliente" type="submit">Quitar Cliente</button>
                  <button id="añadir" name="btnAddCliente" type="submit">Añadir Cliente</button>
            </form> 
          </div>

          <div id="blqAddClientes" style="display: <?php echo $_SESSION['addClientes'] ? 'flex' : 'none'; ?>;">
            <div id="formAddClientes">

              <!-- FORMULARIO 1: Botones de tipo de cliente -->
              <form id="formbtnParEmpr" method="POST">
                <button id="particulares" type="submit" name="btnParticulares"
                  class="<?php echo (isset($_SESSION['botonActivo']) && $_SESSION['botonActivo'] === 'particulares') ? 'activo' : ''; ?>">
                  Particulares
                </button>

                <button id="empresas" type="submit" name="btnEmpresas"
                  class="<?php echo (isset($_SESSION['botonActivo']) && $_SESSION['botonActivo'] === 'empresas') ? 'activo' : ''; ?>">
                  Empresas
                </button>
              </form>

              <!-- FORMULARIO 2: Datos del cliente -->
              <form id="formDatosCliente" method="POST">
                <!-- CLIENTES PARTICULARES -->
                <div class="clsAddCli" id="AddCliParticulares" style="display: <?php echo $MonCliParticulares ? 'flex' : 'none'; ?>;">
                  <fieldset>
                    <legend>Datos personales / empresa</legend>

                    <label for="nombre">Nombre*</label>
                    <input type="text" id="nombre" name="nombre" required>

                    <label for="apellidos">Apellidos</label>
                    <input type="text" id="apellidos" name="apellidos">

                    <label for="tipo_documento">Tipo de documento*</label>
                    <select id="tipo_documento" name="tipo_documento" required>
                      <option value="">Seleccione</option>
                      <option value="NIF">NIF (Persona)</option>
                      <option value="CIF">CIF (Empresa)</option>
                    </select>

                    <label for="identidad">NIF/CIF*</label>
                    <input type="text" id="identidad" name="identidad" maxlength="9" required>

                    <label for="fecha_nacimiento">Fecha de nacimiento</label>
                    <input type="date" id="fecha_nacimiento" name="fecha_nacimiento">

                    <label for="correo">Correo electrónico</label>
                    <input type="email" id="correo" name="correo">

                    <label for="telefono">Teléfono</label>
                    <input type="tel" id="telefono" name="telefono">
                  </fieldset>
                </div>

                <!-- CLIENTES EMPRESAS -->
                <div class="clsAddCli" id="AddCliEmpresas" style="display: <?php echo $MonCliEmpresas ? 'flex' : 'none'; ?>;">
                  <h3>Empresa</h3>
                  <!-- Aquí añadirías campos específicos para empresas -->
                </div>
              </form>

              <!-- FORMULARIO 3: Botón Descartar -->
              <form id="formDescartar" method="POST">
                <button id="descartar" type="submit" name="btnCliDescartar">Descartar</button>
              </form>

            </div>
          </div>
        </aside>
    </header>
    <main> 
      <nav>
        <form method="POST" action="">
        <?php
          if ($categorias->num_rows > 0) {
            // Salida de cada filaa
            while($categoria = $categorias->fetch_assoc()) {
              echo '<input type="submit" name="categoria" class="categoria" value='.htmlspecialchars($categoria["NOMBRE"]).'>';
            }
          }else {
            echo "No hay categorías disponibles.";
          }
          ?>
        </form>
        </nav>
        <section>
          <form method="POST" action="">
            <?php
               // Mostrar los articulos del subartículo seleccionado
              if ($articulos->num_rows > 0) {
                // Salida de cada fila
                while($articulo = $articulos->fetch_assoc()) {
                  echo '<button type="submit" name="articulo" class="articulo" value="'.htmlspecialchars($articulo["ARTICULO"]).'" style="background-image: url(\'img/productos/Coca-cola.png\');">    
                        <span>'.htmlspecialchars($articulo["ARTICULO"]).'<br> ('.htmlspecialchars($articulo["PRECIO"]).' €)</span>    
                        </button>';    
                }
              } else {
                echo "No hay Articulos disponibles.";
              }
            ?>
            </form>
        </section>
        <aside>
          <form method="POST" action="">
            <?php
              // Mostrar la categoría seleccionada
              //echo "Categoría seleccionada: " . htmlspecialchars($_SESSION['categoria']);
              if ($subcategorias && $subcategorias->num_rows > 0) {
                // Salida de cada fila
                while($subcategoria = $subcategorias->fetch_assoc()) {
                  echo '<input type="submit" name="subcategoria" class="subcategoria" value="'.htmlspecialchars($subcategoria["NOMBRE"]).'">';
                }
              } else {
                echo "No hay subcategorías disponibles.";
              }
            ?>
          </form>
        </aside>
    </main>
    <footer>
        <div id="ingredientes">
          <button>Extra</button>
          <button>Sin</button>
          <form id="ingredientes" name="ingredientes" method="POST">
            <button>Tomate</button>
            <button>Lechuga</button>
            <button>Pan</button>
            <button>cebolla</button>
          </form>
        </div>
        <div id="informacion">
          <p>información del programa hora y fecha</p>
        </div>
        <?php
        echo 'POST CLIENTE='.$_POST['cliente'].' SESION ='.$_SESSION['cliente'].'</br>';
        echo 'BUSQUEDA ACTIVA: '.htmlspecialchars($_POST['buscarINP']).' '.'</br>';
        echo 'asignar Clientes: '.$asignarClientes.' '.'</br>';
        echo 'id empleado:'.$_SESSION['ID_EMPLEADO'].' a ver que tal</br>';
        echo 'addClientes:'.$addClientes.'</br>';
        echo 'sesion addClientes:'.$_SESSION['addClientes'];
        //  echo 'CATEGORIA='.htmlspecialchars($_SESSION['categoria']).'  -  POST= '.htmlspecialchars($_POST['categoria']).'<br>';
        //  echo 'SUBCATEGORIA='.htmlspecialchars($_SESSION['subcategoria']).'  -  POST= '.htmlspecialchars($_POST['subcategoria']).'<br>';
        //  echo 'ARTICULO='.htmlspecialchars($_SESSION['articulo']).'  -  POST= '.htmlspecialchars($_POST['articulo']).'<br>';
        //  echo 'PASSWORD  ='.htmlspecialchars($_SESSION['password']).'  -  POST= '.htmlspecialchars($_POST['password']).'<br>';
        //  echo 'USUARIO ='.htmlspecialchars($_SESSION['usuario']).'<br>';
        //  echo 'UBICACION ='.htmlspecialchars($_SESSION['ubicacion']).' -  POST= '.htmlspecialchars($_POST['ubicacion']).'<br>';
        //  echo 'MESA ='.htmlspecialchars($_SESSION['mesa']).' -  POST= '.htmlspecialchars($_POST['mesa']).'<br>';
        //  echo '$up_falseOcupada ='.$up_falseOcupada.'<br>  '; 
        //  echo 'vcarrito ='.htmlspecialchars($_SESSION['vcarrito']).' vcarrito= '.$_POST['vcarrito'].'<br>';
        ?>  
    </footer>
    <?php
      // Cerrar la conexión
      $conn->close();
    ?>
</body>
</html>

