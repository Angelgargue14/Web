<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['vcarrito']) && $_POST['vcarrito'] != '') {
    $_SESSION['vcarrito'] = $_POST['vcarrito']; // Guardar en sesión el ID_ARTICULO seleccionado en el monitor
}
?>