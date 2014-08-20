package ar.edu.pruebaconcepto.ui

import org.uqbar.arena.windows.WindowOwner
import ar.edu.pruebaconcepto.domain.Materia
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.pruebaconcepto.home.HomeMaterias
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import com.uqbar.commons.StringUtils
import org.uqbar.arena.widgets.Button

class NuevaMateriaWindow extends Dialog<Materia> {
	
	new(WindowOwner owner) {
		super(owner, new Materia)
	}
	
	
	override def createMainTemplate(Panel mainPanel) {
		this.title = "Nueva Materia"   
		
		super.createMainTemplate(mainPanel) 
		                     
	}
	override protected createFormPanel(Panel mainPanel) {
		val panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(2)
		new Label(panel).text = "Nombre:"
		new TextBox(panel)
			.withFilter[event | StringUtils::isAlphanumericSpace(event.potentialTextResult)]
			.bindValueToProperty("nombre")
					
		
	}
	
	override def executeTask() {
		homeMaterias().create(modelObject)
		super.executeTask()
	}
	
	override protected void addActions(Panel actions) {
		new Button(actions)
			.setCaption("Aceptar")
			.onClick [|this.accept]
			.setAsDefault.disableOnError

		new Button(actions) //
			.setCaption("Cancelar")
			.onClick [|this.cancel]
	}
	
	def HomeMaterias homeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia)) as HomeMaterias
	}
	
}