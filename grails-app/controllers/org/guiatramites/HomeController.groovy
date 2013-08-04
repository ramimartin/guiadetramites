package org.guiatramites

import org.apache.ivy.core.resolve.RestartResolveProcess;
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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;


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
		//http://maps.googleapis.com/maps/api/geocode/json?address=Rivadavia+444%2C+clorinda+Formosa&sensor=true
		
		String address  =  params.direccion;
		
		String processedAddress= address.replaceAll(", ","+").replaceAll(" ","+");// URLEncoder.encode(address);
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
		
		String lat = "";
        String lon = "";
		try{
			JSONObject json = (JSONObject) JSONSerializer.toJSON( response.toString() ); 
			JSONArray results = json.getJSONArray("results");
			JSONObject something = results.getJSONObject(0);
			JSONObject geometry = something.getJSONObject("geometry");
			JSONObject location = geometry.getJSONObject("location");
			lat = location.getString("lat");
	        lon = location.getString("lng");
		} catch (java.lang.IndexOutOfBoundsException e){
			
		}
        
        /*double coolness = json.getDouble( "coolness" );
        int altitude = json.getInt( "altitude" );
        JSONObject pilot = json.getJSONObject("pilot");
        String firstName = pilot.getString("firstName");
        String lastName = pilot.getString("lastName");
        
        System.out.println( "Coolness: " + coolness );
        System.out.println( "Altitude: " + altitude );
        System.out.println( "Pilot: " + lastName );
        */
		//print result
		String value="";
		if (! "".equals(lat)){
			value=lat + "," + lon;
		} else {
			value = "--" + url + " -- "+ response.toString();
		}
		//return(address + " -- " + lat+","+lon);
		//return(value);
//render lat+'LONG '+lon;

		BuscarService buscar = new BuscarService();
		def tramite = Tramite.findByNombre(params.tramite)
		return [lat: lat, lon: lon, organismo: buscar.buscar(lat.toDouble(), lon.toDouble(), tramite.organismo_tipo), contenido: "Usted está aquí", 
			tramite:tramite];
			   
	}
	
}
