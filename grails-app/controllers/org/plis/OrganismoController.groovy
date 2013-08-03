package org.plis

class OrganismoController {

	def scaffold = Organismo

	def index = {
		def organismos = Organismo.list([sort:"nombre", order:"asc"])

		return [organismos: organismos]
	}
}
