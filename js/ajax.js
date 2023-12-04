$(document).ready(function () {
    function cargarEstados() {
        $.ajax({
            url: 'php/get_MovimiHumo.php',
            type: 'GET',
            headers: {
                'Accept': 'application/json', // Configura el encabezado Accept para indicar JSON
            },
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
                        humoPasillo1: data.pasillo1humo.estado,
                        humoPasillo2: data.pasillo2humo.estado
                    };

                    // Recorre los datos y actualiza las clases de acuerdo al estado
                    $.each(data, function (key, value) {
                        var elemento = $('.contenedor__' + key);
                        var estado = parseInt(value.estado); // Convertir a entero

                        if (key.startsWith('pasillo1humo') || key.startsWith('pasillo1')) {
                            if (estado > 1000 || parseInt(data.pasillo1.estado) === 1) {
                                elemento.removeClass('success').addClass('danger');
                                console.log('Hay humo o movimiento en el ' + key);
                            } else {
                                elemento.removeClass('danger').addClass('success');
                                console.log('No hay humo ni movimiento en el ' + key);
                            }

                        } else if (key.startsWith('pasillo2humo') || key.startsWith('pasillo2')) {
                            if (estado > 1000 || parseInt(data.pasillo2.estado) === 1) {
                                elemento.removeClass('success').addClass('danger');
                                console.log('Hay humo o movimiento en el ' + key);
                            } else {
                                elemento.removeClass('danger').addClass('success');
                                console.log('No hay humo ni movimiento en el ' + key);
                            }

                        } else {
                            if (estado === 1) {
                                elemento.removeClass('success').addClass('danger');
                                console.log('Hay movimiento en el ' + key);
                            } else {
                                elemento.removeClass('danger').addClass('success');
                                console.log('No hay movimiento en el ' + key);
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
        var infoPasilloHumo = obtenerInfoSalon(data, 'pasillo1humo');
        var infoPasilloHumo2 = obtenerInfoSalon(data, 'pasillo2humo');

        $('#salonmovimiento').text(infoSalonMovimiento);
        $('#pasillomovimiento').text(infoPasilloMovimiento);
        $('#pasillohumo1').text(infoPasilloHumo);
        $('#pasillohumo2').text(infoPasilloHumo2);
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

        //Renombrar los salones y pasillos
        if (tipo === 'pasillo1humo') {
            tipo = 'de humo en el pasillo 1:';
            ultimoSalon = '';
        } else if (tipo === 'pasillo2humo') {
            tipo = 'de humo en el pasillo 2: ';
            ultimoSalon = '';
        } else if (tipo === 'salon') {
            tipo = 'de movimiento en el ';
        } else if (tipo === 'pasillo') {
            tipo = 'de movimiento en el ';
            ultimoSalon = ultimoSalon.slice(0, -4); // Elimina el número del pasillo
            ultimoSalon = ultimoSalon.slice(0, 7) + " " + ultimoSalon.slice(7) // Agrega un espacio entre pasillo y el número
        }

        return 'Último registro ' + tipo + ultimoSalon + ' hace ' + diferencia + ' ' + unidad + ' (' + fechaFormateada + ')';

    }

    function actualizarEstados(estados, data) {
        // Mostar los estados en la consola
        console.log('Estado de Salon 1:', estados.salon1);
        console.log('Estado de Salon 2:', estados.salon2);
        console.log('Estado de Salon 3:', estados.salon3);
        console.log('Estado de Salon 4:', estados.salon4);
        console.log('Estado de Pasillo 1:', estados.pasillo1);
        console.log('Estado de Pasillo 2:', estados.pasillo2);
        console.log('Estado de Humo Pasillo 1:', estados.humoPasillo1);
        console.log('Estado de Humo Pasillo 2:', estados.humoPasillo2);
        console.log(data);
        
    }

    // Llamar a la función para cargar los estados inicialmente
    cargarEstados();

    // Actualizar la información cada 41 segundos
    setInterval(cargarEstados, 41000);
});
