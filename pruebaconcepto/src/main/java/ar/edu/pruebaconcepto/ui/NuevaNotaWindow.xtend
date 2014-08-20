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

class NuevaNotaWindow extends Dialog<Nota> {
	
	new(WindowOwner owner) {
		super(owner, new Nota)
	}
	
	override def createMainTemplate(Panel mainPanel) {
		this.title = "Nueva Nota"   
		
		super.createMainTemplate(mainPanel) 
		                     
	}
	
	override def executeTask() {

		super.executeTask()
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def HomeMaterias homeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia)) as HomeMaterias
	}
	
}