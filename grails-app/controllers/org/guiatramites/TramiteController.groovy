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
	
	def validate = {
		String nombre = (String)params.nombre;
		FieldValidationService validation = new FieldValidationService();

        response.setContentType("text/json;charset=UTF-8");
        render validation.validateTramiteField(nombre);
	}

    def autocompletar(){
        def json = new GeoLocationService().autocomplete(params.lugar,'20')
        def ret=[]
        json.each {element->
            ret.add(element['display_name'])
        }
    }

}
