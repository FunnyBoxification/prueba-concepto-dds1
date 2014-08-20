package ar.edu.pruebaconcepto.runnable

import ar.edu.pruebaconcepto.domain.Materia
import ar.edu.pruebaconcepto.home.HomeMaterias
import ar.edu.pruebaconcepto.ui.SeguidorCarreraWindow
import org.uqbar.arena.Application
import org.uqbar.commons.utils.ApplicationContext

class SeguidorCarreraApplication extends Application {
	
	static def void main(String[] args) { 
		new SeguidorCarreraApplication().start()
	}
	
	override protected createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Materia), new HomeMaterias)
		return new SeguidorCarreraWindow(this)
	}
	
}