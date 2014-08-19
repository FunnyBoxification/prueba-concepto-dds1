package ar.edu.pruebaconcepto.home

import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable
import ar.edu.pruebaconcepto.domain.Materia
import java.util.List

@Observable
class HomeMaterias extends CollectionBasedHome<Materia> {
	
	new() {
		this.init
	}

	def void init() {
		
	}
	
	def void create(String descripcion, float costo, boolean requiereResumenCuenta) {
	
	}

	def List<Materia> getMaterias() {
		allInstances	
	}
	
	def Materia get(String nombre) {
		materias.findFirst [ modelo | modelo.nombre.equals(nombre) ]
	}
	
	override protected getCriterio(Materia example) {
		null
	}
	
	override createExample() {
		new Materia();
	}
	
	override getEntityType() {
		typeof(Materia)
	}
	
}