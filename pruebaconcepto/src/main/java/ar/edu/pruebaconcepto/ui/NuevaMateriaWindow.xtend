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

class NuevaMateriaWindow extends Dialog<Materia> {
	
	new(WindowOwner owner) {
		super(owner, new Materia)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val panel = new Panel(mainPanel)
		panel.layout = new ColumnLayout(2)
		new Label(panel).text = "Nombre:"
		new TextBox(panel)
			.withFilter[event | StringUtils::isAlphanumericSpace(event.potentialTextResult)]
			.bindValueToProperty("nombre")
	}
	
	/*
	 	val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)
		new Label(form).text = "Número"
		new TextBox(form)
			.withFilter [ event | StringUtils::isNumeric(event.potentialTextResult) ]
			.bindValueToProperty("numero")
		
		new Label(form).text = "Nombre del cliente"
		new TextBox(form).bindValueToProperty("nombre")
		new Label(form).text = "Modelo del aparato"
		val selectorModelo = new Selector<Modelo>(form)
		selectorModelo.allowNull(false)
		selectorModelo.bindValueToProperty("modeloCelular")
		var propiedadModelos = selectorModelo.bindItems(new ObservableProperty(homeModelos, "modelos"))
		propiedadModelos.adapter = new PropertyAdapter(typeof(Modelo), "descripcionEntera")
		new Label(form).text = "Recibe resumen cuenta en domicilio"
		var checkResumen = new CheckBox(form)
		checkResumen.bindEnabledToProperty("habilitaResumenCuenta")
		checkResumen.bindValueToProperty("recibeResumenCuenta")
	 */
	
	def HomeMaterias homeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia)) as HomeMaterias
	}
	
}