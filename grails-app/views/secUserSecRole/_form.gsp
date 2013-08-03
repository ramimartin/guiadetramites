<%@ page import="org.plis.SecUserSecRole" %>



<div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secRole', 'error')} ">
	<label for="secRole">
		<g:message code="secUserSecRole.secRole.label" default="Sec Role" />
		
	</label>
	<g:select id="secRole" name="secRole.id" from="${org.plis.SecRole.list()}" optionKey="id" required="" value="${secUserSecRoleInstance?.secRole?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserSecRoleInstance, field: 'secUser', 'error')} ">
	<label for="secUser">
		<g:message code="secUserSecRole.secUser.label" default="Sec User" />
		
	</label>
	<g:select id="secUser" name="secUser.id" from="${org.plis.SecUser.list()}" optionKey="id" required="" value="${secUserSecRoleInstance?.secUser?.id}" class="many-to-one"/>
</div>

