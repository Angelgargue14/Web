<?php
$_SESSION['cantidad']=1;
$_SESSION['descuento']=0;
// Consultar las categorías
$q_categorias = "SELECT NOMBRE FROM $dbname.CATEGORIAS ORDER BY ORDEN, FECHA_CREACION"; 
$categorias= mysqli_query($conn, $q_categorias);
if (!$categorias) {
  die("Error en la consulta: ". mysqli_error($conn));
}

// Procesar la categoría seleccionada
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['categoria']) && $_POST['categoria'] != '') {
    $_SESSION['categoria'] = $_POST['categoria']; // Guardar en sesión
    unset($_SESSION['subcategoria']); //borramos el contenido de subcategoria para que se muestren todos los art de la categoria
} else if (!isset($_SESSION['categoria']) || $_SESSION['categoria'] == '') {
    $_SESSION['categoria']='FOOD'; // Valor por defecto
}

// Consultar las subcategorías
$q_subcategorias = "SELECT NOMBRE FROM $dbname.SUBCATEGORIAS WHERE ID_CATEGORIA=(
  SELECT ID_CATEGORIA FROM $dbname.CATEGORIAS WHERE NOMBRE ='".mysqli_real_escape_string($conn,$_SESSION['categoria'])."')
  ORDER BY ORDEN, FECHA_CREACION"; 
$subcategorias= mysqli_query($conn, $q_subcategorias);
if (!$subcategorias) {
  die("Error en la consulta: ".mysqli_error($conn));
}

// Consultar la subcategoría seleccionada
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['subcategoria']) && $_POST['subcategoria'] != '') {
  $_SESSION['subcategoria'] = $_POST['subcategoria']; // Guardar en sesión
} else if (!isset($_SESSION['subcategoria']) || $_SESSION['subcategoria'] == '') {
  $_SESSION['subcategoria']=''; // Valor por defecto --ASIGNAR VARIABLE EN CONFIG
}


//Consultar los articulos
if ($_SESSION['subcategoria'] != ''){
  $q_articulos = "SELECT * FROM VARTICULOS WHERE SUBCATEGORIA='".mysqli_real_escape_string($conn, $_SESSION['subcategoria'])."' AND DISPONIBILIDAD=1 ORDER BY ARTICULO";
  $articulos= mysqli_query($conn, $q_articulos);
}else{
  $q_articulos = "SELECT * FROM VARTICULOS WHERE CATEGORIA='".mysqli_real_escape_string($conn,$_SESSION['categoria'])."' AND DISPONIBILIDAD=1 ORDER BY ARTICULO";
  $articulos=mysqli_query($conn, $q_articulos);   
}

//consultar el artículo seleccionado
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['articulo']) && $_POST['articulo'] != '') {
      $_SESSION['articulo'] = $_POST['articulo']; // Guardar en sesión
      //Comprobar si el articulo ya ha sido pedido
      $q_artEnCarrito = "SELECT COUNT(*) FROM $dbname.CARRITOS 
                        WHERE MESA='" . mysqli_real_escape_string($conn, $_SESSION['mesa']) . "' 
                        AND ID_ARTICULO=MD5('". mysqli_real_escape_string($conn, $_SESSION['articulo']) . "')";
      $obj_artEnCarrito=mysqli_query($conn, $q_artEnCarrito);
      $artEnCarrito=mysqli_fetch_row($obj_artEnCarrito)[0]; 

  if($artEnCarrito>0){
    //si el articulo ya está pedido en la mesa y se quiere añadir mas unidades
    //updateamos la cantidad con la nueva cantidad pedida
    $up_CantCarri="UPDATE $dbname.CARRITOS SET CANTIDAD=CANTIDAD+".mysqli_real_escape_string($conn,$_SESSION['cantidad'])." 
                    WHERE MESA='".mysqli_real_escape_string($conn,$_SESSION['mesa'])."' AND ID_ARTICULO=MD5('".mysqli_real_escape_string($conn,$_SESSION['articulo'])."')";
    //actualizando cantidad en carrito                
    mysqli_query($conn, $up_CantCarri);

  }else{
    //si el articulo no está aún en la mesa
    //Insertamos el nuevo artículo en la mesa
    $in_artiEnCarri = "INSERT INTO $dbname.CARRITOS (MESA, ID_ARTICULO, CANTIDAD) VALUES (
                                                    '".mysqli_real_escape_string($conn, $_SESSION['mesa'])."',
                                                    MD5('".mysqli_real_escape_string($conn, $_SESSION['articulo'])."'),
                                                    ".mysqli_real_escape_string($conn, $_SESSION['cantidad']).")";
    mysqli_query($conn, $in_artiEnCarri);
  }
} else if (!isset($_SESSION['articulo']) || $_SESSION['articulo'] == '') {
  $_SESSION['articulo']=''; //valor por defecto
}
?>