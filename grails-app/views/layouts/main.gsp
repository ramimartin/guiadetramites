<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Barral de Servicios </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <g:layoutHead/>
        <r:layoutResources />
    </head>
    <body>
	    <div class="navbar navbar-static-top">
	        <div class="navbar-inner">
	            <div class="container">
	                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </a>
	                <g:link class="brand" uri="/">Barral de Servicios </g:link>
	                <div class="nav-collapse">
	                        <ul class="nav">
	<sec:ifAllGranted roles="ROLE_ADMIN"> 
          <li class="dropdown">
          	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Comunidades <b class="caret"></b></a>
          	<ul class="dropdown-menu">
              <li><g:link controller="comunidad" action="list">Listar</g:link></li>
              <li><g:link controller="comunidad" action="create">Agregar</g:link></li>
            </ul>
          	</li>
          <li class="dropdown">
          	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Organismos <b class="caret"></b></a>
          	<ul class="dropdown-menu">
              <li><g:link controller="organismo" action="list">Listar</g:link></li>
              <li><g:link controller="organismo" action="create">Agregar</g:link></li>
            </ul>
          	</li>
          <li class="dropdown">
          	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Servicios <b class="caret"></b></a>
          	<ul class="dropdown-menu">
              <li><g:link controller="servicio" action="list">Listar</g:link></li>
              <li><g:link controller="servicio" action="create">Agregar</g:link></li>
            </ul>
          	</li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Usuarios <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">Listado</a></li>
              <li><a href="#">Agregar</a></li>
              <li><a href="#">Editar mi información</a></li>
            </ul>
          </li>
        </ul>
        <form class="navbar-search pull-right" action="">
          <input type="text" class="search-query span2" placeholder="Buscar">
        </form>
</sec:ifAllGranted>
	                    <ul class="nav pull-right">
	                        <sec:ifLoggedIn>
	                        <li>
	                            <g:link controller="logout" action="index">Salir</g:link>
	                        </li>
	                        </sec:ifLoggedIn>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>

        <g:layoutBody/>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
        <g:javascript library="application"/>
        <r:layoutResources />
    </body>
</html>