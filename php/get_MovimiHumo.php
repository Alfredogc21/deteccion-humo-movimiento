<?php
// Incluir el archivo de conexión a la base de datos
require_once '../conexion/conexion.php';

// Función para obtener el último registro de movimiento de un salón específico
function obtenerUltimoMovimiento($sensorMovimiento) {
    global $conexion;
    $statement = $conexion->prepare("SELECT * FROM registromovi WHERE sensormovi_id = :sensorMovi ORDER BY id DESC LIMIT 1");
    $statement->bindParam(':sensorMovi', $sensorMovimiento, PDO::PARAM_INT);
    $statement->execute();
    $resultado = $statement->fetch(PDO::FETCH_ASSOC);
    return $resultado;
}

// Función para obtener el último registro de estado de humo de un pasillo específico
function obtenerUltimoEstadoHumo($sensorHumo) {
    global $conexion;
    $statement = $conexion->prepare("SELECT * FROM registrohumo WHERE sensorhumo_id = :sensorHumoId ORDER BY id DESC LIMIT 1");
    $statement->bindParam(':sensorHumoId', $sensorHumo, PDO::PARAM_INT);
    $statement->execute();
    $resultado = $statement->fetch(PDO::FETCH_ASSOC);
    return $resultado;
}

// Crear un arreglo para almacenar los datos
$salon1Data = obtenerUltimoMovimiento(18); //Salon1: movimiento 18
$salon2Data = obtenerUltimoMovimiento(35); //Salon2: movimiento 35
$salon3Data = obtenerUltimoMovimiento(26); //Salon3: movimiento 26
$salon4Data = obtenerUltimoMovimiento(27); //Salon4: movimiento 27
$pasillo1Data = obtenerUltimoMovimiento(33); //Pasillo1: movimiento 33
$pasillo2Data = obtenerUltimoMovimiento(25); //Pasillo2: movimiento 25
$humoPasillo1 = obtenerUltimoEstadoHumo(34); //Pasillo1: 34 el de humo
$humoPasillo2 = obtenerUltimoEstadoHumo(32); //Pasillo2: 32 el de humo

// Combinar los datos en un arreglo
$data = array(
    'salon1' => $salon1Data,
    'salon2' => $salon2Data,
    'salon3' => $salon3Data,
    'salon4' => $salon4Data,
    'pasillo1' => $pasillo1Data,
    'pasillo2' => $pasillo2Data,
    'pasillo1humo' => $humoPasillo1,
    'pasillo2humo' => $humoPasillo2,
    'humo1' => $humoPasillo1,
    'humo2'=> $humoPasillo2,
);

// Devolver los datos en formato JSON
header('Content-Type: application/json');
echo json_encode($data);


?>
