package ar.edu.pruebaconcepto.domain

import java.util.List
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable

@Observable 
class Materia extends Entity {
	@Property String nombre
	@Property Integer anioCursada
	@Property Boolean finalAprobado 
	@Property String profesor
	@Property List<Nota> notas
	@Property UbicacionMateria ubicacionMateria
	
	
	
	
	
	
}

