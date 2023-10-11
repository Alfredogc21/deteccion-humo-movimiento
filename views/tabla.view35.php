<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registros</title>
    <link rel="stylesheet" href="css/tabla.css">
    <link rel="icon" href="../imagenes/favicon.png">
</head>

<body>
    <div class="container">
        <h1>Registros</h1>
        <div class="tbcover">
            <a href="index.php" class="btn-tambah">Regresar</a>
        </div>
        <table class="tabel">
            <thead>
                <td>Id</td>
                <td>Salones</td>
                <td>Estado</td>
                <td>fecha</td>
                <td>mac</td>
            </thead>
            <tbody>
                <?php
                foreach ($resultados as $fila) {
                    echo "<tr>";
                    echo "<td>" . $fila['id'] . "</td>";
                    echo "<td>" . $fila['salones'] . "</td>";
                    echo "<td>" . $fila['estado'] . "</td>";
                    echo "<td>" . $fila['fecha'] . "</td>";
                    echo "<td>" . $fila['mac'] . "</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
        <!-- Mostrar la paginación -->
        <div class="pagination-container">
            <ul class="pagination">
                <?php
                // Número de páginas a mostrar antes y después de la página actual
                $numPaginasMostradas = 3;

                for ($i = max(1, $paginaActual - $numPaginasMostradas); $i <= min($totalPaginas, $paginaActual + $numPaginasMostradas); $i++) {
                    $activeClass = ($i == $paginaActual) ? 'active' : '';
                    echo '<li><a href="?pagina=' . $i . '" class="' . $activeClass . '">' . $i . '</a></li>';
                }
                ?>
            </ul>
        </div>
    </div>
    <!-- Agrega jQuery a tu página si aún no está incluido -->
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->

    <!-- Incluye tu archivo JavaScript externo -->
    <!-- <script src="js/javascript.js"></script> -->
</body>

</html>