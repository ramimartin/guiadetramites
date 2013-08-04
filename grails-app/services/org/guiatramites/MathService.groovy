package org.guiatramites

import static java.lang.Math.*

class MathService {

    def distance(lat1, lat2, lon1, lon2) {
        2 * asin((sqrt((sin((lat1 - lat2) / 2)) ^ 2 +
                cos(lat1) * cos(lat2) * (sin((lon1 - lon2) / 2)) ^ 2)))

    }

    def findNearest(lat, lon) {
        Organismo.findAll().min { organismo ->
            distance(lat, organismo.lat, lon, organismo.lon)
        }
    }
}
