
<%@ page import="org.plis.Comunidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'comunidad.label', default: 'Comunidad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
<div class="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">		
		  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a> <span class="divider">/</span></li>
		  <li><g:link controller="comunidad" action="list">Comunidades</g:link> <span class="divider">/</span></li>
		  <li class="active">Lista</li>
		</ul>
	</div>
</div>	
		<div class="container">
			<div class="row">
                    <header class="page-header">
                        <h3>Comunidad <small class="lead">Lista de Comunidades</small></h3>
                    </header>
			</div>
			<!-- 
			<div class="navbar">
				<div class="nav">
					<ul class="nav">	
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
						<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
					</ul>
				</div>
			</div>
			 -->
			<div id="list-comunidad" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="nombre" title="${message(code: 'comunidad.nombre.label', default: 'Nombre')}" />
						
	     					<g:sortableColumn property="description" title="${message(code: 'comunidad.description.label', default: 'Description')}" />
	
						</tr>
					</thead>
					<tbody>
					<g:each in="${comunidadInstanceList}" status="i" var="comunidadInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${comunidadInstance.id}">${fieldValue(bean: comunidadInstance, field: "nombre")}</g:link></td>
							<td>${fieldValue(bean: comunidadInstance, field: "description")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${comunidadInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
