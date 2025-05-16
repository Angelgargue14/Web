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


?>