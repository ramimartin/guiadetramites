package org.guiatramites

import static java.lang.Math.*

class MathService {

    def distance(lat1, lat2, lon1, lon2) {
        sqrt(pow((lat1-lat2),2) + pow((lon1-lon2),2))
    }

    def findNearest(lat, lon) {
        Organismo.findAll().min { organismo ->
            distance(lat, organismo.latitude.toDouble(), lon, organismo.longitud.toDouble())
        }
    }
}
