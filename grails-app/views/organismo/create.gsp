<%@ page import="org.plis.Organismo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'organismo.label', default: 'Organismo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
<div class="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">		
		  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a> <span class="divider">/</span></li>	  
		  <li><g:link controller="organismo" action="list">Organismos</g:link> <span class="divider">/</span></li>
		  <li class="active">Agregar</li>
		</ul>
	</div>
</div>
		<div class="container">
  			<div class="row">
                    <header class="page-header">
                        <h3>Organismo <small class="lead">Agregar Organismo</small></h3>
                    </header>
			</div>
			<!-- 
			<a href="#create-organismo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

			<div class="navbar">
				<div class="nav">
					<ul class="nav">
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
						<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					</ul>
				</div>
			</div>
			-->				
			<div id="create-organismo" class="content scaffold-create" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${organismoInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${organismoInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form action="save" >
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="form-actions">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
