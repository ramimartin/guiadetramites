package org.plis

class Comunidad {

	String nombre
	String description

	static hasMany = [organismos: Organismo]
	
	static mapWith = "mongo"
	
    static constraints = {
    }
}
