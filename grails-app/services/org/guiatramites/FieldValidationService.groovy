package org.guiatramites

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.ObjectInputStream.GetField;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;


class FieldValidationService {

	private final static String USER_AGENT = "Mozilla/5.0";
	def String latitud;
	def String longitud;

    def validateTramiteField(def nombre) {
		String result = "false"
		
		if (Tramite.findByNombre(nombre)!=null) {
            result = "true"
        }
                 
        return result;
	}
	
	def validateDireccionField(def direccion){
		String result = "false";
		
		calculateLatAndLong(direccion);
		
		if (latitud != null && longitud != null){
			result = "true";
		}
		
		return result;
    }
	def calculateLatAndLong(def direccion){
		if (latitud == null || longitud == null){
	        def coordenadas = new GeoLocationService().buscarLugar(direccion)
            latitud = coordenadas.latitud
            longitud = coordenadas.longitud
		}
	}
	
}
