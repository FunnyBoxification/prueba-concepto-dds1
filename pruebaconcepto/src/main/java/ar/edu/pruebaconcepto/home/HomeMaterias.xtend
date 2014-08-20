package ar.edu.pruebaconcepto.home

import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable
import ar.edu.pruebaconcepto.domain.Materia
import java.util.List
import ar.edu.pruebaconcepto.domain.Nota
import ar.edu.pruebaconcepto.domain.UbicacionMateria
import org.uqbar.commons.model.UserException
import java.util.LinkedList

@Observable
class HomeMaterias extends CollectionBasedHome<Materia> {
	
	new() {
		this.init
	}

	def void init() {
		this.create("caca",2,true,"Pepe",new LinkedList<Nota>, new UbicacionMateria())
	}
	
	def void create(String pNombre, Integer pAnioCursada, Boolean pFinal, String pProfe, List<Nota> pNotas, UbicacionMateria ubicacion ) {
		var materia = new Materia()
		materia.nombre = pNombre
		materia.anioCursada = pAnioCursada
		materia.finalAprobado = pFinal
		materia.profesor = pProfe
		materia.notas = pNotas
		materia.ubicacionMateria = ubicacion	
		
		this.create(materia)
	}

	override void validateCreate(Materia materia) {
		materia.validar()
		validarMateriasDuplicadas(materia)
	}
	
	def void validarMateriasDuplicadas(Materia materia) {
		val nombre = materia.nombre
		if (!(allInstances.filter[mat|this.match(nombre, materia.nombre) ].toList.isEmpty)) {
			throw new UserException("Ya existe una materia con el nombre: " + nombre)
		}
	}
	
	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
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