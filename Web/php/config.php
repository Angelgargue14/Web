<?php
$servername="127.0.0.1";
$username="loty";
$password="guerra94"; 
$dbname="BALTRETAIL";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión 
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
