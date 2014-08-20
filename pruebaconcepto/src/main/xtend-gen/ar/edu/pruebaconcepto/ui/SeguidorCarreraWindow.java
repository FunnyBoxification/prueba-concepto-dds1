package ar.edu.pruebaconcepto.ui;

import ar.edu.pruebaconcepto.appModel.SeguidorCarrera;
import ar.edu.pruebaconcepto.domain.Materia;
import ar.edu.pruebaconcepto.domain.Nota;
import ar.edu.pruebaconcepto.ui.EditarNotaWindow;
import ar.edu.pruebaconcepto.ui.NuevaMateriaWindow;
import ar.edu.pruebaconcepto.ui.NuevaNotaWindow;
import com.uqbar.commons.collections.Transformer;
import java.util.List;
import org.uqbar.arena.bindings.NotNullObservable;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class SeguidorCarreraWindow extends SimpleWindow<SeguidorCarrera> {
  public SeguidorCarreraWindow(final WindowOwner parent) {
    super(parent, new SeguidorCarrera());
    SeguidorCarrera _modelObject = this.getModelObject();
    _modelObject.searchMaterias();
  }
  
  protected void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    Button _setCaption = _button.setCaption("Nueva Materia");
    final Action _function = new Action() {
      public void execute() {
        SeguidorCarreraWindow.this.nuevaMateria();
      }
    };
    Button _onClick = _setCaption.onClick(_function);
    Button _setAsDefault = _onClick.setAsDefault();
    _setAsDefault.disableOnError();
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    this.setTitle("Seguidor de Carrera");
    this.setTaskDescription("Seguidor de carrera");
    super.createMainTemplate(mainPanel);
  }
  
  public void createFormPanel(final Panel mainPanel) {
    Panel gralPanel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    gralPanel.setLayout(_columnLayout);
    Panel _panel = new Panel(gralPanel);
    this.createLeftPanel(_panel);
    Panel _panel_1 = new Panel(gralPanel);
    this.createRightPanel(_panel_1);
  }
  
  public Column<Materia> createLeftPanel(final Panel leftPanel) {
    Column<Materia> _xblockexpression = null;
    {
      Table<Materia> table = new Table<Materia>(leftPanel, Materia.class);
      table.setHeigth(300);
      table.setWidth(100);
      table.bindItemsToProperty("materias");
      table.<ControlBuilder>bindSelectionToProperty("materiaSeleccionada");
      _xblockexpression = this.describeMateriasGrid(table);
    }
    return _xblockexpression;
  }
  
  public void createRightPanel(final Panel rightPanel) {
    Panel _panel = new Panel(rightPanel);
    this.createDatosMateria(_panel);
    Label _label = new Label(rightPanel);
    _label.setText("Notas cursada");
    this.createNotasGrid(rightPanel);
    this.createGridActions(rightPanel);
  }
  
  public Control createDatosMateria(final Panel datosMatPanel) {
    Control _xblockexpression = null;
    {
      Label labelNomMateria = new Label(datosMatPanel);
      labelNomMateria.<ControlBuilder>bindValueToProperty("materiaSeleccionada.nombre");
      labelNomMateria.setFontSize(16);
      Panel datosPanel = new Panel(datosMatPanel);
      Panel horizPanel = new Panel(datosPanel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      horizPanel.setLayout(_horizontalLayout);
      Label _label = new Label(horizPanel);
      _label.setText("Año");
      TextBox textBoxAnio = new TextBox(horizPanel);
      textBoxAnio.<ControlBuilder>bindValueToProperty("materiaSeleccionada.anioCursada");
      Label _label_1 = new Label(horizPanel);
      _label_1.setText("Final aprobado");
      CheckBox checkFinal = new CheckBox(horizPanel);
      checkFinal.<ControlBuilder>bindValueToProperty("materiaSeleccionada.finalAprobado");
      Panel col2Panel = new Panel(datosPanel);
      ColumnLayout _columnLayout = new ColumnLayout(2);
      col2Panel.setLayout(_columnLayout);
      Label _label_2 = new Label(col2Panel);
      _label_2.setText("Profesor: ");
      TextBox textBoxProfe = new TextBox(col2Panel);
      textBoxProfe.<ControlBuilder>bindValueToProperty("materiaSeleccionada.profesor");
      textBoxProfe.setWidth(150);
      Label _label_3 = new Label(col2Panel);
      _label_3.setText("Ubicacion materia: ");
      TextBox textBoxUbicMat = new TextBox(col2Panel);
      _xblockexpression = textBoxUbicMat.setWidth(150);
    }
    return _xblockexpression;
  }
  
  public Column<Nota> createNotasGrid(final Panel mainPanel) {
    Column<Nota> _xblockexpression = null;
    {
      Table<Nota> table = new Table<Nota>(mainPanel, Nota.class);
      table.setHeigth(150);
      table.setWidth(250);
      table.bindItemsToProperty("materiaSeleccionada.notas");
      table.<ControlBuilder>bindValueToProperty("notaSeleccionada");
      _xblockexpression = this.describeNotasGrid(table);
    }
    return _xblockexpression;
  }
  
  public Column<Nota> describeNotasGrid(final Table<Nota> table) {
    Column<Nota> _xblockexpression = null;
    {
      Column<Nota> _column = new Column<Nota>(table);
      Column<Nota> _setTitle = _column.setTitle("Fecha");
      _setTitle.bindContentsToProperty("fecha");
      Column<Nota> _column_1 = new Column<Nota>(table);
      Column<Nota> _setTitle_1 = _column_1.setTitle("Descripcion");
      _setTitle_1.bindContentsToProperty("descripcion");
      Column<Nota> _column_2 = new Column<Nota>(table);
      Column<Nota> _setTitle_2 = _column_2.setTitle("Aprobado");
      final Transformer<Nota,String> _function = new Transformer<Nota,String>() {
        public String transform(final Nota nota) {
          String _xifexpression = null;
          Boolean _aprobado = nota.getAprobado();
          if ((_aprobado).booleanValue()) {
            _xifexpression = "Si";
          } else {
            _xifexpression = "No";
          }
          return _xifexpression;
        }
      };
      _xblockexpression = _setTitle_2.<String>bindContentsToTransformer(_function);
    }
    return _xblockexpression;
  }
  
  public Column<Materia> describeMateriasGrid(final Table<Materia> table) {
    Column<Materia> _column = new Column<Materia>(table);
    Column<Materia> _setTitle = _column.setTitle("Materias");
    return _setTitle.bindContentsToProperty("nombre");
  }
  
  public void createGridActions(final Panel mainPanel) {
    Panel actionsNotasPanel = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    actionsNotasPanel.setLayout(_horizontalLayout);
    Button _button = new Button(actionsNotasPanel);
    Button _setCaption = _button.setCaption("Editar");
    final Action _function = new Action() {
      public void execute() {
        SeguidorCarreraWindow.this.editarNota();
      }
    };
    Button editNota = _setCaption.onClick(_function);
    Button _button_1 = new Button(actionsNotasPanel);
    Button _setCaption_1 = _button_1.setCaption("+");
    final Action _function_1 = new Action() {
      public void execute() {
        SeguidorCarreraWindow.this.nuevaNota();
      }
    };
    _setCaption_1.onClick(_function_1);
    Button _button_2 = new Button(actionsNotasPanel);
    Button _setCaption_2 = _button_2.setCaption("-");
    final Action _function_2 = new Action() {
      public void execute() {
        SeguidorCarrera _modelObject = SeguidorCarreraWindow.this.getModelObject();
        List<Nota> _notas = _modelObject.getNotas();
        SeguidorCarrera _modelObject_1 = SeguidorCarreraWindow.this.getModelObject();
        Nota _notaSeleccionada = _modelObject_1.getNotaSeleccionada();
        _notas.remove(_notaSeleccionada);
      }
    };
    Button eliminarNota = _setCaption_2.onClick(_function_2);
    NotNullObservable elementoSeleccionado = new NotNullObservable("notaSeleccionada");
    editNota.<ControlBuilder>bindEnabled(elementoSeleccionado);
    eliminarNota.<ControlBuilder>bindEnabled(elementoSeleccionado);
  }
  
  public void editarNota() {
    SeguidorCarrera _modelObject = this.getModelObject();
    Nota _notaSeleccionada = _modelObject.getNotaSeleccionada();
    EditarNotaWindow _editarNotaWindow = new EditarNotaWindow(this, _notaSeleccionada);
    this.openDialog(_editarNotaWindow);
  }
  
  public void nuevaNota() {
    NuevaNotaWindow _nuevaNotaWindow = new NuevaNotaWindow(this);
    this.openDialog(_nuevaNotaWindow);
  }
  
  public void nuevaMateria() {
    NuevaMateriaWindow _nuevaMateriaWindow = new NuevaMateriaWindow(this);
    this.openDialog(_nuevaMateriaWindow);
  }
  
  public void openDialog(final Dialog<?> dialog) {
    final Action _function = new Action() {
      public void execute() {
        SeguidorCarrera _modelObject = SeguidorCarreraWindow.this.getModelObject();
        _modelObject.searchMaterias();
      }
    };
    dialog.onAccept(_function);
    dialog.open();
  }
}
