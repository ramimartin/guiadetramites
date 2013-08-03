
<%@ page import="org.plis.SecUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require modules="bootstrap"/>
		<g:set var="entityName" value="${message(code: 'secUser.label', default: 'SecUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<!--
			<a href="#show-secUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			-->
			<div class="navbar">
				<div class="nav">
					<ul class="nav">
						<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
						<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
						<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
					</ul>
				</div>
			</div>				
			<div id="show-secUser" class="content scaffold-show" role="main">
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<ol class="property-list secUser">
				
					<g:if test="${secUserInstance?.accountExpired}">
					<li class="fieldcontain">
						<label id="accountExpired-label" class="property-label"><g:message code="secUser.accountExpired.label" default="Account Expired" /></label>
						
							<span class="uneditable-input" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${secUserInstance?.accountExpired}" /></span>
						
					</li>
					</g:if>
				
					<g:if test="${secUserInstance?.accountLocked}">
					<li class="fieldcontain">
						<label id="accountLocked-label" class="property-label"><g:message code="secUser.accountLocked.label" default="Account Locked" /></label>
						
							<span class="uneditable-input" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${secUserInstance?.accountLocked}" /></span>
						
					</li>
					</g:if>
				
					<g:if test="${secUserInstance?.enabled}">
					<li class="fieldcontain">
						<label id="enabled-label" class="property-label"><g:message code="secUser.enabled.label" default="Enabled" /></label>
						
							<span class="uneditable-input" aria-labelledby="enabled-label"><g:formatBoolean boolean="${secUserInstance?.enabled}" /></span>
						
					</li>
					</g:if>
				
					<g:if test="${secUserInstance?.password}">
					<li class="fieldcontain">
						<label id="password-label" class="property-label"><g:message code="secUser.password.label" default="Password" /></label>
						
							<span class="uneditable-input" aria-labelledby="password-label"><g:fieldValue bean="${secUserInstance}" field="password"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${secUserInstance?.passwordExpired}">
					<li class="fieldcontain">
						<label id="passwordExpired-label" class="property-label"><g:message code="secUser.passwordExpired.label" default="Password Expired" /></label>
						
							<span class="uneditable-input" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${secUserInstance?.passwordExpired}" /></span>
						
					</li>
					</g:if>
				
					<g:if test="${secUserInstance?.username}">
					<li class="fieldcontain">
						<label id="username-label" class="property-label"><g:message code="secUser.username.label" default="Username" /></label>
						
							<span class="uneditable-input" aria-labelledby="username-label"><g:fieldValue bean="${secUserInstance}" field="username"/></span>
						
					</li>
					</g:if>
				
				</ol>
				<g:form>
					<fieldset class="form-actions">
						<g:hiddenField name="id" value="${secUserInstance?.id}" />
						<g:link class="edit" action="edit" id="${secUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
