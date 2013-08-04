<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Guía de Trámites</title>

    <meta name="layout" content="main"/>

    <script src="/guiatramites/static/plugins/jquery-1.8.3/js/jquery/jquery-1.8.3.min.js" type="text/javascript" ></script>
    <link href="/guiatramites/static/css/bootstrap.css" type="text/css" media="screen, projection" rel="stylesheet" />
    <script src="/guiatramites/static/js/bootstrap.js"/>

    <g:javascript src="argenmap/googlemaps.js" />
    <g:javascript src="argenmap/argenmap.jquery.min.js" />
    <g:javascript src="argenmap/mapa.js" />
    <script>
    $(document).ready(function(){
        $('.tramite-ctrl').typeahead({
            source:function(query,process){
                return ["Trámite1", "Trámite2","Pepito", "Soy otro"];
            }
        });
    })
    </script>


</head>
<body>


<div class="container">

        <g:form controller="controller" action="accion" class="span6 offset3">
            <fieldset>
                <legend>
                    Buscar tr&aacute;mite
                </legend>
            <div class="form-group">
                <label for="tramite">Tr&aacute;mite</label>
                <g:textField name="tramite" class="tramite-ctrl"></g:textField>
            </div>
            <div class="form-group">
                <label for="direccion">Direcci&oacute;n</label>
                <g:textField name="direccion"></g:textField>
            </div>
                <div class="form-group">
                <button type="submit" class="btn">Buscar!</button>
                    </div>
            </fieldset>


        </g:form>


</div>

</body>
</html>
