<?php
require_once '../conexion/conexion.php';

$filasPorPagina = 10; // Número de filas por página

// Parámetros para filtrar por tipo (registromovi o registrohumo)
$tipo = isset($_GET['tipo']) ? $_GET['tipo'] : 'registromovi';

// Calcular el número total de páginas
if ($tipo === 'registromovi') {
    $statement = $conexion->prepare("SELECT COUNT(*) as total FROM registromovi");
} elseif ($tipo === 'registrohumo') {
    $statement = $conexion->prepare("SELECT COUNT(*) as total FROM registrohumo");
} else {
    die('Tipo no válido');
}

$statement->execute();
$totalFilas = $statement->fetch()['total'];
$totalPaginas = ceil($totalFilas / $filasPorPagina);

// Calcular el índice de inicio y final para la consulta SQL
$inicio = isset($_GET['inicio']) ? $_GET['inicio'] : 0; // Índice de inicio
$fin = isset($_GET['fin']) ? $_GET['fin'] : 10; // Índice de fin

// SQL (regisalones o regispasillos)
if ($tipo === 'registromovi') {
    $query = "SELECT registromovi.id, registromovi.estado, registromovi.fecha, registromovi.mac, sensormovi.nombre_salones AS sensormovi FROM registromovi INNER JOIN sensormovi ON sensormovi.id = registromovi.sensormovi_id  ORDER BY id DESC LIMIT $inicio, $fin";
} elseif ($tipo === 'registrohumo') {
    $query = "SELECT registrohumo.id, registrohumo.estado, registrohumo.fecha, registrohumo.mac, sensorhumo.nombre_pasillos AS sensorhumo FROM registrohumo INNER JOIN sensorhumo ON sensorhumo.id = registrohumo.sensorhumo_id ORDER BY id DESC LIMIT $inicio, $fin";
}

$statement = $conexion->prepare($query);
$statement->execute();
$resultados = $statement->fetchAll();

// Crear un array para almacenar los resultados
$datos = array();

foreach ($resultados as $fila) {
    // Agregar cada fila a un array asociativo
    $datos[] = array(
        'id' => $fila['id'],
        'estado' => $fila['estado'],
        'fecha' => $fila['fecha'],
        'mac' => $fila['mac'],
        'nombre' => $fila['sensormovi'] ?? $fila['sensorhumo']
    );
}

// Devolver los datos en formato JSON
header('Content-Type: application/json');
echo json_encode($datos);
?>
