package org.guiatramites

import org.guiatramites.BuscarService
import grails.converters.*


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.ObjectInputStream.GetField;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;



class HomeController{
		
    def index() { }

	def mapita() {
        return [lat: -25.695278,
         lng: -54.436667,
         contenido:'Cataratas del Iguazú!',
        pasos:'1.sad']
	}
	
	def buscar() {
		//params.direccion

		//http://maps.googleapis.com/maps/api/geocode/json?address=Rivadavia+444%2C+clorinda+Formosa&sensor=true
		
		String address  =  params.direccion;
		FieldValidationService validation = new FieldValidationService();
        if ("false".equals(validation.validateTramiteField(params.tramite)) || "false".equals(validation.validateTramiteField(address))){
       		return "error";
       	}
		

		
		String lat = validation.getLatitud();
        String lon = validation.getLongitud();
        
		//print result
		String value="";
		if (! "".equals(lat)){
			value=lat + "," + lon;
		} else {
			value = "--" + url + " -- "+ response.toString();
		}

		BuscarService buscar = new BuscarService();
		def tramite = Tramite.findByNombre(params.tramite);
        
		return [lat: lat, lon: lon, organismo: buscar.buscar(lat.toDouble(), lon.toDouble(), tramite.organismo_tipo), contenido: "Usted está aquí", tramite:tramite];
			   
	}
	
}
