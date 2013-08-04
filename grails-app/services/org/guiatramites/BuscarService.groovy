package org.guiatramites

class BuscarService {

    def getOrganismos() {
		def organismos = Organismo.list([sort:"nombre", order:"asc"])
		
		return [organismos: organismos]
    }
}
