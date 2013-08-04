package org.guiatramites

import org.guiatramites.BuscarService
import grails.converters.*


class HomeController{

    def index() { }

	def mapita() {
        return [lat: -25.695278,
         lng: -54.436667,
         contenido:'Cataratas del Iguazú!',
        pasos:'1.sad']
	}
	
	def buscar() {
		BuscarService buscar = new BuscarService();
		return [organismo: buscar.buscar(params)];
	}
}
