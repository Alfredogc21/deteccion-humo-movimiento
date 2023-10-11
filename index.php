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

// Consultar último registro de movimiento en el salón 1
$movimientoSalon1 = obtenerUltimoMovimiento(25);

// Consultar último registro de movimiento en el salón 2
$movimientoSalon2 = obtenerUltimoMovimiento(26);

// Consultar último registro de movimiento en el salón 3
$movimientoSalon3 = obtenerUltimoMovimiento(27);

// Consultar último registro de movimiento en el salón 4
$movimientoSalon4 = obtenerUltimoMovimiento(32);

// Calcular la diferencia de días
$ultimoMovimiento = $movimientoSalon1['fecha'];
$fechaActual = date("Y-m-d");
$diaEstimado = calcularDiferenciaDias($fechaActual, $ultimoMovimiento);

require_once 'views/index.view.php';

// Recargar la página cada 3 segundos
header("Refresh:3; url=index.php");
?>
