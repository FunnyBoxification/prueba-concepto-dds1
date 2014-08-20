package ar.edu.pruebaconcepto.ui;

import ar.edu.pruebaconcepto.domain.Materia;
import ar.edu.pruebaconcepto.home.HomeMaterias;
import com.uqbar.commons.StringUtils;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.widgets.TextFilter;
import org.uqbar.arena.widgets.TextInputEvent;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.ApplicationContext;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class NuevaMateriaWindow extends Dialog<Materia> {
  public NuevaMateriaWindow(final WindowOwner owner) {
    super(owner, new Materia());
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    this.setTitle("Nueva Materia");
    super.createMainTemplate(mainPanel);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    final Panel panel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    panel.setLayout(_columnLayout);
    Label _label = new Label(panel);
    _label.setText("Nombre:");
    TextBox _textBox = new TextBox(panel);
    final TextFilter _function = new TextFilter() {
      public boolean accept(final TextInputEvent event) {
        String _potentialTextResult = event.getPotentialTextResult();
        return StringUtils.isAlphanumericSpace(_potentialTextResult);
      }
    };
    TextBox _withFilter = _textBox.withFilter(_function);
    _withFilter.<ControlBuilder>bindValueToProperty("nombre");
  }
  
  public void executeTask() {
    HomeMaterias _homeMaterias = this.homeMaterias();
    Materia _modelObject = this.getModelObject();
    String _nombre = _modelObject.getNombre();
    _homeMaterias.create(_nombre, Integer.valueOf(1), Boolean.valueOf(false), "Tu vieja", null, null);
    super.executeTask();
  }
  
  protected void addActions(final Panel actions) {
    Button _button = new Button(actions);
    Button _setCaption = _button.setCaption("Aceptar");
    final Action _function = new Action() {
      public void execute() {
        NuevaMateriaWindow.this.accept();
      }
    };
    Button _onClick = _setCaption.onClick(_function);
    Button _setAsDefault = _onClick.setAsDefault();
    _setAsDefault.disableOnError();
    Button _button_1 = new Button(actions);
    Button _setCaption_1 = _button_1.setCaption("Cancelar");
    final Action _function_1 = new Action() {
      public void execute() {
        NuevaMateriaWindow.this.cancel();
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
