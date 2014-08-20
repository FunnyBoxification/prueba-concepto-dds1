package ar.edu.pruebaconcepto.ui;

import ar.edu.pruebaconcepto.domain.Materia;
import ar.edu.pruebaconcepto.domain.Nota;
import ar.edu.pruebaconcepto.home.HomeMaterias;
import ar.edu.pruebaconcepto.ui.EditarNotaWindow;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.ApplicationContext;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class NuevaNotaWindow extends EditarNotaWindow {
  public NuevaNotaWindow(final WindowOwner owner) {
    super(owner, new Nota());
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    this.setTitle("Nueva Nota");
    super.createMainTemplate(mainPanel);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Nueva Nota");
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
  
  protected void addActions(final Panel actions) {
    Button _button = new Button(actions);
    Button _setCaption = _button.setCaption("Aceptar");
    final Action _function = new Action() {
      public void execute() {
        NuevaNotaWindow.this.accept();
      }
    };
    Button _onClick = _setCaption.onClick(_function);
    Button _setAsDefault = _onClick.setAsDefault();
    _setAsDefault.disableOnError();
    Button _button_1 = new Button(actions);
    Button _setCaption_1 = _button_1.setCaption("Cancelar");
    final Action _function_1 = new Action() {
      public void execute() {
        NuevaNotaWindow.this.cancel();
      }
    };
    _setCaption_1.onClick(_function_1);
  }
  
  public HomeMaterias homeMaterias() {
    ApplicationContext _instance = ApplicationContext.getInstance();
    Object _singleton = _instance.<Object>getSingleton(Materia.class);
    return ((HomeMaterias) _singleton);
  }
}
