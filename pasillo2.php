<?php
require_once 'conexion/conexion.php';

//Saber si el movimiento es 0 o 1 para asignar color
$consultarMovimiento = $conexion->prepare("SELECT * FROM regisalones ORDER BY id DESC LIMIT 1");
$consultarMovimiento->execute();
$resultadoMovimiento = $consultarMovimiento->fetchAll();

$movimiento = $resultadoMovimiento[0]['estado'];

require_once 'views/pasillo1.view.php';

?>