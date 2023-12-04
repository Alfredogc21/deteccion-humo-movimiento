<?php
require_once '../conexion/conexion.php';

$filasPorPagina = 10; // Número de filas por página

$statement = $conexion->prepare("SELECT COUNT(*) as total FROM registromovi");
$statement->execute();
$totalFilas = $statement->fetch()['total'];

$paginaActual = isset($_GET['pagina']) ? $_GET['pagina'] : 1; // Página actual

// Calcular el número total de páginas
$totalPaginas = ceil($totalFilas / $filasPorPagina);

// Calcular el índice de inicio y final para la consulta SQL
$inicio = ($paginaActual - 1) * $filasPorPagina;
$fin = $filasPorPagina;

// $statement = $conexion->prepare("SELECT * FROM regisalones ORDER BY id DESC LIMIT $inicio, $fin");
$statement = $conexion->prepare("SELECT registromovi.id, registromovi.estado, registromovi.fecha, registromovi.mac, sensormovi.nombre_salones AS salones
FROM registromovi
INNER JOIN sensormovi ON registromovi.sensormovi_id = sensormovi.id
WHERE sensormovi_id = 33
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
        'salones' => $fila['salones']
    );
}

// Devolver los datos en formato JSON
header('Content-Type: application/json');
echo json_encode($datos);
?>