package org.guiatramites

class BuscarService {

    def getOrganismos() {
		def organismos = Organismo.list([sort:"nombre", order:"asc"])
		
		return [organismos: organismos]
    }
	
	def buscar(params){
		
		def math = new MathService();
		Organismo org_cercano = math.findNearest(-34.213,-58.12415);
		
		return org_cercano;
	}
}
