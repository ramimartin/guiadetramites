<%@ page import="org.plis.Comunidad" %>



<div class="fieldcontain ${hasErrors(bean: comunidadInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="comunidad.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${comunidadInstance?.description}" />
</div>

<div class="fieldcontain ${hasErrors(bean: comunidadInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="comunidad.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${comunidadInstance?.nombre}" />
</div>

<div class="fieldcontain ${hasErrors(bean: comunidadInstance, field: 'organismos', 'error')} ">
	<label for="organismos">
		<g:message code="comunidad.organismos.label" default="Organismos" />
		
	</label>
	<g:select name="organismos" from="${org.plis.Organismo.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${comunidadInstance?.organismos*.id}" class="many-to-many"/>
</div>

