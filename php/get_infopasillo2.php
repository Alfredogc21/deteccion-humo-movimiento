<?php
require_once '../conexion/conexion.php';

//Saber si el movimiento es 0 o 1 para asignar color
$consultarMovimiento = $conexion->prepare("SELECT * FROM registromovi WHERE sensormovi_id = 25 ORDER BY id DESC LIMIT 1");
$consultarMovimiento->execute();
$resultadoMovimiento = $consultarMovimiento->fetchAll();

//Saber si el sensor de humo esta mayor o menor a 1000 para asignar color
$consultarPasillo = $conexion->prepare("SELECT * FROM registrohumo WHERE sensorhumo_id = 32 ORDER BY id DESC LIMIT 1");
$consultarPasillo->execute();
$resultadoPasillo = $consultarPasillo->fetchAll();

$humoPasillo = $resultadoPasillo[0]['estado'];
$movimiento = $resultadoMovimiento[0]['estado'];

// Crear un array para almacenar los resultados
$datos = array();

// Agregar cada fila a un array asociativo
$datos[] = array(
    'estadohumoPasillo' => $humoPasillo,
    'estadomovimientopasillo' => $movimiento
);

// Devolver los datos en formato JSON
header('Content-Type: application/json');
echo json_encode($datos);

?>