package ar.edu.pruebaconcepto.appModel

import ar.edu.pruebaconcepto.domain.Materia
import ar.edu.pruebaconcepto.domain.Nota
import ar.edu.pruebaconcepto.home.HomeMaterias
import java.io.Serializable
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

@Observable
class SeguidorCarrera implements Serializable {
	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	
	
	def HomeMaterias getHomeMaterias() {
		ApplicationContext.getInstance.getSingleton(typeof(Materia))
	}
	
	def void searchMaterias() {
		this._materias = this.getHomeMaterias.allInstances();
		return
	}
	
	
}