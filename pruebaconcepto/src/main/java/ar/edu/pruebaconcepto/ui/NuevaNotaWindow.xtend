package ar.edu.pruebaconcepto.ui

import org.uqbar.arena.windows.Dialog
import ar.edu.pruebaconcepto.domain.Nota
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import ar.edu.pruebaconcepto.home.HomeMaterias
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.pruebaconcepto.domain.Materia
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Button

class NuevaNotaWindow extends EditarNotaWindow {
	
	new(WindowOwner owner) {
		super(owner, new Nota)
	}
	
	
	override def createMainTemplate(Panel mainPanel) {
		this.title = "Nueva Nota"   
		
		super.createMainTemplate(mainPanel) 
		                     
	}
	
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Nueva Nota"
		val panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(2)
		new Label(panel).text = "Fecha: "
		new TextBox(panel).bindValueToProperty("fecha")
		new Label(panel).text = "Descripcion: " 
		new TextBox(panel).bindValueToProperty("descripcion")
		new Label(panel).text = "Aprobado: "
		new CheckBox(panel).bindValueToProperty("aprobado")
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