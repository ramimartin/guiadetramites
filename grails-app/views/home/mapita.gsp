<!DOCTYPE html>
<html>
<head>
    <title>Guía de Trámites</title>


    <meta name="layout" content="main"/>

    <script src="/guiatramites/static/plugins/jquery-1.8.3/js/jquery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <link href="/guiatramites/static/css/bootstrap.css" type="text/css" media="screen, projection" rel="stylesheet" />
    <g:javascript src="argenmap/googlemaps.js" />
    <g:javascript src="argenmap/argenmap.jquery.min.js" />
    <script src="/guiatramites/static/js/bootstrap.js"></script>

    <script type="text/javascript">
    $(document).ready(function(){
        //El div tiene id="mapa"
        $('#mapa').argenmap();
        $('#mapa').centro(${lat}, ${lng})

        var marcadores = [
        {lat: ${lat}, lng: ${lng}, contenido:'${contenido}'}
        ];

        $('#mapa').agregarMarcadores( marcadores );
        $('#mapa').zoom(20)
    });
    </script>


</head>
<body>


<div class="container">
    <div class="row">

        <div id="mapa" style="height:300px;width: 80%;margin-left: 10%" ></div>

    </div>
</div>

</body>
</html>
