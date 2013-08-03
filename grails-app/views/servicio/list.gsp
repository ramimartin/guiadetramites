
<%@ page import="org.plis.Servicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
<div class="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">		
		  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a> <span class="divider">/</span></li>
		  <li><g:link controller="servicio" action="list">Servicios</g:link> <span class="divider">/</span></li>
		  <li class="active">Lista</li>
		</ul>
	</div>
</div>
		<div class="container">
  			<div class="row">
	            <header class="page-header">
	                <h3>Servicios <small class="lead">Lista de Servicios</small></h3>
	            </header>
	        </div>
			<div id="list-servicio" class="content scaffold-list" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="nombre" title="${message(code: 'servicio.nombre.label', default: 'Nombre')}" />
							
							<th><g:message code="servicio.organismo.label" default="Organismo" /></th>

							<g:sortableColumn property="addressInbound" title="${message(code: 'servicio.addressInbound.label', default: 'Address Inbound')}" />
						
							<g:sortableColumn property="addressOutbound" title="${message(code: 'servicio.addressOutbound.label', default: 'Address Outbound')}" />
						
							<g:sortableColumn property="descripcion" title="${message(code: 'servicio.descripcion.label', default: 'Descripcion')}" />
						
							<!-- 
							<g:sortableColumn property="namespace" title="${message(code: 'servicio.namespace.label', default: 'Namespace')}" />						
							-->
							<th>Desplegar</th>
							
							<!--  <th>Desplegado</th> -->
							
						</tr>
					</thead>
					<tbody>
					<g:each in="${servicioInstanceList}" status="i" var="servicioInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${servicioInstance.id}">${fieldValue(bean: servicioInstance, field: "nombre")}</g:link></td>
							
							<td>${fieldValue(bean: servicioInstance, field: "organismo")}</td>							
							
							<td>${fieldValue(bean: servicioInstance, field: "addressInbound")}</td>
						
							<td>${fieldValue(bean: servicioInstance, field: "addressOutbound")}</td>
						
							<td>${fieldValue(bean: servicioInstance, field: "descripcion")}</td>
	
							<!-- 
							<td>${fieldValue(bean: servicioInstance, field: "namespace")}</td>		
							 -->
	
							<td>
							<g:link action="deploy" id="${servicioInstance.id}">
								<!-- <g:img dir="images" file="plis-deploy.png" width="40" height="40"/>
								-->
								<img src="http://recruitmentexchange.com/icons/icon_deploy_quickly.jpg" width="40px" height="40"/>
								</g:link>
							</td>
							<!-- 
							<td>
							<g:if test="${servicioInstance.deployed}">
							     Sí
							</g:if>
							<g:else>
							    No
							</g:else>
							
							<g:link action="isDeployed" id="${servicioInstance.id}">
								<img src="http://recruitmentexchange.com/icons/icon_deploy_quickly.jpg" width="40px" height="40"/>
								</g:link>
								
								</td>								
						 -->
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${servicioInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
