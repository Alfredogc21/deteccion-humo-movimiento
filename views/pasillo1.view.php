<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pasillo 1</title>
    <link rel="stylesheet" href="css/pasillos.css">
    <link rel="icon" href="../imagenes/favicon.png">
</head>

<body>
<div class="container">
    <h1>Seleccione el sensor del pasillo 1</h1>
    <div class="tbcover">
        <a href="index.php" class="btn-tambah">Regresar</a>
    </div>
</div>

<section class="contenedor">
    <a href="tabla.php" class="contenedor__pasillo contenedor__movimiento <?php echo ($movimiento == 1) ? 'danger' : 'success'; ?>">Sensor de movimiento</a>
    <a href="tabla.php" class="contenedor__pasillo contenedor__humo <?php echo ($humoPasillo == 1) ? 'danger' : 'success'; ?>">Sensor de humo</a>
</section>

    <!-- Links iconos font-awesome -->
    <script src="https://kit.fontawesome.com/3f592185f1.js" crossorigin="anonymous"></script>
</body>

</html>