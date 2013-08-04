package org.guiatramites

class BuscarService {

    def getOrganismos() {
		def organismos = Organismo.list([sort:"nombre", order:"asc"])
		
		return [organismos: organismos]
    }
	
	def buscar(def latitud, def longitud, def organismo_tipo){
		
		def math = new MathService();
		Organismo org_cercano = math.findNearest(latitud,longitud, organismo_tipo);
		
		return  org_cercano;
	}
}
