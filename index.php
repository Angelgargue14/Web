<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styleGrid.css">
    <link rel="stylesheet" href="css/Categorias.css">  
    <link rel="stylesheet" href="css/Headers.css">
    <link rel="stylesheet" href="css/Mesas.css">
    <link rel="stylesheet" href="css/Monitor.css">  
    <link rel="stylesheet" href="css/typicons.css">
    <link rel="stylesheet" href="css/scrollbar.css">    
    <script src="sumain.js" defer></script> 
    <title>LottyShop</title>    
</head>
<body>
<?php
session_start(); // Iniciar la sesión   

include 'php/config.php';
include 'php/articulos.php';
include 'php/usuarios.php';
include 'php/mesas.php';
include 'php/Monitor.php';
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
            <button type="button" class="button" id="desaparece"></button>
            <button type="button" class="button" onclick="addDigit(0)">0</button>
            <button type="button" class="button" id="desaparece"></button>
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
                        <span><b>'.htmlspecialchars($mesa["MESA"]).'</b ><br>
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
              <button type="submit  " name="btn_mesa"><?php echo $_SESSION['mesa']; ?></button>
            </form>
        </nav>
        <section>
            <div id="Monitor">
            <article class="carritoLista">
              <h2>Montado de chorizo</h2>
              <h2>8€</h2>
              <p><span>2</span>4€ / unidad</p>
            </article>
            </div>
        </section>  
        <aside>
            aside
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
                   echo '<button type="submit" name="articulo" class="articulo" value="'.htmlspecialchars($articulo["NOMBRE"]).'" style="background-image: url(\'img/productos/Coca-cola.png\');">    
                         <span>'.htmlspecialchars($articulo["NOMBRE"]).'<br> ('.htmlspecialchars($articulo["PRECIO"]).' €)</span>    
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
        <?php
          echo 'CATEGORIA='.htmlspecialchars($_SESSION['categoria']).'  -  POST= '.htmlspecialchars($_POST['categoria']).'<br>';
          echo 'SUBCATEGORIA='.htmlspecialchars($_SESSION['subcategoria']).'  -  POST= '.htmlspecialchars($_POST['subcategoria']).'<br>';
          echo 'ARTICULO='.htmlspecialchars($_SESSION['articulo']).'  -  POST= '.htmlspecialchars($_POST['articulo']).'<br>';
          echo 'PASSWORD  ='.htmlspecialchars($_SESSION['password']).'  -  POST= '.htmlspecialchars($_POST['password']).'<br>';
          echo 'USUARIO ='.htmlspecialchars($_SESSION['usuario']).'<br>';
          echo 'UBICACION ='.htmlspecialchars($_SESSION['ubicacion']).' -  POST= '.htmlspecialchars($_POST['ubicacion']).'<br>';
          echo 'MESA ='.htmlspecialchars($_SESSION['mesa']).' -  POST= '.htmlspecialchars($_POST['mesa']).'<br>';
          echo '$up_falseOcupada ='.$up_falseOcupada.'<br>  '; 
          echo  '$q_cuentaLineas= '.$q_cuentaLineas;  
        ?>  
    </footer>
    <?php
      // Cerrar la conexión
      $conn->close();
    ?>
</body>
</html>
