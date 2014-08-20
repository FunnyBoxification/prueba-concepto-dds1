package ar.edu.pruebaconcepto.ui

import ar.edu.pruebaconcepto.domain.Nota
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class EditarNotaWindow extends Dialog<Nota>{
	
	new(WindowOwner owner, Nota nota) {
		super(owner, nota)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Editar Nota"
		val panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(2)
		new Label(panel).text = "Fecha: "
		new TextBox(panel).bindValueToProperty("fecha")
		new Label(panel).text = "Descripcion: " 
		new TextBox(panel).bindValueToProperty("descripcion")
		new Label(panel).text = "Aprobado: "
		new CheckBox(panel).bindValueToProperty("aprobado")
				
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel)
			.setCaption("Aceptar")
			.onClick [|this.accept]
			.setAsDefault.disableOnError	
	}
	
}