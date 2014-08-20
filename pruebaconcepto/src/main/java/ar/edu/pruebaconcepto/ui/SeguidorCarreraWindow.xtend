package ar.edu.pruebaconcepto.ui

import org.uqbar.arena.windows.SimpleWindow
import ar.edu.pruebaconcepto.appModel.SeguidorCarrera
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.tables.Table
import ar.edu.pruebaconcepto.domain.Materia
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.pruebaconcepto.domain.Nota

class SeguidorCarreraWindow extends SimpleWindow<SeguidorCarrera> {
	
	new(WindowOwner parent) {
		super(parent, new SeguidorCarrera)
		modelObject.searchMaterias()
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override def createMainTemplate(Panel mainPanel) {
		this.title = "Seguidor de Carrera"   
		taskDescription = "Seguidor de carrera"

		super.createMainTemplate(mainPanel) 
		
		this.createMateriassGrid(mainPanel)
		this.createGridActions(mainPanel)                     
	}
	
	
	/**
	 * Panel principal de la prueba de concepto
	 */

	
	override def void createFormPanel(Panel mainPanel) {
		
		/*val materiasPanel = new Panel(mainPanel)
		materiasPanel.setLayout(new ColumnLayout(2))*/
		
		//Le mando el grid de notas en el mainPanel a ver que onda
		var table = new Table<Nota>(mainPanel,typeof(Nota))
		table.heigth = 200
		table.width = 200
		table.bindItemsToProperty("notas")
		table.bindValueToProperty("notaSeleccionada")
		this.describeNotasGrid(table)
		
	}
	

	def describeNotasGrid(Table<Nota> table) {
		
		new Column<Nota>(table) //
			.setTitle("Fecha")
			.setFixedSize(150)
			.bindContentsToProperty("fecha")

		new Column<Nota>(table) //
			.setTitle("Descripcion")
			.setFixedSize(100)
			.bindContentsToProperty("descripcion")

		new Column<Nota>(table)
			.setTitle("Aprobado")
			.setFixedSize(150)
			.bindContentsToTransformer([ nota | if(nota.aprobado) "Si" else "No"])
		
	}
	
	
	def protected createMateriassGrid(Panel mainPanel) {
		var table = new Table<Materia>(mainPanel, typeof(Materia))
		table.heigth = 400
		table.width = 100
		table.bindItemsToProperty("materias")
		table.bindValueToProperty("materiaSeleccionada")
		this.describeMateriasGrid(table)
		//table.

	}
	
	def describeMateriasGrid(Table<Materia> table) {
		new Column<Materia>(table)
			.setTitle("Materias")
			.bindContentsToProperty("nombre")

	}
	
	def void createGridActions(Panel mainPanel) {
		var actionsNotasPanel = new Panel(mainPanel)
		actionsNotasPanel.setLayout(new HorizontalLayout)
		var editNota = new Button(actionsNotasPanel)
			.setCaption("Editar")
			.onClick [|] //termina
			
		new Button(actionsNotasPanel)
			.setCaption("+")
			.onClick[ | this.nuevaMateria() ]
		
		var eliminarNota = new Button(actionsNotasPanel)
			.setCaption("-")
			.onClick[ | ]
		
		//Si no hay ninguna nota seleccionada entonces que se deshabiliten los botones	
		var elementoSeleccionado = new NotNullObservable("notaSeleccionada")
		editNota.bindEnabled(elementoSeleccionado)
		eliminarNota.bindEnabled(elementoSeleccionado)
		
	}
	
	def void nuevaMateria() {
		this.openDialog(new NuevaMateriaWindow(this))
	}
	
	def openDialog(Dialog<?> dialog) {
		//Esto es igual a continuations man
		dialog.onAccept[|modelObject.searchMaterias]
		dialog.open
	}
	
	
}