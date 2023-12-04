$(document).ready(function () {
    const tablaRegistros = $('#tablaRegistros');
    const pagination = $('#pagination');

    const filasPorPagina = 10;
    let paginaActual = 1;

    function cargarRegistros(tipo, inicio, fin) {
        $.ajax({
            url: `php/get_infotablag.php?tipo=${tipo}&inicio=${inicio}&fin=${fin}`,
            type: 'GET',
            headers: {
                'Accept': 'application/json', // Configura el encabezado Accept para indicar JSON
            },
            mode: 'no-cors',
            dataType: 'json',
            success: function (data) {
                if (data) {
                    // Limpia la tabla antes de agregar nuevos registros
                    tablaRegistros.empty();
                    // Itera a través de los datos y agrega filas a la tabla
                    data.forEach(function (registro) {
                        tablaRegistros.append(
                            '<tr>' +
                            '<td>' + registro.id + '</td>' +
                            '<td>' + registro.nombre + '</td>' +
                            '<td>' + (parseInt(registro.estado) === 1 ? 'Encendido' : 'Apagado') + '</td>' +
                            '<td>' + registro.fecha + '</td>' +
                            '<td>' + registro.mac + '</td>' +
                            '</tr>'
                        );
                    });

                    // Mostrar datos en consola
                    console.log(data);

                } else {
                    console.log('No se encontraron datos.');
                }
            },
            error: function () {
                console.log('Error al cargar los datos.');
            }
        });
    }

    // Llamar a la función para cargar los registros inicialmente
    cargarRegistros($('#tipoDatos').val(), 0, filasPorPagina);

    // Manejar el cambio en el tipo de datos seleccionado
    $('#tipoDatos').on('change', function () {
        paginaActual = 1; // Restablece la página actual a la primera página
        cargarRegistros($(this).val(), 0, filasPorPagina);
    });

    // Función para manejar la paginación
    function cambiarPagina(nuevaPagina) {
        paginaActual = nuevaPagina; // Actualiza la página actual
        const inicio = (paginaActual - 1) * filasPorPagina; // Calcula el inicio de la fila
        const fin = filasPorPagina; // Calcula el final de la fila
        cargarRegistros($('#tipoDatos').val(), inicio, fin); // Carga los registros actuales
        //Cargar los datos del gráfico
    }

    // Manejar el evento "click" en los botones de paginación
    $('#prevPage').on('click', function () {
        if (paginaActual > 1) {
            cambiarPagina(paginaActual - 1);
        }
    });

    $('#nextPage').on('click', function () {
        if (paginaActual < 10) { // Cambia 10 al número de páginas total si es diferente
            cambiarPagina(paginaActual + 1);
        }
    });

    // Actualizar la información cada 2 segundos
    setInterval(function () {
        cargarRegistros($('#tipoDatos').val(), (paginaActual - 1) * filasPorPagina, filasPorPagina);
    }, 41000);
});



