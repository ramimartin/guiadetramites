<%@ page import="org.plis.Servicio" %>



<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'addressInbound', 'error')} ">
	<label for="addressInbound">
		<g:message code="servicio.addressInbound.label" default="Address Inbound" />
		
	</label>
	<g:textField name="addressInbound" value="${servicioInstance?.addressInbound}" />
</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'addressOutbound', 'error')} ">
	<label for="addressOutbound">
		<g:message code="servicio.addressOutbound.label" default="Address Outbound" />
		
	</label>
	<g:textField name="addressOutbound" value="${servicioInstance?.addressOutbound}" />
</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="servicio.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${servicioInstance?.descripcion}" />
</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="servicio.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${servicioInstance?.nombre}" />
</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'organismo', 'error')} ">
	<label for="organismo">
		<g:message code="servicio.organismo.label" default="Organismo" />
		
	</label>
	<g:select id="organismo" name="organismo.id" from="${org.plis.Organismo.list()}" optionKey="id" required="" value="${servicioInstance?.organismo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'versionService', 'error')} ">
	<label for="version">
		<g:message code="servicio.versionService.label" default="Version" />
		
	</label>
	<g:textField name="versionService" value="${servicioInstance?.versionService}" />
</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'wsdlLocation', 'error')} ">
	<label for="wsdlLocation">
		<g:message code="servicio.wsdlLocation.label" default="Wsdl Location" />
		
	</label>
	<g:field type="file" id="wsdlLocation" name="wsdlLocation" value="${servicioInstance?.wsdlLocation}" />
</div>



