$(document).ready(function () {
    function cargarEstados() {
        $.ajax({
            url: 'php/get_infopasillo1.php', // Reemplaza 'ruta/al/tu_script_php.php' con la ruta correcta a tu script PHP
            type: 'GET',
            headers: {
                'Accept': 'application/json', // Configura el encabezado Accept para indicar JSON
            },
            dataType: 'json',
            success: function (data) {
                if (data) {
                    // Extraer los estados del objeto JSON recibido
                    var estadohumoPasillo = data[0].estadohumoPasillo;
                    var estadomovimientopasillo = data[0].estadomovimientopasillo;

                    // Actualizar las clases de acuerdo con los estados
                    var elementoHumo = $('.contenedor__humo');
                    var elementoMovimiento = $('.contenedor__movimiento');
                    console.log('Estado de humo del pasillo:', estadohumoPasillo);
                    console.log('Estado de movimiento del pasillo:', estadomovimientopasillo);

                    if (parseInt(estadohumoPasillo) > 1000) {
                        elementoHumo.removeClass('success').addClass('danger');
                    } else {
                        elementoHumo.removeClass('danger').addClass('success');
                    }

                    if (parseInt(estadomovimientopasillo) === 1) {
                        elementoMovimiento.removeClass('success').addClass('danger');
                    } else {
                        elementoMovimiento.removeClass('danger').addClass('success');
                    }
                } else {
                    console.log('No se encontraron datos.');
                }
            },
            error: function () {
                console.log('Error al cargar los datos.');
            }
        });
    }

    // Llamar a la función para cargar los estados inicialmente
    cargarEstados();

    // Actualizar la información cada 41 segundos
    setInterval(cargarEstados, 41000);
});
