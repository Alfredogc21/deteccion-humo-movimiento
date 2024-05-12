<?php
require_once '../conexion/conexion.php';

//file_put_contents('debug.txt', print_r($_POST, true)); // Escribe los datos recibidos en un archivo de registro

if ($_POST) {
    $mac = isset($_POST['mac']) ? $mac = $_POST['mac'] : $mac = null;

    $valor = isset($_POST['valor']) ? $_POST['valor'] : null;
    $sensor = isset($_POST['sensor']) ? $_POST['sensor'] : null;

    if ($valor !== null && $mac !== null && $sensor !== null) {

        if ($sensor == 34 || $sensor == 32) {
            //Insertamos los datos de humo
            // Insertamos los datos de movimiento
            $statement = $conexion->prepare("INSERT INTO registrohumo (id, estado, fecha, mac, sensorhumo_id) VALUES (null, :estado, CURRENT_TIMESTAMP, :mac, :sensorhumo)");
            $statement->execute(array(':estado' => $valor, ':mac' => $mac, ':sensorhumo' => $sensor));

            //Verificamos si se insertaron los datos
            if ($statement->rowCount() > 0) {
                echo "Datos insertados correctamente";
            } else {
                echo "No se insertaron los datos";
            }
        } else {
            // Insertamos los datos de movimiento
            $statement = $conexion->prepare("INSERT INTO registromovi (id, estado, fecha, mac, sensormovi_id) VALUES (null, :estado, CURRENT_TIMESTAMP, :mac, :sensormovimiento)");
            $statement->execute(array(':estado' => $valor, ':mac' => $mac, ':sensormovimiento' => $sensor));

            //Verificamos si se insertaron los datos
            if ($statement->rowCount() > 0) {
                echo "Datos insertados correctamente";
            } else {
                echo "No se insertaron los datos";
            }
        }
    } else {
        echo "No se han enviado los datos";
    }
} else {
    echo "No se han enviado los datos";
}
