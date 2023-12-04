$(document).ready(function () {
    const tablaRegistros = $('#tablaRegistros');
    const pagination = $('#pagination');
    const filasPorPagina = 10;
    let paginaActual = 1;

    let nombres = []; 
    let datosPorNombre = {};
    let myChart = null;  // Variable para almacenar la referencia al gráfico
    let myChart2 = null;  // Variable para almacenar la referencia al segundo gráfico

    function cargarDatos(inicio, fin) {
        $.ajax({
            url: `php/get_infotablam25.php?inicio=${inicio}&fin=${fin}`,
            type: 'GET',
            headers: {
                'Accept': 'application/json', // Configura el encabezado Accept para indicar JSON
            },
            mode: 'no-cors',
            dataType: 'json',
            success: function (data) {
                if (data) {
                    tablaRegistros.empty();

                    nombres = [];
                    datosPorNombre = {};

                    data.forEach(function (registro) {
                        tablaRegistros.append(
                            '<tr>' +
                            '<td>' + registro.id + '</td>' +
                            '<td>' + (parseInt(registro.salones) == 303 ? 'Pasillo 2' : 'nn') + '</td>' +
                            '<td>' + (parseInt(registro.estado) === 1 ? 'Encendido' : 'Apagado') + '</td>' +
                            '<td>' + registro.fecha + '</td>' +
                            '<td>' + registro.mac + '</td>' +
                            '</tr>'
                        );

                        const nombre = registro.salones;

                        if (!nombres.includes(nombre)) {
                            nombres.push(nombre);
                        }

                        if (!datosPorNombre[nombre]) {
                            datosPorNombre[nombre] = {
                                encendidos: 0,
                                apagados: 0
                            };
                        }

                        if (registro.estado === 1) {
                            datosPorNombre[nombre].encendidos++;
                        } else {
                            datosPorNombre[nombre].apagados++;
                        }
                    });

                    console.log(datosPorNombre);

                    // Destruir los gráficos existentes antes de crear los nuevos
                    if (myChart) {
                        myChart.destroy();
                    }
                    if (myChart2) {
                        myChart2.destroy();
                    }

                    // Crear los gráficos
                    crearGrafico();
                    crearGraficoCircular();
                } else {
                    console.log('No se encontraron datos.');
                }
            },
            error: function () {
                console.log('Error al cargar los datos.');
            }
        });
    }

    function crearGrafico() {
        var ctx = document.getElementById('myChart').getContext('2d');
        var datasets = [];

        nombres.forEach(function (nombre) {
            datasets.push({
                label: `Encendidos (${nombre})`,
                data: [datosPorNombre[nombre].encendidos],
                backgroundColor: 'rgba(236, 47, 230, 0.538)',
                borderColor: 'rgba(236, 47, 230, 0.538)',
                borderWidth: 1
            });

            datasets.push({
                label: `Apagados (${nombre})`,
                data: [datosPorNombre[nombre].apagados],
                backgroundColor: 'rgba(255, 166, 0, 0.577)',
                borderColor: 'rgba(255, 166, 0, 0.577)',
                borderWidth: 1
            });
        });

        myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: nombres,
                datasets: datasets
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    function crearGraficoCircular() {
        var ctx2 = document.getElementById('myChart2').getContext('2d');
        var datasets2 = [];

        let porcentajeEncendidos = 0;
        let porcentajeApagados = 0;
    
        nombres.forEach(function (nombre) {
            const total = datosPorNombre[nombre].encendidos + datosPorNombre[nombre].apagados;
            porcentajeEncendidos = (datosPorNombre[nombre].encendidos / total) * 100;
            porcentajeApagados = (datosPorNombre[nombre].apagados / total) * 100;
    
            datasets2.push({
                label: `Encendidos (${nombre})`,
                data: [porcentajeEncendidos],
                backgroundColor: 'rgba(236, 47, 230, 0.538)',
                borderColor: 'rgba(236, 47, 230, 0.538)',
                borderWidth: 1
            });
    
            datasets2.push({
                label: `Apagados (${nombre})`,
                data: [porcentajeApagados],
                backgroundColor: 'rgba(255, 166, 0, 0.577)',
                borderColor: 'rgba(255, 166, 0, 0.577)',
                borderWidth: 1
            });
        });
    
        myChart2 = new Chart(ctx2, {
            type: 'doughnut',
            data: {
                labels: nombres,
                datasets: datasets2
            },
            options: {
                plugins: {
                    legend: {
                        position: 'right'
                    },
                    title: {
                        display: true,
                        text: 'Encendido: ' + porcentajeEncendidos.toFixed(2) + '% y Apagado: ' + porcentajeApagados.toFixed(2) + '%',
                        padding: 10 // Ajusta el espacio entre el título y los porcentajes
                    }
                }
            }
        });
    }
    

    cargarDatos($('#tipoDatos').val(), 0, filasPorPagina);

    setInterval(function () {
        cargarDatos($('#tipoDatos').val(), (paginaActual - 1) * filasPorPagina, filasPorPagina);
    }, 41000);
});
