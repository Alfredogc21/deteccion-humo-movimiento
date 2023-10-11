<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina principal</title>
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="icon" href="../imagenes/favicon.png">
</head>

<body>
    <div class="titulo">
        <h1>Registro de actividad</h1>
    </div>
    <section class="contenedor">
        <div class="contenedor__img"></div>
        <div class="contenedor__card contenedor__bano1 success">
            <h3>Baños 1</h3>
        </div>
        <div class="contenedor__card contenedor__bano2 success">
            <h3>Baños 2</h3>
        </div>
        <a href="tabla25.php" class="contenedor__card contenedor__salon1 <?php echo ($movimientoSalon1 == 1) ? 'danger' : 'success'; ?>">Salon 1</a>
        <a href="tabla26.php" class="contenedor__card contenedor__salon2 <?php echo ($movimientoSalon2 == 1) ? 'danger' : 'success'; ?>">Salon 2</a>
        <a href="tabla27.php" class="contenedor__card contenedor__salon3 <?php echo ($movimientoSalon3 == 1) ? 'danger' : 'success'; ?>">Salon 3</a>
        <a href="tabla32.php" class="contenedor__card contenedor__salon4 <?php echo ($movimientoSalon4 == 1) ? 'danger' : 'success'; ?>">Salon 4</a>

        <a href="pasillo1.php" class="contenedor__card contenedor__pasillo1 <?php echo ($movimiento == 1 || $humoPasillo == 1) ? 'danger' : 'success'; ?>">Pasillo 1</a>
        <a href="pasillo2.php" class="contenedor__card contenedor__pasillo2 <?php echo ($movimiento == 1 || $humoPasillo == 1) ? 'danger' : 'success'; ?>">Pasillo 2</a>

        <div class="contenedor__consultodo">
            <a href="tabla.php" class="contenedor__consultar">Consultar todo <i class="fa-solid fa-magnifying-glass"></i></a>
        </div>

        <div class="contenedor__alerta">
            <hr>
            <h1>Ultimo registro de movimiento: Salon 2 hace <?php echo $diaEstimado . ' dias'; ?> (<?php echo $resultados[0]['fecha']; ?>)</h1>
            <hr>
            <h1>Ultimo registro de humo: pasillo 2 hace <?php echo $diaEstimado . ' dias'; ?> (<?php echo $resultados[0]['fecha']; ?>)</h1>
            <hr>
        </div>

    </section>
    <!-- Agrega jQuery a tu página si aún no está incluido -->
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

    <!-- Incluye tu archivo JavaScript externo -->
    <!-- <script src="js/javascript.js"></script> -->
    <!-- Links iconos font-awesome -->
    <script src="https://kit.fontawesome.com/3f592185f1.js" crossorigin="anonymous"></script>
</body>

</html>