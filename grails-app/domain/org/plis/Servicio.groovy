package org.plis

class Servicio {
	
	String nombre;
	String descripcion;
	String addressInbound;
	/*String namespace;*/
	/*String service;*/
	String addressOutbound;
	String versionService;
	byte[] wsdlLocation;
	
	static mapWith = "mongo"
	
	String toString(){ return "${nombre} ${descripcion}"}
	
	
	static belongsTo = [organismo: Organismo]
	
	static constraints = {
		wsdlLocation blank: false, nullable: false
	}

}
