
<%@ page import="org.plis.Comunidad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'comunidad.label', default: 'Comunidad')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
<div class="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">		
		  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a> <span class="divider">/</span></li>	  
		  <li><g:link controller="comunidad" action="list">Comunidades</g:link> <span class="divider">/</span></li>
		  <li class="active"><g:fieldValue bean="${comunidadInstance}" field="nombre"/></li>
		</ul>
	</div>
</div>
		<div class="container">
			  <div class="row">
                    <header class="page-header">
                        <h3>Comunidad <small class="lead">Mostrar <g:fieldValue bean="${comunidadInstance}" field="nombre"/></small></h3>
                    </header>
			</div>
			<!--
			<a href="#show-comunidad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

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
			<div id="show-comunidad" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<ol class="property-list comunidad">
				
					<g:if test="${comunidadInstance?.description}">
					<li class="fieldcontain">
						<label id="description-label" class="property-label"><g:message code="comunidad.description.label" default="Description" /></label>
						
							<span class="uneditable-input" aria-labelledby="description-label"><g:fieldValue bean="${comunidadInstance}" field="description"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${comunidadInstance?.nombre}">
					<li class="fieldcontain">
						<label id="nombre-label" class="property-label"><g:message code="comunidad.nombre.label" default="Nombre" /></label>
						
							<span class="uneditable-input" aria-labelledby="nombre-label"><g:fieldValue bean="${comunidadInstance}" field="nombre"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${comunidadInstance?.organismos}">
					<li class="fieldcontain">
						<label id="organismos-label" class="property-label"><g:message code="comunidad.organismos.label" default="Organismos" /></label>
						
							<g:each in="${comunidadInstance.organismos}" var="o">
							<span class="uneditable-input" aria-labelledby="organismos-label"><g:link controller="organismo" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
							</g:each>
						
					</li>
					</g:if>
				
				</ol>
				<g:form>
					<fieldset class="form-actions">
						<g:hiddenField name="id" value="${comunidadInstance?.id}" />
						<g:link class="edit" action="edit" id="${comunidadInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
