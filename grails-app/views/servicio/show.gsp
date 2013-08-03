
<%@ page import="org.plis.Servicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
<div class="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">		
		  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a> <span class="divider">/</span></li>	  
		  <li><g:link controller="servicio" action="list">Servicios</g:link> <span class="divider">/</span></li>
		  <li class="active"><g:fieldValue bean="${servicioInstance}" field="nombre"/></li>
		</ul>
	</div>
</div>
		<div class="container">
			<div class="row">
                    <header class="page-header">
                        <h3>Servicio <small class="lead">Mostrar <g:fieldValue bean="${servicioInstance}" field="nombre"/></small></h3>
                    </header>
			</div>
			<!--
			<a href="#show-servicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

			<div class="navbar">
				<div class="nav">
					<ul class="nav">
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
						<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
						<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
					</ul>
				</div>
			</div>
			-->				
			<div id="show-servicio" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<ol class="property-list servicio">
				
					<g:if test="${servicioInstance?.addressInbound}">
					<li class="fieldcontain">
						<label id="addressInbound-label" class="property-label"><g:message code="servicio.addressInbound.label" default="Address Inbound" /></label>
						
							<span class="uneditable-input" aria-labelledby="addressInbound-label"><g:fieldValue bean="${servicioInstance}" field="addressInbound"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${servicioInstance?.addressOutbound}">
					<li class="fieldcontain">
						<label id="addressOutbound-label" class="property-label"><g:message code="servicio.addressOutbound.label" default="Address Outbound" /></label>
						
							<span class="uneditable-input" aria-labelledby="addressOutbound-label"><g:fieldValue bean="${servicioInstance}" field="addressOutbound"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${servicioInstance?.descripcion}">
					<li class="fieldcontain">
						<label id="descripcion-label" class="property-label"><g:message code="servicio.descripcion.label" default="Descripcion" /></label>
						
							<span class="uneditable-input" aria-labelledby="descripcion-label"><g:fieldValue bean="${servicioInstance}" field="descripcion"/></span>
						
					</li>
					</g:if>
				<!-- 
					<g:if test="${servicioInstance?.namespace}">
					<li class="fieldcontain">
						<label id="namespace-label" class="property-label"><g:message code="servicio.namespace.label" default="Namespace" /></label>
						
							<span class="uneditable-input" aria-labelledby="namespace-label"><g:fieldValue bean="${servicioInstance}" field="namespace"/></span>
						
					</li>
					</g:if>
				 -->
					<g:if test="${servicioInstance?.nombre}">
					<li class="fieldcontain">
						<label id="nombre-label" class="property-label"><g:message code="servicio.nombre.label" default="Nombre" /></label>
						
							<span class="uneditable-input" aria-labelledby="nombre-label"><g:fieldValue bean="${servicioInstance}" field="nombre"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${servicioInstance?.organismo}">
					<li class="fieldcontain">
						<label id="organismo-label" class="property-label"><g:message code="servicio.organismo.label" default="Organismo" /></label>
						
							<span class="uneditable-input" aria-labelledby="organismo-label"><g:link controller="organismo" action="show" id="${servicioInstance?.organismo?.id}">${servicioInstance?.organismo?.encodeAsHTML()}</g:link></span>
						
					</li>
					</g:if>
				<!-- 
					<g:if test="${servicioInstance?.service}">
					<li class="fieldcontain">
						<label id="service-label" class="property-label"><g:message code="servicio.service.label" default="Service" /></label>
						
							<span class="uneditable-input" aria-labelledby="service-label"><g:fieldValue bean="${servicioInstance}" field="service"/></span>
						
					</li>
					</g:if>
				 -->
					<g:if test="${servicioInstance?.wsdlLocation}">
					<li class="fieldcontain">
						<label id="wsdlLocation-label" class="property-label"><g:message code="servicio.wsdlLocation.label" default="Wsdl Location" /></label>
						
					</li>
					</g:if>
				
				</ol>
				<g:form>
					<fieldset class="form-actions">
						<g:hiddenField name="id" value="${servicioInstance?.id}" />
						<g:link class="edit" action="edit" id="${servicioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
