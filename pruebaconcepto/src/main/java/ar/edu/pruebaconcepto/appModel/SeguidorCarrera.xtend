package ar.edu.pruebaconcepto.appModel

import ar.edu.pruebaconcepto.domain.Materia
import ar.edu.pruebaconcepto.domain.Nota
import ar.edu.pruebaconcepto.home.HomeMaterias
import ar.edu.pruebaconcepto.home.HomeUbicacionMaterias
import java.io.Serializable
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import ar.edu.pruebaconcepto.domain.UbicacionMateria

@Observable
class SeguidorCarrera implements Serializable {
	@Property List<Materia> materias
	@Property List<Nota> notas
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	
	
	def HomeMaterias getHomeMaterias() {
		ApplicationContext.getInstance.getSingleton(typeof(Materia))
	}
	
	def HomeUbicacionMaterias getHomeUbicacionMaterias() {
		ApplicationContext.getInstance.getSingleton(typeof(UbicacionMateria))
	}
	
	def void searchMaterias() {
		this._materias = this.getHomeMaterias.allInstances();
	}
	
	def void eliminarNota() {
		materiaSeleccionada.notas.remove(notaSeleccionada)
		this.searchMaterias()
		notaSeleccionada = null
	}
	
}