<%@ page import="org.plis.Servicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
<div class="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">		
		  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a> <span class="divider">/</span></li>
		  <li><g:link controller="servicio" action="list">Servicios</g:link> <span class="divider">/</span></li>
		  <li class="active">Editar <g:fieldValue bean="${servicioInstance}" field="nombre"/></li>
		</ul>
	</div>
</div>	
		<div class="container">
			<div class="row">
                    <header class="page-header">
                        <h3>Servicio <small class="lead">Editar <g:fieldValue bean="${servicioInstance}" field="nombre"/></small></h3>
                    </header>
			</div>
	   	    <!--
			<a href="#edit-servicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a> 

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
			<div id="edit-servicio" class="content scaffold-edit" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${servicioInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${servicioInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form method="post"  enctype="multipart/form-data">
					<g:hiddenField name="id" value="${servicioInstance?.id}" />
					<g:hiddenField name="version" value="${servicioInstance?.version}" />
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="form-actions">
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
