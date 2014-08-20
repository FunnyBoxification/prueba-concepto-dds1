package ar.edu.pruebaconcepto.domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
class UbicacionMateria extends Entity {
	
	@Property String cuandoSeDa
	@Property Integer anioMateria
	
	def getDescripcionEntera() {
		cuandoSeDa.concat(" - ").concat(anioMateria.toString)
	}
		
}