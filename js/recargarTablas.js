// Obtener el número de página actual de la URL
const urlParams = new URLSearchParams(window.location.search);
const currentPage = parseInt(urlParams.get('pagina')) || 1;

// Recargar la página después de 3 segundos y mantener la página actual
setTimeout(function() {
    location.href = '?pagina=' + currentPage;
}, 3000); // 3000 milisegundos = 3 segundos
