package org.guiatramites

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.ObjectInputStream.GetField;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

class FieldValidationService {

	private final static String USER_AGENT = "Mozilla/5.0";
	String latitud;
	String longitud;

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
	
	def getLatitude(){
		return latitud;
	}
	
	def getLongitud(){
		return longitud;
	}
	
	def calculateLatAndLong(def direccion){
		if (latitud == null || longitud == null){
	
		
			String processedAddress= direccion.replaceAll(", ","+").replaceAll(" ","+");// URLEncoder.encode(address);
			processedAddress = processedAddress.replaceAll("á","a").replaceAll("é","e").replaceAll("í","i").replaceAll("ó", "o").replaceAll("ú", "u").replaceAll("ü","u").replaceAll("ñ","n");
				
			String url = "http://maps.googleapis.com/maps/api/geocode/json?sensor=true&address=" + processedAddress; //Rivadavia+444%2C+clorinda+Formosa";
	 
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			
			// optional default is GET
			con.setRequestMethod("GET");
	 
			//add request header
			con.setRequestProperty("User-Agent", USER_AGENT);
	 
			//int responseCode = con.getResponseCode();
			//System.out.println("\nSending 'GET' request to URL : " + url);
			//System.out.println("Response Code : " + responseCode);
	 
			BufferedReader ind = new BufferedReader(
			        new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
	 
			while ((inputLine = ind.readLine()) != null) {
				response.append(inputLine);
			}
			ind.close();
			
			latitud = null;
	        longitud = null;
			try{
				JSONObject json = (JSONObject) JSONSerializer.toJSON( response.toString() ); 
				JSONArray results = json.getJSONArray("results");
				JSONObject something = results.getJSONObject(0);
				JSONObject geometry = something.getJSONObject("geometry");
				JSONObject location = geometry.getJSONObject("location");
				latitud = location.getString("lat");
		        longitud = location.getString("lng");
			} catch (java.lang.IndexOutOfBoundsException e){
					
			}
			
		}
	}
	
}
