<?php
// Consultar las categorías
$q_categorias = "SELECT NOMBRE FROM $dbname.CATEGORIAS ORDER BY ORDEN, FECHA_CREACION"; 
$categorias= mysqli_query($conn, $q_categorias);
if (!$categorias) {
  die("Error en la consulta: ". mysqli_error($conn));
}

// Procesar la categoría seleccionada
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['categoria']) && $_POST['categoria'] != '') {
    $_SESSION['categoria'] = $_POST['categoria']; // Guardar en sesión
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
  $_SESSION['subcategoria']='BURGERS'; // Valor por defecto --ASIGNAR VARIABLE EN CONFIG
}


//Consultar los articulos
$q_articulos = "SELECT ART.NOMBRE, ART.PRECIO FROM $dbname.ARTICULOS ART, $dbname.SUBCATEGORIAS SUB, $dbname.SUBCAT_ART SUBART 
                WHERE ART.ID_ARTICULO=SUBART.ID_ARTICULO AND SUB.ID_SUBCATEGORIA = SUBART.ID_SUBCATEGORIA
                AND SUB.NOMBRE='".mysqli_real_escape_string($conn, $_SESSION['subcategoria'])."'";
$articulos= mysqli_query($conn, $q_articulos);
if (!$articulos) {
  die("Error en la consulta: " . mysqli_error($conn));
}

//consultar el artículo seleccionado
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['articulo']) && $_POST['articulo'] != '') {
  $_SESSION['articulo'] = $_POST['articulo']; // Guardar en sesión
  //Inserción en carrito del artículo seleccionado:
  

} else if (!isset($_SESSION['articulo']) || $_SESSION['articulo'] == '') {
  $_SESSION['articulo']=''; // Valor por defecto --ASIGNAR VARIABLE EN CONFIG
}
?>