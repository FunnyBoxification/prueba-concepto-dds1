package ar.edu.pruebaconcepto.ui

import ar.edu.pruebaconcepto.appModel.SeguidorCarrera
import ar.edu.pruebaconcepto.domain.Materia
import ar.edu.pruebaconcepto.domain.Nota
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class SeguidorCarreraWindow extends SimpleWindow<SeguidorCarrera> {
	
	new(WindowOwner parent) {
		super(parent, new SeguidorCarrera)
		modelObject.searchMaterias()
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel)
			.setCaption("Nueva Materia")
			.onClick[ | this.nuevaMateria() ] 
			.setAsDefault
			.disableOnError
	}
	
	override def createMainTemplate(Panel mainPanel) {
		this.title = "Seguidor de Carrera"   
		taskDescription = "Seguidor de carrera"
		
		super.createMainTemplate(mainPanel) 
		                     
	}
	
	
	override def void createFormPanel(Panel mainPanel) {
		var gralPanel = new Panel(mainPanel) 
		gralPanel.layout = new ColumnLayout(2)
		
		/*
		 * A cada "zona" le paso un panel nuevo, y dentro de cada metodo se arma el layout como se quiera.
		 * Se hace aca el new Panel() para que sea claro la agregacion de dos nuevos paneles
		 * a la organizacion de la pantalla
		 */
		this.createLeftPanel(new Panel(gralPanel))
		this.createRightPanel(new Panel(gralPanel))
		
		/*
		 * TODO ver si hay que borrar.
		 * mantuve el codigo por si no les gustan los cambios :P
		 */
		
//		this.createMateriasGrid(mainPanel)
//		var labelNomMateria = new Label(mainPanel)
//		labelNomMateria.bindValueToProperty("materiaSeleccionada.nombre")
//		labelNomMateria.fontSize = 16
//		
//		var panel = new Panel(mainPanel)
//		panel.layout = new HorizontalLayout()
//		
//		new Label(panel).text = "A?o"
//		var textBoxAnio = new TextBox(panel)
//		textBoxAnio.heigth = 10
//		textBoxAnio.bindValueToProperty("materiaSeleccionada.anioCursada")
//		
//		new Label(panel).text = "Final aprobado"
//		var checkFinal = new CheckBox(panel)
//		checkFinal.bindValueToProperty("materiaSeleccionada.finalAprobado")
//		
//		new Label(panel).text = "Profesor"
//		var textBoxProfe = new TextBox(panel)
//		textBoxProfe.bindValueToProperty("materiaSeleccionada.profesor")
//		
//		//Falta Ubicaciones de materias con Selector ACA
//		
//		new Label(mainPanel).text = "Notas cursada"
//		
//		var materiasPanel = new Panel(mainPanel)
//		materiasPanel.setLayout(new ColumnLayout(2))
//		
////		this.createMateriasGrid(materiasPanel)
////		var labelNomMateria = new Label(materiasPanel)
////		labelNomMateria.bindValueToProperty("materiaSeleccionada.nombre")
//		this.createNotasGrid(materiasPanel)
//		this.createGridActions(materiasPanel) 
		
		
	}
	
	def createLeftPanel(Panel leftPanel){
		var table = new Table<Materia>(leftPanel, typeof(Materia))
		table.heigth = 300
		table.width = 100
		table.bindItemsToProperty("materias")
		table.bindSelectionToProperty("materiaSeleccionada")
		this.describeMateriasGrid(table)
		//table.
	}
	
	def createRightPanel(Panel rightPanel){
		this.createDatosMateria(new Panel(rightPanel))
		new Label(rightPanel).text = "Notas cursada"
		this.createNotasGrid(rightPanel)
		this.createGridActions(rightPanel)
	}
	
	def createDatosMateria(Panel datosMatPanel){
		var labelNomMateria = new Label(datosMatPanel)
		labelNomMateria.bindValueToProperty("materiaSeleccionada.nombre")
		labelNomMateria.fontSize = 16
		
		var datosPanel = new Panel(datosMatPanel)
		/*
		 * Lo que sigue se que es complicado de leer pero fue la unica manera
		 * que se me ocurrio que quedara mas o menos como en el ejmplo
		 */		
		var horizPanel = new Panel(datosPanel)
		horizPanel.layout = new HorizontalLayout()
		
			new Label(horizPanel).text = "Año"
			var textBoxAnio = new TextBox(horizPanel)
			textBoxAnio.bindValueToProperty("materiaSeleccionada.anioCursada")
			
			new Label(horizPanel).text = "Final aprobado"
			var checkFinal = new CheckBox(horizPanel)
			checkFinal.bindValueToProperty("materiaSeleccionada.finalAprobado")
		
		var col2Panel = new Panel(datosPanel)
		col2Panel.layout = new ColumnLayout(2)
		
			new Label(col2Panel).text = "Profesor: "
			var textBoxProfe = new TextBox(col2Panel)
			textBoxProfe.bindValueToProperty("materiaSeleccionada.profesor")
			textBoxProfe.setWidth(150)
			
			//Falta bindear Ubicaciones de materias con Selector ACA
			new Label(col2Panel).text = "Ubicacion materia: "
			var textBoxUbicMat = new TextBox(col2Panel)
			textBoxUbicMat.setWidth(150)
			
	}
	
	def createNotasGrid(Panel mainPanel) {
		var table = new Table<Nota>(mainPanel,typeof(Nota))
		table.heigth = 150
		table.width = 250
		table.bindItemsToProperty("materiaSeleccionada.notas")
		table.bindValueToProperty("notaSeleccionada")
		this.describeNotasGrid(table)
		
	}
	

	def describeNotasGrid(Table<Nota> table) {
		
		new Column<Nota>(table) //
			.setTitle("Fecha")
			//.setFixedSize(50)
			.bindContentsToProperty("fecha")

		new Column<Nota>(table) //
			.setTitle("Descripcion")
			//.setFixedSize(150)
			.bindContentsToProperty("descripcion")

		new Column<Nota>(table)
			.setTitle("Aprobado")
			//.setFixedSize(50)
			.bindContentsToTransformer([ nota | if(nota.aprobado) "Si" else "No"])
		
	}
	
	
//	def protected createMateriasGrid(Panel mainPanel) {
//		var table = new Table<Materia>(mainPanel, typeof(Materia))
//		table.heigth = 100
//		table.width = 100
//		table.bindItemsToProperty("materias")
//		table.bindSelectionToProperty("materiaSeleccionada")
//		this.describeMateriasGrid(table)
//		//table.
//
//	}
	
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
			.onClick [| this.editarNota()] //termina
			
		new Button(actionsNotasPanel)
			.setCaption("+")
			.onClick[ | this.nuevaNota() ] 
		
		var eliminarNota = new Button(actionsNotasPanel)
			.setCaption("-")
			.onClick[ | modelObject.notas.remove(modelObject.notaSeleccionada) ]
		
		//Si no hay ninguna nota seleccionada entonces que se deshabiliten los botones	
		var elementoSeleccionado = new NotNullObservable("notaSeleccionada")
		editNota.bindEnabled(elementoSeleccionado)
		eliminarNota.bindEnabled(elementoSeleccionado)
		
	}
	
	def editarNota() {
		this.openDialog(new EditarNotaWindow(this,modelObject.notaSeleccionada))
	}
	
	def void nuevaNota() {
		this.openDialog(new NuevaNotaWindow(this))
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