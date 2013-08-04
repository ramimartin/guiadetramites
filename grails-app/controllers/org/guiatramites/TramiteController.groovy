package org.guiatramites

import grails.converters.*

class TramiteController {
	
	def scaffold = Tramite
    
	def index() { 
		
	}
	
	def getName(){
		String nombre = (String)params.nombre;
		render Tramite.findAllByNombreLike('%'+nombre+'%') as JSON
	}
}
