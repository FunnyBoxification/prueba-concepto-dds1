package ar.edu.pruebaconcepto.home

import org.uqbar.commons.model.CollectionBasedHome
import ar.edu.pruebaconcepto.domain.UbicacionMateria
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
class HomeUbicacionMaterias extends CollectionBasedHome<UbicacionMateria> {
	
	new() {
		this.init()
	}
	
	def void init() { 
		
		this.create("1er Cuatrimestre",2)		
	}
	
	def void create(String a, Integer b) {
		var ubicacion = new UbicacionMateria()
		ubicacion.anioMateria = b
		ubicacion.cuandoSeDa = a
	}
	
	override protected getCriterio(UbicacionMateria example) {
		null
	}
	
	def List<UbicacionMateria> getUbicacionMaterias() {
		allInstances	
	}
	
	def UbicacionMateria get(String nombre,Integer anio) {
		ubicacionMaterias.findFirst [ modelo | modelo.cuandoSeDa.equals(nombre) && modelo.anioMateria.equals(anio) ]
	}
	
	override createExample() {
		new UbicacionMateria()
	}
	
	override getEntityType() {
		typeof(UbicacionMateria)
	}
	
}