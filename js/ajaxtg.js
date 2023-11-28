$(document).ready(function () {
    const tablaRegistros = $('#tablaRegistros');
    const pagination = $('#pagination');

    const filasPorPagina = 10;
    let paginaActual = 1;

    function cargarRegistros(tipo, inicio, fin) {
        $.ajax({
            url: `php/get_infotablag.php?tipo=${tipo}&inicio=${inicio}&fin=${fin}`,
            type: 'GET',
            headers: new Headers({ 'Content-type': 'application/json' }),
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

                    // Actualizar el gráfico
                    actualizarGrafico(data);

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
        actualizarGrafico(data);
    }

    // Manejar el evento "click" en los botones de paginación
    $('#prevPage').on('click', function () {
        if (paginaActual > 1) {
            cambiarPagina(paginaActual - 1);
            actualizarGrafico(data);
        }
    });

    $('#nextPage').on('click', function () {
        if (paginaActual < 10) { // Cambia 10 al número de páginas total si es diferente
            cambiarPagina(paginaActual + 1);
            actualizarGrafico(data);
        }
    });

// Función para procesar datos y actualizar el gráfico
function actualizarGrafico(data) {
    
    // Objeto para almacenar el recuento de estados por nombre
    const countsPorNombre = {};

    // Iterar a través de los datos y contar el número de encendidos y apagados por nombre
    data.forEach(function (registro) {
        const nombre = registro.nombre;
        const estado = parseInt(registro.estado) === 1 ? 'Encendido' : 'Apagado';

        if (!countsPorNombre[nombre]) {
            countsPorNombre[nombre] = {
                Encendido: 0,
                Apagado: 0
            };
        }

        countsPorNombre[nombre][estado]++;
    });

    // Preparar datos para el gráfico
    const nombres = Object.keys(countsPorNombre);
    const datosEncendido = nombres.map(nombre => countsPorNombre[nombre].Encendido);
    const datosApagado = nombres.map(nombre => countsPorNombre[nombre].Apagado);

    // Actualizar el gráfico
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: nombres,
            datasets: [{
                label: 'Encendido',
                data: datosEncendido,
                backgroundColor: 'rgba(236, 47, 230, 0.538)',
                borderColor: 'rgba(236, 47, 230, 0.538)',
                borderWidth: 1
            }, {
                label: 'Apagado',
                data: datosApagado,
                backgroundColor: 'rgba(255, 166, 0, 0.577)',
                borderColor: 'rgba(255, 166, 0, 0.577)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }

        
    });

    // Diagrama de pastel
    var ctx = document.getElementById('myChart2').getContext('2d');
    var myChart2 = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: nombres,
            datasets: [{
                label: 'Encendido',
                data: datosEncendido,
                backgroundColor: 'rgba(236, 47, 230, 0.538)',
                borderColor: 'rgba(236, 47, 230, 0.538)',
                borderWidth: 1
            }, {
                label: 'Apagado',
                data: datosApagado,
                backgroundColor: 'rgba(255, 166, 0, 0.577)',
                borderColor: 'rgba(255, 166, 0, 0.577)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }});
}

    // Actualizar la información cada 2 segundos
    setInterval(function () {
        cargarRegistros($('#tipoDatos').val(), (paginaActual - 1) * filasPorPagina, filasPorPagina);
        actualizarGrafico(data);
    }, 2000);
});



