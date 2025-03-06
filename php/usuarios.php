<?php
//consultar usuario
if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['password']) && $_POST['password'] != ''){
  $_SESSION['password'] = $_POST['password'];
  $q_usuarios="SELECT NOMBRE FROM $dbname.EMPLEADOS WHERE CONTRASEÑA=MD5('".mysqli_real_escape_string($conn, $_SESSION['password'])."')";
  $usuario=mysqli_query($conn, $q_usuarios);

    if (mysqli_num_rows($usuario) > 0) {
      //Si hay un usuario logueado
      $row = mysqli_fetch_assoc($usuario);
      $_SESSION['usuario'] = $row['NOMBRE'];
      $usuarioLogueado=false;
      if (empty($_SESSION ['mesa'])) {
        $mesaBloqueo=true; //aparece la ventana de seleccion de mesa div_mesas y div_mesas_bloqueo
      }else{
        $mesaBloqueo=false;  //salimos de la ventana de seleccion de mesa
      }
    }else{
      //No hay un usuario logueado  
      $usuarioLogueado=true;  
      $_SESSION['password']=null;
    }
    if (!$usuario) {
      die('Error en la consulta: '  .mysqli_error($conn));
    }
}

//Desloguear usuario, si cumple las condiciones se limpian variables y se pone $usuarioLogueado=true, para indicar que no hay usuario logueado
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['logout'])) {
  unset($_SESSION['password']); // Borra la variable password  de sesión
  unset($_SESSION['usuario']); //Borra la variable usuario de sesión
  $usuarioLogueado=true;  
}

//Verificacion de sesión activa
//Si la variable de sesión $_SESSION['password'] está vacía, se considera que no hay un usuario logueado y se establece $usuarioLogueado como true.
if ($_SESSION['password']==''){
  $usuarioLogueado=true;    
}

?>