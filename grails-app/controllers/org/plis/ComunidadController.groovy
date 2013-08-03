package org.plis

class ComunidadController {

	def scaffold = Comunidad
	
    def index() {
		def comunidades = Comunidad.list([sort:"nombre", order:"asc"])
		
		return [comunidades: comunidades]
		
	}
}
