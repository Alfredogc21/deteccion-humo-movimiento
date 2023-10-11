<?php

require_once 'conexion/conexion.php';

$filasPorPagina = 10; // Número de filas por página

$statement = $conexion->prepare("SELECT COUNT(*) as total FROM regisalones WHERE salones_id = 35");
$statement->execute();
$totalFilas = $statement->fetch()['total'];

$paginaActual = isset($_GET['pagina']) ? $_GET['pagina'] : 1; // Página actual

// Calcular el número total de páginas
$totalPaginas = ceil($totalFilas / $filasPorPagina);

// Calcular el índice de inicio y final para la consulta SQL
$inicio = ($paginaActual - 1) * $filasPorPagina;
$fin = $filasPorPagina;

$statement = $conexion->prepare("SELECT regisalones.id, regisalones.estado, regisalones.fecha, regisalones.mac, salones.nombre_salones AS salones FROM regisalones INNER JOIN salones ON regisalones.salones_id = salones.id WHERE salones.id = 35 ORDER BY id DESC LIMIT $inicio, $fin");
$statement->execute();
$resultados = $statement->fetchAll();

//Saber si el movimiento es 0 o 1 para asignar color
$consultarMovimiento = $conexion->prepare("SELECT * FROM regisalones WHERE salones_id = 35 ORDER BY id DESC LIMIT 1");
$consultarMovimiento->execute();
$resultadoMovimiento = $consultarMovimiento->fetchAll();

$movimiento = $resultadoMovimiento[0]['estado'];

require_once 'views/tabla.view35.php';

?>
