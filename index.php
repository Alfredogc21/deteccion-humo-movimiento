<?php
require_once 'conexion/conexion.php';

$movimiento = '';

//Consultar ultimo registro de movimiento 1
$statement = $conexion->prepare("SELECT * FROM regisalones WHERE estado = 1 ORDER BY id DESC LIMIT 1");
$statement->execute();
$resultados = $statement->fetchAll();

//Calcular fecha actual menos la fecha de la ultima actualizacion
$ultimo = $resultados[0]['fecha'];
$fechaActual = date("Y-m-d");
$fecha = strtotime($fechaActual);
$fechaUltimo = strtotime($ultimo);
$diferencia = $fecha - $fechaUltimo;
$diaEstimado = $diferencia / (60 * 60 * 24);
$diaEstimado = round($diaEstimado);

//Saber si el movimiento es 0 o 1 para asignar color
$consultarMovimiento1 = $conexion->prepare("SELECT * FROM regisalones WHERE salones_id = 25 ORDER BY id DESC LIMIT 1");
$consultarMovimiento1->execute();
$resultadoMovimiento1 = $consultarMovimiento1->fetchAll();
$movimientoSalon1 = $resultadoMovimiento1[0]['estado'];

$consultarMovimiento2 = $conexion->prepare("SELECT * FROM regisalones WHERE salones_id = 26 ORDER BY id DESC LIMIT 1");
$consultarMovimiento2->execute();
$resultadoMovimiento2 = $consultarMovimiento2->fetchAll();
$movimientoSalon2 = $resultadoMovimiento2[0]['estado'];

$consultarMovimiento3 = $conexion->prepare("SELECT * FROM regisalones WHERE salones_id = 27 ORDER BY id DESC LIMIT 1");
$consultarMovimiento3->execute();
$resultadoMovimiento3 = $consultarMovimiento3->fetchAll();
$movimientoSalon3 = $resultadoMovimiento3[0]['estado'];

$consultarMovimiento4 = $conexion->prepare("SELECT * FROM regisalones WHERE salones_id = 32 ORDER BY id DESC LIMIT 1");
$consultarMovimiento4->execute();
$resultadoMovimiento4 = $consultarMovimiento4->fetchAll();
$movimientoSalon4 = $resultadoMovimiento4[0]['estado'];

//Saber si el el valor de humo es 0 o 1 para asignar color

require_once 'views/index.view.php';

//Recargar pagina cada 5 segundos
header("Refresh:2; url=index.php");


?>