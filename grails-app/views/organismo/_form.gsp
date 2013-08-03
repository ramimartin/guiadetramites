<%@ page import="org.plis.Organismo" %>



<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'comunidad', 'error')} ">
	<label for="comunidad">
		<g:message code="organismo.comunidad.label" default="Comunidad" />
		
	</label>
	<g:textField name="comunidad" value="${organismoInstance?.comunidad}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'emailFunc', 'error')} ">
	<label for="emailFunc">
		<g:message code="organismo.emailFunc.label" default="Email Func" />
		
	</label>
	<g:textField name="emailFunc" value="${organismoInstance?.emailFunc}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'emailTec', 'error')} ">
	<label for="emailTec">
		<g:message code="organismo.emailTec.label" default="Email Tec" />
		
	</label>
	<g:textField name="emailTec" value="${organismoInstance?.emailTec}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="organismo.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${organismoInstance?.nombre}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'nombreCorto', 'error')} ">
	<label for="nombreCorto">
		<g:message code="organismo.nombreCorto.label" default="Nombre Corto" />
		
	</label>
	<g:textField name="nombreCorto" value="${organismoInstance?.nombreCorto}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'nombreFunc', 'error')} ">
	<label for="nombreFunc">
		<g:message code="organismo.nombreFunc.label" default="Nombre Func" />
		
	</label>
	<g:textField name="nombreFunc" value="${organismoInstance?.nombreFunc}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'nombreTec', 'error')} ">
	<label for="nombreTec">
		<g:message code="organismo.nombreTec.label" default="Nombre Tec" />
		
	</label>
	<g:textField name="nombreTec" value="${organismoInstance?.nombreTec}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'telFunc', 'error')} ">
	<label for="telFunc">
		<g:message code="organismo.telFunc.label" default="Tel Func" />
		
	</label>
	<g:textField name="telFunc" value="${organismoInstance?.telFunc}" />
</div>

<div class="fieldcontain ${hasErrors(bean: organismoInstance, field: 'telTec', 'error')} ">
	<label for="telTec">
		<g:message code="organismo.telTec.label" default="Tel Tec" />
		
	</label>
	<g:textField name="telTec" value="${organismoInstance?.telTec}" />
</div>

