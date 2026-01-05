<?php
/**
 * ARCHIVO DE CONFIGURACIÓN GLOBAL - BALTRETAIL
 * Versión optimizada para PHP 8.x
 */

// --- 1. CONFIGURACIÓN DE BASE DE DATOS ---
$servername = "127.0.0.1";
$username   = "loty";
$password   = "guerra94"; 
$dbname     = "BALTRETAIL";

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión 
if ($conn->connect_error) {
    die("Error crítico de conexión: " . $conn->connect_error);
}

// Establecer charset para evitar problemas con tildes/eñes
$conn->set_charset("utf8mb4");


// --- 2. INICIALIZACIÓN DE VARIABLES DE ESTADO (Evita PHP Warnings) ---
// Estas variables se usan en index.php antes de ser definidas. 
// Al darles un valor inicial, los "Undefined variable" desaparecen.

// Almacena el estado del usuario. Si es null, el sistema asume que no hay sesión activa.
$usuarioLogueado = null; 

// Define si el panel actual está bloqueado por otro proceso o usuario.
$mesaBloqueo     = false; 

// Controlan la visibilidad de los bloques de clientes en el dashboard.
$MonCliParticulares = false; 
$MonCliEmpresas     = false; 

// Indican si los formularios de gestión de clientes están activos o deben mostrarse.
$asignarClientes    = false; 
$addClientes        = false; 


// --- 3. GESTIÓN DE PARÁMETROS RECIBIDOS ($_GET / $_POST) ---
// Usamos el operador null coalescing (??) para evitar "Undefined array key".

// ID del cliente seleccionado para edición o consulta.
$clienteId = $_REQUEST['cliente'] ?? null; 

// Texto de búsqueda introducido por el usuario en el buscador.
$buscarINP = $_REQUEST['buscarINP'] ?? ""; 

// --- 4. CONFIGURACIÓN API FACTURASCRIPTS ---
// URL base de la API y Clave de acceso generada en el panel.
$fs_url_api = 'http://localhost/facturascripts/api/v1';
$fs_api_key = 'aMkfzKuHCBBHGh8aLaL0';


// --- 5. FUNCIONES DE UTILIDAD PARA LIMPIEZA ---
/**
 * Función segura para imprimir texto en HTML.
 * Soluciona el error "Passing null to parameter #1" de PHP 8.1+
 * Uso: echo safe_html($variable);
 */
function safe_html($string) {
    return htmlspecialchars($string ?? '', ENT_QUOTES, 'UTF-8');
}
?>