<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>GeoTrámites - Guía de Trámites</title>

    <meta name="layout" content="main"/>

    <script src="${resource(dir: 'plugins/jquery-1.8.3/js/jquery', file: 'jquery-1.8.3.min.js')}" type="text/javascript" ></script>
    <link href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css" media="screen, projection" rel="stylesheet" />
    <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
    <script src="${resource(dir: 'js', file: 'jquery.validate.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'additional-methods.min.js')}"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

    
    <script>
    $(document).ready(function(){
        $('.tramite-ctrl').typeahead({
            source:function(query,process){
                return $.get('${createLink(controller:'tramite', action:'getName')}', { nombre: query }, function (data) {
                    //alert(data[0].nombre);
                    nombres = new Array();
                    
                    for (var i=0;i<data.length;i++){ 
						nombres = nombres.concat(data[i].nombre) 
					}
					console.log(nombres);
                    return process(nombres);
                });
            }
        });

        var input = /** @type {HTMLInputElement} */(document.getElementById('direccion'));
        var autocomplete = new google.maps.places.Autocomplete(input);
    })
    </script>

<script type="text/javascript">
    $(function (){
        $("#form").validate({
            rules: {
                'tramite': {
                    required: true,
                    remote: {
                        url: "${createLink(controller:'tramite', action:'validate')}",
                        type: "post",
                        data: {
                            nombre: function() {
                                return $("#tramite").val();
                          }
                        }
                      }
                },
                'direccion': {
                    required: true,
                    remote: {
                        url: "${createLink(controller:'direccion', action:'validate')}",
                        type: "post",
                        data: {
                            direccion: function() {
                                return $("#direccion").val();
                          }
                        }
                      }
                },
            },
            messages: {
                'tramite': {
                    required: "El campo tr&aacute;mite es obligatorio",
                    remote: "El tr&aacute;mite ingresado no es v&aacute;lido"
                },
                'direccion': {
                    required: "El campo direcci&oacute;n es obligatorio",
                    remote: "La direcci&oacute;n ingresada no es v&aacute;lida"
                }
            }
        });
    });
</script>

</head>
<body>


<div class="container">

<img src="${resource(dir: 'img', file: 'guia_de_tramites.png')}" style="max-height:120px;" />

      <g:form controller="home" action="buscar" name="form" class="span6 offset3">
          <fieldset>
              <legend>
                  Buscar tr&aacute;mite
              </legend>
                            <div class="form-group" style="background: #00374f;padding:5px;
color: #cce4fb;

font-style: italic;
">
Buscá tu trámite ingresando el nombre del mismo en el campo de texto. Seleccioná un trámite del desplegable. 
Ingresá tu dirección y listo buscá la dependencia más cercana para hacer el trámite!</div><br />

          <div class="form-group">
              <label for="tramite">Tr&aacute;mite</label>
              <g:textField name="tramite" class="tramite-ctrl" autocomplete="off" placeholder="Trámite a realizar"></g:textField>
          </div>
          <div class="form-group">
              <label for="direccion">Direcci&oacute;n</label>
              <g:textField id="direccion" name="direccion"></g:textField>
          </div>
              <div class="form-group">
              <button type="submit" class="btn btn-primary">Buscar!</button>
                  </div>
          </fieldset>


      </g:form>
</div>


</body>
</html>
