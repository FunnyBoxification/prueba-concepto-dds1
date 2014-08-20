package ar.edu.pruebaconcepto.ui

import ar.edu.pruebaconcepto.domain.Nota
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Button

class EditarNotaWindow extends Dialog<Nota>{
	
	new(WindowOwner owner) {
		super(owner, new Nota)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val panel = new Panel(mainPanel)
		panel.layout = new VerticalLayout()
		new Label(panel).text = "Fecha: "
		new TextBox(panel).bindValueToProperty("fecha")
		new Label(panel).text = "Descripcion: " 
		new TextBox(panel).bindValueToProperty("descripcion")
		new CheckBox(panel).bindValueToProperty("aprobado")
				
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel)
			.setCaption("Aceptar")
			.onClick [|this.accept]
			.setAsDefault.disableOnError	
	}
	
}