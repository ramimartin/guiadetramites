package org.guiatramites

class Tramite {
	
	String nombre
	String organismo
	String en_que_consiste
	String requisitos
	String como_se_hace_el_tramite
	String quien_puede_o_debe_efectuarlo
	String que_vigencia_tiene_el_documento
	String cuantas_veces_deberia_asistir_al_organismo
	String tiempo_desde_la_solicitud_hasta_la_entrega
	String donde_se_puede_realizar
	String cuando_es_necesario_realizar_el_tramite
	String observaciones
	
	static belongsTo = Organismo
	static hasMany = [organismos: Organismo]
	
	static mapWith = "mongo"
	
    static constraints = {
    }
}
