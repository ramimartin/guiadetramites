package org.plis

import java.util.List;

class Organismo {

	String nombre;
	String nombreCorto;
	String comunidad;
	String nombreTec;
	String emailTec;
	String telTec;
	String nombreFunc;
	String emailFunc;
	String telFunc;
	
	static hasMany = [servicios: Servicio]	
	
	static belongsTo = [comunidad: Comunidad]
	
	 
	String toString(){ return "${nombre}"}
	
	 
	static mapWith = "mongo"
	
	static constraints = {
	}
}
