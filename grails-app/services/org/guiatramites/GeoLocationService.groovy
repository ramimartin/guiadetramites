package org.guiatramites

import groovy.json.JsonSlurper

class GeoLocationService {

    private def static OPS_URL = 'http://nominatim.openstreetmap.org/search/${query}?format=json&' +
            'countrycodes=AR&limit=${limit}&accept-language=es&addressdetails=1'

    def buscarLugar(def lugar) {
        def coordenadas = new Coordenadas()
        def json = autocomplete(lugar)
        if (json){
            coordenadas.latitud = json.first().lat
            coordenadas.longitud = json.first().lon
        }

        coordenadas


    }

    def autocomplete(def lugar, def limite='1'){
        def obj = new URL(OPS_URL.replace('${query}', normalizar(lugar)).replace('${limit}',limite));
        def con = (HttpURLConnection) obj.openConnection();
        con.requestMethod = 'GET'
        new JsonSlurper().parseText(con.inputStream.text);
    }

    private normalizar(String string){
        string.replace(" ","%20").replace("á","a").replace("é","e").replace("í","i").replace("ó", "o").replace("ú", "u")
                .replace("ü","u").replace("ñ","n");
    }
/*

    [
    {
        place_id: "98240674",
        licence: "Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright",
        osm_type: "relation",
        osm_id: "2145974",
        boundingbox: [
                "-34.7270088195801",
                "-34.6701965332031",
                "-58.3475189208984",
                "-58.279842376709"
        ],
        lat: "-34.6984264",
        lon: "-58.314592",
        display_name: "Wilde, Partido de Avellaneda, Buenos Aires, Argentina",
        class: "boundary",
        type: "administrative",
        importance: 0.64591738766298,
        icon: "http://nominatim.openstreetmap.org/images/mapicons/poi_boundary_administrative.p.20.png"
    }
    ]*/
}
