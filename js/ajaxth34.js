$(document).ready(function () {
    const tablaRegistros = $('#tablaRegistros');
    const pagination = $('#pagination');
    const filasPorPagina = 10;
    let paginaActual = 1;

    let nombres = [];
    let datosPorNombre = {};
    let myChart = null;  // Variable para almacenar la referencia al gráfico
    let myChart2 = null;  // Variable para almacenar la referencia al segundo gráfico

    let mayores1000 = 0;
    let menores1000 = 0;

    function cargarDatos(inicio, fin) {
        $.ajax({
            url: `php/get_infotablah34.php?inicio=${inicio}&fin=${fin}`,
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
                    mayores1000 = 0;
                    menores1000 = 0;

                    data.forEach(function (registro) {
                        tablaRegistros.append(
                            '<tr>' +
                            '<td>' + registro.id + '</td>' +
                            '<td>' + ((registro.pasillos) == 'Pasillo A' ? 'Pasillo 1' : 'nn') + '</td>' +
                            '<td>' + registro.estado + '</td>' +
                            '<td>' + registro.fecha + '</td>' +
                            '<td>' + registro.mac + '</td>' +
                            '</tr>'
                        );

                        const nombre = registro.pasillos;

                        if (!nombres.includes(nombre)) {
                            nombres.push(nombre);
                        }

                        if (!datosPorNombre[nombre]) {
                            datosPorNombre[nombre] = {
                                mayores1000: 0,
                                menores1000: 0
                            };
                        }

                        if (registro.estado > 1000) {
                            mayores1000++;
                        } else {
                            menores1000++;
                        }

                    });

                    console.log(`Mayores a 1000: ${mayores1000}`);
                    console.log(`Menores a 1000: ${menores1000}`);

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
                label: `Humo mayor a 1000`,
                data: [mayores1000],
                backgroundColor: 'rgba(236, 47, 230, 0.538)',
                borderColor: 'rgba(236, 47, 230, 0.538)',
                borderWidth: 1
            });

            datasets.push({
                label: `Humo menor a 1000`,
                data: [menores1000],
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

        let porcentajeMayores1000 = 0;
        let porcentajeMenores1000 = 0;

        nombres.forEach(function (nombre) {
            const total = mayores1000 + menores1000;

            // Calcular porcentajes
            porcentajeMayores1000 = (mayores1000 / total) * 100;
            porcentajeMenores1000 = (menores1000 / total) * 100;

            datasets2.push({
                label: `Humo menor a 1000`,
                data: [porcentajeMayores1000],
                backgroundColor: 'rgba(236, 47, 230, 0.538)',
                borderColor: 'rgba(236, 47, 230, 0.538)',
                borderWidth: 1
            });

            datasets2.push({
                label: `Humo mayor a 1000`,
                data: [porcentajeMenores1000],
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
                        text: 'Humo mayor a 1000: ' + porcentajeMayores1000.toFixed(0) + '% / Humo menor a 1000: ' + porcentajeMenores1000.toFixed(0) + '%',
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
