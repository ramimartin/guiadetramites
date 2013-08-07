package org.guiatramites



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(GeoLocationService)
class GeoLocationServiceTests {

    void testSomething() {
        def coordenadas = new GeoLocationService().buscarLugar("Salcedo 1051,Wilde")
        println "assert latitud"
        assertEquals("-34.6984264", coordenadas.latitud)
        println "assert longitud"
        assertEquals("-58.314592", coordenadas.longitud)
    }
}
