package ar.edu.pruebaconcepto.domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
class Nota extends Entity {
	@Property String fecha
	@Property String descripcion
	@Property Boolean aprobado
}