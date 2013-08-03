
<%@ page import="org.plis.Organismo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'organismo.label', default: 'Organismo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
	
<div class="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">		
		  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a> <span class="divider">/</span></li>
		  <li><g:link controller="organismo" action="list">Organismos</g:link> <span class="divider">/</span></li>
		  <li class="active">Lista</li>
		</ul>
	</div>
</div>
		<div class="container">
			  <div class="row">
                    <header class="page-header">
                        <h3>Organismo <small class="lead">Lista de Organismos</small></h3>
                    </header>
			</div>

			<div id="list-organismo" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="comunidad" title="${message(code: 'organismo.nombre.label', default: 'Nombre')}" />
						
							<g:sortableColumn property="emailFunc" title="${message(code: 'organismo.comunidad.label', default: 'Comunidad')}" />
						
							<g:sortableColumn property="emailTec" title="${message(code: 'organismo.emailTec.label', default: 'Email Tec')}" />
						
							<g:sortableColumn property="nombre" title="${message(code: 'organismo.emailFunc.label', default: 'Email Func')}" />
						
							<g:sortableColumn property="nombreCorto" title="${message(code: 'organismo.nombreCorto.label', default: 'Nombre Corto')}" />
						
							<g:sortableColumn property="nombreFunc" title="${message(code: 'organismo.nombreFunc.label', default: 'Nombre Func')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${organismoInstanceList}" status="i" var="organismoInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${organismoInstance.id}">${fieldValue(bean: organismoInstance, field: "nombre")}</g:link></td>
						
							<td>${fieldValue(bean: organismoInstance, field: "comunidad")}</td>
						
							<td>${fieldValue(bean: organismoInstance, field: "emailTec")}</td>
						
							<td>${fieldValue(bean: organismoInstance, field: "emailFunc")}</td>
						
							<td>${fieldValue(bean: organismoInstance, field: "nombreCorto")}</td>
						
							<td>${fieldValue(bean: organismoInstance, field: "nombreFunc")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${organismoInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
