package org.guiatramites

import static java.lang.Math.*

class MathService {

    def distance(lat1, lat2, lon1, lon2) {
        sqrt(pow((lat1-lat2),2) + pow((lon1-lon2),2))
    }

    def findNearest(lat, lon, organismo_tipo) {
        def results = Organismo.findAll{tipo == organismo_tipo}
		println results
		results.min { organismo ->
            def dis = distance(lat, organismo.latitud?.toDouble(), lon, organismo.longitud?.toDouble())
			println dis
			println organismo
			dis
			
        }
    }
}
