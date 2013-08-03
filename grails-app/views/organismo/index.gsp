<@ page contentType="text/html;charset=UTF-8" >
<@ page contentType="text/html;charset=UTF-8" >
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
    <head>
        <meta name="layout" content="main"/>
        <r:require modules="bootstrap"/>
    </head>
    <body>
        <section>
            <div class="container">
                <div class="row">
                    <header class="page-header">
                        <h3>Organismo <small class="lead">Lista de Organismos</small></h3>
                    </header>
                    <div class="span3">
                        <g:link class="btn btn-block btn-link" action="create">
                            Nuevo Organismo
                        </g:link>
                        <div class="well">
                            <ul class="nav nav-list">
                                <li class="nav-header">Organismos</li>
                                <li class="active">
                                    <a id="view-all" href="#">
                                        <i class="icon-chevron-right pull-right"></i>
                                        <b>Ver todos</b>
                                    </a>
                                </li>
                            <g:each in="${ organismos }" var="organismo" status="i">
                                <li>
                                    <a href="#Organismo-${organismo.id}">
                                        <i class="icon-chevron-right pull-right"></i>
                                        ${ "${ organismo.nombre }" }
                                    </a>
                                </li>
                            </g:each>
                            </ul>
                        </div>
                    </div>
                    <div class="span9">
                    <g:each in="${ organismos }" var="organismo" status="i">
                        <div id="Organismo-${ organismo.id }" class="well well-small">
                            <table class="table table-bordered table-striped">
                                <caption>
                                    ${ "${ organismo.nombre }" }: Lista de servicios registrados
                                </caption>
                                <thead>
                                    <tr>
                                    	<th> Nombre      </th>
										<th> Descripcion </th>
										<th> AddressInbound </th>
										<th> version</th>
										<th> Controles</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <g:each in="${ organismo.servicios }" var="servicio">
                                    <tr>
                                        <td>${ servicio.nombre }</td>
                                        <td>${ servicio.descripcion }</td>
                                        <td>${ servicio.addressInbound }</td>
                                        <td>${ servicio.version }</td>
                                        <td><g:link class="btn btn-small btn-inverse" controller="servicio"
                                                    action="edit" id="${servicio.id}">
                                                <i class="icon-edit icon-white"></i>
                                            </g:link>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                            <div class="btn-group">
                                <g:link class="btn btn-primary" action="edit" id="${organismo.id}">
                                    <i class="icon-edit icon-white"></i>Edit
                                </g:link>
                            </div>
                        </div>
                    </g:each>
                    </div>
                </div>
            </div>
        </section>
        <g:javascript>
            $('ul.nav > li > a').click(function(e){
                if($(this).attr('id') == "view-all"){
                    $('div[id*="Organismo-"]').fadeIn('fast');
                }else{
                    var aRef = $(this);
                    var tablesToHide = $('div[id*="Organismo-"]:visible').length > 1
                            ? $('div[id*="Organismo-"]:visible') : $($('.nav > li[class="active"] > a').attr('href'));

                    tablesToHide.hide();
                    $(aRef.attr('href')).fadeIn('fast');
                }
                $('.nav > li[class="active"]').removeClass('active');
                $(this).parent().addClass('active');
            });
        </g:javascript>
    </body>
</html>