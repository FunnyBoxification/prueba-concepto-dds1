package ar.edu.pruebaconcepto.appModel

import ar.edu.pruebaconcepto.domain.Materia
import java.io.Serializable
import java.util.List
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.pruebaconcepto.home.HomeMaterias

@Observable
class SeguidorCarrera implements Serializable {
	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	
	
	def HomeMaterias getHomeMaterias() {
		ApplicationContext.getInstance.getSingleton(typeof(Materia))
	}
	
	
}