<?php
// Incluir el archivo de conexión a la base de datos
require_once '../conexion/conexion.php';

// Función para obtener el último registro de movimiento de un salón específico
function obtenerUltimoMovimiento($salonId) {
    global $conexion;
    $statement = $conexion->prepare("SELECT * FROM registromovi WHERE salones_id = :salonId ORDER BY id DESC LIMIT 1");
    $statement->bindParam(':salonId', $salonId, PDO::PARAM_INT);
    $statement->execute();
    $resultado = $statement->fetch(PDO::FETCH_ASSOC);
    return $resultado;
}

// Función para obtener el último registro de estado de humo de un pasillo específico
function obtenerUltimoEstadoHumo($pasillo_id) {
    global $conexion;
    $statement = $conexion->prepare("SELECT * FROM registrohumo WHERE pasillos_id = :pasillo_id ORDER BY id DESC LIMIT 1");
    $statement->bindParam(':pasillo_id', $pasillo_id, PDO::PARAM_INT);
    $statement->execute();
    $resultado = $statement->fetch(PDO::FETCH_ASSOC);
    return $resultado;
}

// Crear un arreglo para almacenar los datos
$salon1Data = obtenerUltimoMovimiento(32);
$salon2Data = obtenerUltimoMovimiento(34);
$salon3Data = obtenerUltimoMovimiento(35);
$salon4Data = obtenerUltimoMovimiento(25);
$pasillo1Data = obtenerUltimoMovimiento(26);
$pasillo2Data = obtenerUltimoMovimiento(27);
$humoPasillo1 = obtenerUltimoEstadoHumo(1);
$humoPasillo2 = obtenerUltimoEstadoHumo(2);

// Combinar los datos en un arreglo
$data = array(
    'salon1' => $salon1Data,
    'salon2' => $salon2Data,
    'salon3' => $salon3Data,
    'salon4' => $salon4Data,
    'pasillo1' => $pasillo1Data,
    'pasillo2' => $pasillo2Data,
    'humoPasillo1' => $humoPasillo1,
    'humoPasillo2' => $humoPasillo2,
);

// Devolver los datos en formato JSON
header('Content-Type: application/json');
echo json_encode($data);


?>
