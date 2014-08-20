package ar.edu.pruebaconcepto.ui;

import ar.edu.pruebaconcepto.domain.Materia;
import ar.edu.pruebaconcepto.domain.Nota;
import ar.edu.pruebaconcepto.home.HomeMaterias;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.ApplicationContext;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class NuevaNotaWindow extends Dialog<Nota> {
  public NuevaNotaWindow(final WindowOwner owner) {
    super(owner, new Nota());
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    this.setTitle("Nueva Nota");
    super.createMainTemplate(mainPanel);
  }
  
  public void executeTask() {
    super.executeTask();
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Editar Nota");
    final Panel panel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    panel.setLayout(_columnLayout);
    Label _label = new Label(panel);
    _label.setText("Fecha: ");
    TextBox _textBox = new TextBox(panel);
    _textBox.<ControlBuilder>bindValueToProperty("fecha");
    Label _label_1 = new Label(panel);
    _label_1.setText("Descripcion: ");
    TextBox _textBox_1 = new TextBox(panel);
    _textBox_1.<ControlBuilder>bindValueToProperty("descripcion");
    Label _label_2 = new Label(panel);
    _label_2.setText("Aprobado: ");
    CheckBox _checkBox = new CheckBox(panel);
    _checkBox.<ControlBuilder>bindValueToProperty("aprobado");
  }
  
  public HomeMaterias homeMaterias() {
    ApplicationContext _instance = ApplicationContext.getInstance();
    Object _singleton = _instance.<Object>getSingleton(Materia.class);
    return ((HomeMaterias) _singleton);
  }
}
