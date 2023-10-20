$(document).ready(function () {
    function cargarEstados() {
        $.ajax({
            url: 'php/get_movimiHumo.php',
            type: 'GET',
            headers: new Headers({ 'Content-type': 'application/json' }),
            mode: 'no-cors',
            dataType: 'json',
            success: function (data) {
                if (data) {
                    // Extraer los estados de los datos recibidos
                    var estados = {
                        salon1: data.salon1.estado,
                        salon2: data.salon2.estado,
                        salon3: data.salon3.estado,
                        salon4: data.salon4.estado,
                        pasillo1: data.pasillo1.estado,
                        pasillo2: data.pasillo2.estado,
                        humoPasillo1: data.humoPasillo1.estado,
                        humoPasillo2: data.humoPasillo2.estado
                    };

                    // Recorre los datos y actualiza las clases de acuerdo al estado
                    $.each(data, function (key, value) {
                        var elemento = $('.contenedor__' + key);
                        var estado = parseInt(value.estado); // Convertir a entero

                        if (key.startsWith('pasillo')) {
                            var humoKey = 'humo' + key;
                            var humoEstado = data[humoKey] ? parseInt(data[humoKey].estado) : 0; // Convertir a entero o establecer en 0

                            if (estado === 1 || humoEstado === 1) {
                                elemento.removeClass('success').addClass('danger');
                                console.log('Hay humo en el pasillo ' + key);
                            } else {
                                elemento.removeClass('danger').addClass('success');
                                console.log('No hay humo en el pasillo ' + key);
                            }
                        } else {
                            if (estado === 1) {
                                elemento.removeClass('success').addClass('danger');
                                console.log('Hay movimiento en el salón ' + key);
                            } else {
                                elemento.removeClass('danger').addClass('success');
                                console.log('No hay movimiento en el salón ' + key);
                            }
                        }
                    });

                    // Actualizar la página con los estados
                    actualizarEstados(estados, data);
                    // Actualizar la información de los salones y pasillos
                    actualizarInfoSalonPasillos(data);
                } else {
                    console.log('No se encontraron datos.');
                }
            },
            error: function () {
                console.log('Error al cargar los datos.');
            }
        });
    }

    // Obtener la información del último movimiento de los salones, pasillos y última detección de humo en los pasillos
    function actualizarInfoSalonPasillos(data) {
        var infoSalonMovimiento = obtenerInfoSalon(data, 'salon');
        var infoPasilloMovimiento = obtenerInfoSalon(data, 'pasillo');
        var infoPasilloHumo = obtenerInfoSalon(data, 'humo');

        $('#salonmovimiento').text(infoSalonMovimiento);
        $('#pasillomovimiento').text(infoPasilloMovimiento);
        $('#pasillohumo').text(infoPasilloHumo);
    }

    function obtenerInfoSalon(data, tipo) {
        var ultimoSalon = '';
        var ultimoMovimiento = new Date(0);

        // Encontrar el último movimiento de un tipo específico (salon, pasillo o humo)
        $.each(data, function (key, value) {
            if (key.startsWith(tipo)) {
                var fechaMovimiento = new Date(value.fecha);
                if (fechaMovimiento > ultimoMovimiento) {
                    ultimoMovimiento = fechaMovimiento;
                    ultimoSalon = key;
                }
            }
        });

        // Calcular la diferencia en días o minutos
        var fechaActual = new Date();
        var tiempoTranscurrido = fechaActual - ultimoMovimiento;
        var diferencia;
        var unidad;
        if (tiempoTranscurrido >= 24 * 60 * 60 * 1000) {
            diferencia = Math.floor(tiempoTranscurrido / (24 * 60 * 60 * 1000));
            unidad = 'día';
        } else {
            diferencia = Math.floor(tiempoTranscurrido / (60 * 1000));
            unidad = 'minuto';
        }

        if (diferencia !== 1) {
            unidad += 's';
        }

        // Formatear la fecha en un formato personalizado
        var fechaFormateada = ultimoMovimiento.toLocaleString('es-CO', {
            weekday: 'long',
            month: 'long',
            day: 'numeric',
            year: 'numeric',
            hour: 'numeric',
            minute: 'numeric',
            hour12: true
        });

        return 'Último registro de movimiento en ' + tipo + ': ' + ultimoSalon + ' hace ' + diferencia + ' ' + unidad + ' (' + fechaFormateada + ')';
    }

    function actualizarEstados(estados, data) {
        // Aquí puedes actualizar la página con los estados según tus necesidades
        console.log('Estado de Salon 1:', estados.salon1);
        console.log('Estado de Salon 2:', estados.salon2);
        console.log('Estado de Salon 3:', estados.salon3);
        console.log('Estado de Salon 4:', estados.salon4);
        console.log('Estado de Pasillo 1:', estados.pasillo1);
        console.log('Estado de Pasillo 2:', estados.pasillo2);
        console.log('Estado de Humo Pasillo 1:', estados.humoPasillo1);
        console.log('Estado de Humo Pasillo 2:', estados.humoPasillo2);
        console.log(data);
        // Puedes actualizar la página o realizar otras acciones con los estados aquí
    }

    // Llamar a la función para cargar los estados inicialmente
    cargarEstados();

    // Actualizar la información cada 2 segundos
    setInterval(cargarEstados, 2000);
});
