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
?>