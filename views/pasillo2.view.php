<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pasillo 2</title>
    <link rel="stylesheet" href="css/pasillos.css">
    <link rel="icon" href="../imagenes/favicon.png">
</head>

<body>
    <div class="container">
        <h1>Seleccione el sensor del pasillo 2</h1>
        <div class="tbcover">
            <a href="index.php" class="btn-tambah">Regresar</a>
        </div>
    </div>

    <section class="contenedor">
        <a href="tabla.php" class="contenedor__pasillo contenedor__movimiento <?php echo ($movimiento == 1) ? 'danger' : 'success'; ?>">Sensor de movimiento</a>
        <a href="tabla.php" class="contenedor__pasillo contenedor__humo <?php echo ($movimiento == 1) ? 'danger' : 'success'; ?>">Sensor de humo</a>
    </section>

    <!-- Recargar Pagina -->
    <script src="js/recarga.js"></script>
</body>

</html>