package ar.edu.pruebaconcepto.ui

import org.uqbar.arena.windows.WindowOwner
import ar.edu.pruebaconcepto.domain.Materia
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel

class NuevaMateriaWindow extends Dialog<Materia> {
	
	new(WindowOwner owner) {
		super(owner, new Materia)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}