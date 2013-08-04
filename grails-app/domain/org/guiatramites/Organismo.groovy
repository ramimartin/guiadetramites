package org.guiatramites

import java.awt.TexturePaintContext.Int;

class Organismo {

	String id
	String nombre
	String description
	String latitud
	String longitud
	String tipo
	
	static hasMany = [tramites: Tramite]
	
	static mapWith = "mongo"
	
    static constraints = {
    }

	@Override
	public String toString() {
		return "Organismo [nombre=" + nombre + ", latitud=" + latitud + ", longitud=" + longitud + "]";
	}	
	
}
