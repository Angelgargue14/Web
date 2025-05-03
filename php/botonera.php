<?php
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
    }else{
        $_SESSION['cliente']="Cliente";
    }
}
?>