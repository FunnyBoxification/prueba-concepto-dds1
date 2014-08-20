package ar.edu.pruebaconcepto.domain

import org.uqbar.commons.utils.Observable

@Observable
class Nota {
	@Property String fecha
	@Property String descripcion
	@Property Boolean aprobado
}