package ar.edu.pruebaconcepto.ui;

import ar.edu.pruebaconcepto.domain.Nota;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class EditarNotaWindow extends Dialog<Nota> {
  public EditarNotaWindow(final WindowOwner owner, final Nota nota) {
    super(owner, nota);
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
  
  protected void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    Button _setCaption = _button.setCaption("Aceptar");
    final Action _function = new Action() {
      public void execute() {
        EditarNotaWindow.this.accept();
      }
    };
    Button _onClick = _setCaption.onClick(_function);
    Button _setAsDefault = _onClick.setAsDefault();
    _setAsDefault.disableOnError();
  }
}
