<?php

require_once 'conexion/conexion.php';

// Función para obtener el último registro de movimiento de un salón específico
function obtenerUltimoMovimiento($salonId) {
    global $conexion;
    $statement = $conexion->prepare("SELECT * FROM regisalones WHERE salones_id = :salonId ORDER BY id DESC LIMIT 1");
    $statement->bindParam(':salonId', $salonId, PDO::PARAM_INT);
    $statement->execute();
    $resultado = $statement->fetch();
    return $resultado;
}

// Función para calcular la diferencia de días entre dos fechas
function calcularDiferenciaDias($fecha1, $fecha2) {
    $fecha1 = strtotime($fecha1);
    $fecha2 = strtotime($fecha2);
    $diferencia = $fecha1 - $fecha2;
    return round($diferencia / (60 * 60 * 24));
}

function obtenerUltimoEstadoHumo($pasillo_id) {
    global $conexion;
    $statement = $conexion->prepare("SELECT * FROM regispasillos WHERE pasillos_id  = :pasillo_id ORDER BY id DESC LIMIT 1");
    $statement->bindParam(':pasillo_id', $pasillo_id, PDO::PARAM_INT);
    $statement->execute();
    $resultado = $statement->fetch();
    return $resultado;
}

// Consultar último registro de movimiento en el salón 1
$movimientoSalon1 = obtenerUltimoMovimiento(32);

// Consultar último registro de movimiento en el salón 2
$movimientoSalon2 = obtenerUltimoMovimiento(34);

// Consultar último registro de movimiento en el salón 3
$movimientoSalon3 = obtenerUltimoMovimiento(35);

// Consultar último registro de movimiento en el salón 4
$movimientoSalon4 = obtenerUltimoMovimiento(25);

// Consultar último registro de movimiento en el pasillo 1
$movimientoPasillo1 = obtenerUltimoMovimiento(26);

// Consultar último registro de movimiento en el pasillo 2
$movimientoPasillo2 = obtenerUltimoMovimiento(27);

// Consultar último registro de humo en el pasillo 1
$padilloHumo1 = obtenerUltimoEstadoHumo(1);

// Consultar último registro de humo en el pasillo 2
$padilloHumo2 = obtenerUltimoEstadoHumo(2);

// Calcular la diferencia de días
$ultimoMovimiento = isset($movimientoSalon1['fecha']) ? $movimientoSalon1['fecha'] : '--------';
$fechaActual = date("Y-m-d");
$diaEstimado = calcularDiferenciaDias($fechaActual, $ultimoMovimiento);

require_once 'views/index.view.php';

?>
