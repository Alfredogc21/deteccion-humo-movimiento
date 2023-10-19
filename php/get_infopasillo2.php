<?php
require_once '../conexion/conexion.php';

//Saber si el movimiento es 0 o 1 para asignar color
$consultarMovimiento = $conexion->prepare("SELECT * FROM registromovi WHERE salones_id = 27 ORDER BY id DESC LIMIT 1");
$consultarMovimiento->execute();
$resultadoMovimiento = $consultarMovimiento->fetchAll();

//Saber si el sensor de humo esta en 0 o 1
$consultarPasillo = $conexion->prepare("SELECT * FROM registrohumo ORDER BY id DESC LIMIT 1");
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