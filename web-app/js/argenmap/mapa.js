$(function() {
	//El div tiene id="mapa"
	$('#mapa').argenmap();
  $('#mapa').centro(-30, -59)

  var marcadores = [
    {lat: -25.695278, lng: -54.436667, contenido:'Cataratas del Iguazú!'},
    {lat: -34.05, lng: -59.2, contenido:'Atucha: central eléctrica'},
    {lat: -27.31,  lng: -66.608617, contenido:'Minera Lumbrera: buena mina'}
  ];

  $('#mapa').agregarMarcadores( marcadores );
});