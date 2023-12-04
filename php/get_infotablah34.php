<?php
require_once '../conexion/conexion.php';

$filasPorPagina = 10; // Número de filas por página

$statement = $conexion->prepare("SELECT COUNT(*) as total FROM registrohumo");
$statement->execute();
$totalFilas = $statement->fetch()['total'];

$paginaActual = isset($_GET['pagina']) ? $_GET['pagina'] : 1; // Página actual

// Calcular el número total de páginas
$totalPaginas = ceil($totalFilas / $filasPorPagina);

// Calcular el índice de inicio y final para la consulta SQL
$inicio = ($paginaActual - 1) * $filasPorPagina;
$fin = $filasPorPagina;

// $statement = $conexion->prepare("SELECT * FROM regisalones ORDER BY id DESC LIMIT $inicio, $fin");
$statement = $conexion->prepare("SELECT registrohumo.id, registrohumo.estado, registrohumo.fecha, registrohumo.mac, sensorhumo.nombre_pasillos AS pasillos
FROM registrohumo
INNER JOIN sensorhumo ON registrohumo.sensorhumo_id = sensorhumo.id
WHERE sensorhumo_id = 34
ORDER BY id DESC
LIMIT $inicio, $fin;");
$statement->execute();
$resultados = $statement->fetchAll();

// Crear un array para almacenar los resultados
$datos = array();



foreach ($resultados as $fila) {
    // Agregar cada fila a un array 
    $datos[] = array(
        'id' => $fila['id'],
        'estado' => $fila['estado'],
        'fecha' => $fila['fecha'],
        'mac' => $fila['mac'],
        'pasillos' => $fila['pasillos']
    );
}

// Devolver los datos en formato JSON
header('Content-Type: application/json');
echo json_encode($datos);
?>