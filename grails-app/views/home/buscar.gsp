<!DOCTYPE html>
<html>
<head>
<title>Guía de Trámites</title>


<meta name="layout" content="main" />

<script
	src="/guiatramites/static/plugins/jquery-1.8.3/js/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>
<link href="/guiatramites/static/css/bootstrap.css" type="text/css"
	media="screen, projection" rel="stylesheet" />
<g:javascript src="argenmap/googlemaps.js" />
<g:javascript src="argenmap/argenmap.jquery.min.js" />
<script src="/guiatramites/static/js/bootstrap.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        //El div tiene id="mapa"
        $('#mapa').argenmap();
        $('#mapa').centro(${organismo.latitud}, ${organismo.longitud})

        var marcadores = [
		{lat: ${lat}, lng: ${lon}, contenido:'${contenido}'},                  
        {lat: ${organismo.latitud}, lng: ${organismo.longitud}, contenido:'${organismo.nombre}'}
        ];

        $('#mapa').agregarMarcadores( marcadores );
        $('#mapa').zoom(20)
    });
    </script>


</head>
<body>


	<div class="container">
		<div class="row">

			<div id="mapa" style="height: 600px; width: 80%; margin: auto"></div>

		</div>
		<div class="well" style="width:80%;margin: auto" >
	       <ul class="nav nav-list">
	           <li class="nav-header"><h1>${tramite.nombre }</h1></li>
			   <li><h2>Requisitos</h2></li>
			   <li><p>${tramite.requisitos.replace('_NL_', '<br>')	} </p></li>
			   <li><h2>Pasos a seguir</h2></li>
				<li><p>
					${tramite.como_se_hace_el_tramite.replace('_NL_', '<br>')}
					
				</p></li>
	       </ul>
	   </div>	
	   <!-- 	
		<div class="row">
			<div class="jumbotron">
				<h1>${tramite.nombre }</h1>
				<h2>Requisitos</h2>
				<p>${tramite.requisitos.replace('_NL_', '<br>')	} </p>
				<h2>Pasos a seguir</h2>
				<p>
					${tramite.como_se_hace_el_tramite.replace('_NL_', '<br>')}
					
				</p>
			</div>
		</div>
		 -->
	</div>

</body>
</html>
