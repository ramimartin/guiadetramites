
<%@ page import="org.plis.Organismo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'organismo.label', default: 'Organismo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
<div class="breadcrumb">
	<div class="container">
		<ul class="breadcrumb">		
		  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a> <span class="divider">/</span></li>	  
		  <li><g:link controller="organismo" action="list">Organismos</g:link> <span class="divider">/</span></li>
		  <li class="active"><g:fieldValue bean="${organismoInstance}" field="nombre"/></li>
		</ul>
	</div>
</div>
		<div class="container">
			  <div class="row">
                    <header class="page-header">
                        <h3>Organismo <small class="lead"><g:fieldValue bean="${organismoInstance}" field="nombre"/></small></h3>
                    </header>
			</div>
			<!--
			<a href="#show-organismo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

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
			<div id="show-organismo" class="content scaffold-show" role="main">
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<ol class="property-list organismo">
				
					<g:if test="${organismoInstance?.comunidad}">
					<li class="fieldcontain">
						<label id="comunidad-label" class="property-label"><g:message code="organismo.comunidad.label" default="Comunidad" /></label>
						
							<span class="uneditable-input" aria-labelledby="comunidad-label"><g:fieldValue bean="${organismoInstance}" field="comunidad"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${organismoInstance?.emailFunc}">
					<li class="fieldcontain">
						<label id="emailFunc-label" class="property-label"><g:message code="organismo.emailFunc.label" default="Email Func" /></label>
						
							<span class="uneditable-input" aria-labelledby="emailFunc-label"><g:fieldValue bean="${organismoInstance}" field="emailFunc"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${organismoInstance?.emailTec}">
					<li class="fieldcontain">
						<label id="emailTec-label" class="property-label"><g:message code="organismo.emailTec.label" default="Email Tec" /></label>
						
							<span class="uneditable-input" aria-labelledby="emailTec-label"><g:fieldValue bean="${organismoInstance}" field="emailTec"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${organismoInstance?.nombre}">
					<li class="fieldcontain">
						<label id="nombre-label" class="property-label"><g:message code="organismo.nombre.label" default="Nombre" /></label>
						
							<span class="uneditable-input" aria-labelledby="nombre-label"><g:fieldValue bean="${organismoInstance}" field="nombre"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${organismoInstance?.nombreCorto}">
					<li class="fieldcontain">
						<label id="nombreCorto-label" class="property-label"><g:message code="organismo.nombreCorto.label" default="Nombre Corto" /></label>
						
							<span class="uneditable-input" aria-labelledby="nombreCorto-label"><g:fieldValue bean="${organismoInstance}" field="nombreCorto"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${organismoInstance?.nombreFunc}">
					<li class="fieldcontain">
						<label id="nombreFunc-label" class="property-label"><g:message code="organismo.nombreFunc.label" default="Nombre Func" /></label>
						
							<span class="uneditable-input" aria-labelledby="nombreFunc-label"><g:fieldValue bean="${organismoInstance}" field="nombreFunc"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${organismoInstance?.nombreTec}">
					<li class="fieldcontain">
						<label id="nombreTec-label" class="property-label"><g:message code="organismo.nombreTec.label" default="Nombre Tec" /></label>
						
							<span class="uneditable-input" aria-labelledby="nombreTec-label"><g:fieldValue bean="${organismoInstance}" field="nombreTec"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${organismoInstance?.telFunc}">
					<li class="fieldcontain">
						<label id="telFunc-label" class="property-label"><g:message code="organismo.telFunc.label" default="Tel Func" /></label>
						
							<span class="uneditable-input" aria-labelledby="telFunc-label"><g:fieldValue bean="${organismoInstance}" field="telFunc"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${organismoInstance?.telTec}">
					<li class="fieldcontain">
						<label id="telTec-label" class="property-label"><g:message code="organismo.telTec.label" default="Tel Tec" /></label>
						
							<span class="uneditable-input" aria-labelledby="telTec-label"><g:fieldValue bean="${organismoInstance}" field="telTec"/></span>
						
					</li>
					</g:if>
				
				</ol>
				<g:form>
					<fieldset class="form-actions">
						<g:hiddenField name="id" value="${organismoInstance?.id}" />
						<g:link class="edit" action="edit" id="${organismoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
