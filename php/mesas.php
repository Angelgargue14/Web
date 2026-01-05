<?php
// Consultar las distintas ubicaciones
$q_ubicaciones = "SELECT DISTINCT UBICACION FROM $dbname.MESAS ORDER BY MESA ASC";
$ubicaciones= mysqli_query($conn, $q_ubicaciones);
if (!$ubicaciones) {
    die("Error en la consulta: ". mysqli_error($conn));
}

// Procesar la ubicación seleccionada
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['ubicacion']) && $_POST['ubicacion'] != '') {
    $_SESSION['ubicacion'] = $_POST['ubicacion']; // Guardar en sesión
    $mesaBloqueo=true; //aparece la ventana de seleccion de mesa div_mesas y div_mesas_bloqueo
} else if (!isset($_SESSION['ubicacion']) || $_SESSION['ubicacion'] == '') {
    $_SESSION['ubicacion']='SALON 1'; // Valor por defecto
}

//(MESA, NOMBRE, MAX_COMENSALES, MIN_COMENSALES, OCUPADA, UBICACION, TIPO_MESA, NOTAS)
// Consultar información de las mesas de la ubicacion
$q_mesas = "SELECT MESA, NOMBRE, MAX_COMENSALES ,MIN_COMENSALES ,OCUPADA ,UBICACION , TIPO_MESA, NOTAS 
            FROM $dbname.MESAS WHERE UBICACION='".mysqli_real_escape_string($conn,$_SESSION['ubicacion'])."' 
            ORDER BY MESA ASC";
$mesas= mysqli_query($conn, $q_mesas);
if (!$mesas) {
    die("Error en la consulta: ". mysqli_error($conn));
}


// limpiar mesa y pasar a seleccion de mesa
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["btn_mesa"])) {
    // Verificar que $_SESSION['mesa'] esté definida  
    if (isset($_SESSION["mesa"])) {
      // Consulta para contar las líneas del carrito si las tuviera
      $q_cuentaLineas="SELECT COUNT(C.MESA) AS total FROM $dbname.MESAS M, $dbname.CARRITOS C WHERE M.MESA=C.MESA AND C.MESA='".htmlspecialchars($_SESSION['mesa'])."'";
      $cuentaLineas=mysqli_query($conn, $q_cuentaLineas);
      if ($cuentaLineas) {
          $row = mysqli_fetch_assoc($cuentaLineas);
          $cuentaLineas = $row['total'];

          // Si la mesa anterior no tiene líneas liberamos la mesa
          if ($cuentaLineas == 0) {
              $up_falseOcupada = "UPDATE $dbname.MESAS SET OCUPADA=FALSE WHERE MESA='".htmlspecialchars($_SESSION['mesa']). " '";
              if (!mysqli_query($conn, $up_falseOcupada)) {
                  echo "Error al actualizar la mesa: ".mysqli_error($conn);
              }
          }
      } else {
          echo "Error en la consulta de conteo: ".mysqli_error($conn);
      }
    }
  unset($_SESSION['mesa']); // Borra la variable mesa  de sesión
  $mesaBloqueo=true; //aparece la ventana de seleccion de mesa div_mesas y div_mesas_bloqueo
}

// Cuando el usuario selecciona una mesa:
if ($_SERVER["REQUEST_METHOD"]=="POST" && isset($_POST["mesa"])) {
  // Guardar la nueva mesa seleccionada en la sesión
  $_SESSION['mesa'] = mysqli_real_escape_string($conn, $_POST['mesa']);
  if (isset($_SESSION["mesa"])) {
    $up_trueOcupada = "UPDATE $dbname.MESAS SET OCUPADA=TRUE WHERE MESA='".htmlspecialchars($_SESSION['mesa'])." '";
    if (!mysqli_query($conn, $up_trueOcupada)) {
      echo "Error al actualizar la mesa: ".mysqli_error($conn);
    } 
  }
  $mesaBloqueo = false; // Salimos de la ventana de selección de mesa
}
?>



  