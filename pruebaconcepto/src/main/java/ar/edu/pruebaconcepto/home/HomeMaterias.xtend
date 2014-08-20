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
		/*para ver que ande el edit y el - */
		var n1 = new LinkedList<Nota>
		var nota = new Nota
		var ubic= new UbicacionMateria
		ubic.anioMateria=2013
		ubic.cuandoSeDa="1 cuatri"
		nota.fecha="10/04/2014"
		nota.descripcion="1 parcial"
		nota.aprobado=true
		n1.add(nota)
		this.create("caca",2,true,"Pepe",n1, ubic)
		this.create("ASDASD",6,true,"Pepe",new LinkedList<Nota>, ubic)
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
		if (!(allInstances.filter[mat|mat.nombre.equalsIgnoreCase(nombre) ].toList.isEmpty)) {
			throw new UserException("Ya existe una materia con el nombre: " + nombre)
		}
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