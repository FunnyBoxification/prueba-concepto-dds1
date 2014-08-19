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

class SeguidorCarreraWindow extends SimpleWindow<SeguidorCarrera> {
	
	new(WindowOwner parent, SeguidorCarrera seguidorCarrera) {
		super(parent, seguidorCarrera)
		modelObject.searchMaterias()
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override def createMainTemplate(Panel mainPanel) {
		this.title = "Seguidor de Carrera"   
		taskDescription = "Seguidor de carrera"

		super.createMainTemplate(mainPanel) 
		
		this.createResultsGrid(mainPanel)
		this.createGridActions(mainPanel)                     
	}
	
	
	/**
	 * Panel principal de la prueba de concepto
	 */

	
	override def void createFormPanel(Panel mainPanel) {
		
	}
	
	def protected createResultsGrid(Panel mainPanel) {
		var table = new Table<Materia>(mainPanel, typeof(Materia))
		table.heigth = 400
		table.width = 100
		table.bindItemsToProperty("materias")
		table.bindValueToProperty("materiaSeleccionada")
		this.describeResultsGrid(table)

	}
	
	def describeResultsGrid(Table<Materia> table) {
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
	}
	
	/* actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)
		var edit = new Button(actionsPanel)
			.setCaption("Editar")
			.onClick [ | this.modificarCelular]

		var remove = new Button(actionsPanel)
			.setCaption("Borrar")
			.onClick [ | modelObject.eliminarCelularSeleccionado]
 
		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
		var elementSelected = new NotNullObservable("celularSeleccionado")
		remove.bindEnabled(elementSelected)
		edit.bindEnabled(elementSelected)*/
	
}