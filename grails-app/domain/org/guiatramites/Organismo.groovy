package org.guiatramites

import java.awt.TexturePaintContext.Int;

class Organismo {

	String nombre
	String description
	String latitude
	String longitud

	static hasMany = [tramites: Tramite]
	
	static mapWith = "mongo"
	
    static constraints = {
    }
}
