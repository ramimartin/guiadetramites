package org.guiatramites

import grails.converters.JSON

/**
 * @author Ramiro Germán Martin
 */
class DireccionController {

    def autocompletar() {
        def json = new GeoLocationService().autocomplete(params.lugar, '20')
        def ret = []
        json.each { element ->
            ret.add(buildCity(element.address))
        }
        render(ret as JSON)
    }

    def buildCity(element) {
        "${element.road ?: element.pedestrian ?: ''} ${element.house_number ?: ''}, $element.city, $element.state"

    }
}
