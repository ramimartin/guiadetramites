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
	
	private final static String USER_AGENT = "Mozilla/5.0";
	
    def index() { }

	def mapita() {
        return [lat: -25.695278,
         lng: -54.436667,
         contenido:'Cataratas del Iguazú!',
        pasos:'1.sad']
	}
	
	def buscar() {
		//params.direccion

        def coordenadas = new GeoLocationService().buscarLugar(params.direccion)
        println "$coordenadas.latitud $coordenadas.longitud"

		BuscarService buscar = new BuscarService();
		def tramite = Tramite.findByNombre(params.tramite)
        def organismo = buscar.buscar(coordenadas.latitud.toDouble(), coordenadas.longitud.toDouble(), tramite.organismo_tipo)
        println "$organismo.latitud $organismo.longitud $organismo.id $organismo.nombre"
		return [lat: coordenadas.latitud, lon: coordenadas.longitud,
                organismo: organismo,
                contenido: "Usted está aquí",
			tramite:tramite];
			   
	}
	
}
