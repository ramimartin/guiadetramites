import org.guiatramites.Organismo;
import org.guiatramites.Tramite;

class BootStrap {
	
    def init = {servletContext ->
        // Check whether the test data already exists.
        if (!Organismo.count()) {
            new Organismo(nombre: "AFIP N°1", description:"AFIP N°1", latitude:"-34,1251", longitud:"-58,1241412").save(failOnError: true)
			new Organismo(nombre: "AFIP N°2", description:"AFIP N°2", latitude:"-34,1245", longitud:"-58,12353").save(failOnError: true)
			new Organismo(nombre: "AFIP N°3", description:"AFIP N°3", latitude:"-34,1123", longitud:"-58,6543").save(failOnError: true)
        }
    }
    def destroy = {
    }
}
