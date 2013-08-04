package org.guiatramites

import static java.lang.Math.*

class MathService {

    def distance(lat1, lat2, lon1, lon2) {
        lat1+lon1 - (lat2+lon2)

    }

    def findNearest(lat, lon) {
        Organismo.findAll().min { organismo ->
            distance(lat, organismo.latitude.toDouble(), lon, organismo.longitud.toDouble())
        }
    }
}
