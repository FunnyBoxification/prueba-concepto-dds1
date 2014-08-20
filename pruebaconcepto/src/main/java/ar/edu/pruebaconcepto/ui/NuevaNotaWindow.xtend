package ar.edu.pruebaconcepto.ui

import org.uqbar.arena.windows.Dialog
import ar.edu.pruebaconcepto.domain.Nota
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

class NuevaNotaWindow extends Dialog<Nota> {
	
	new(WindowOwner owner) {
		super(owner, new Nota)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}