package ar.edu.pruebaconcepto.appModel;

import ar.edu.pruebaconcepto.domain.Materia;
import ar.edu.pruebaconcepto.domain.Nota;
import ar.edu.pruebaconcepto.home.HomeMaterias;
import java.io.Serializable;
import java.util.List;
import org.uqbar.commons.utils.ApplicationContext;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class SeguidorCarrera implements Serializable {
  private List<Materia> _materias;
  
  public List<Materia> getMaterias() {
    return this._materias;
  }
  
  public void setMaterias(final List<Materia> materias) {
    this._materias = materias;
  }
  
  private List<Nota> _notas;
  
  public List<Nota> getNotas() {
    return this._notas;
  }
  
  public void setNotas(final List<Nota> notas) {
    this._notas = notas;
  }
  
  private Materia _materiaSeleccionada;
  
  public Materia getMateriaSeleccionada() {
    return this._materiaSeleccionada;
  }
  
  public void setMateriaSeleccionada(final Materia materiaSeleccionada) {
    this._materiaSeleccionada = materiaSeleccionada;
  }
  
  private Nota _notaSeleccionada;
  
  public Nota getNotaSeleccionada() {
    return this._notaSeleccionada;
  }
  
  public void setNotaSeleccionada(final Nota notaSeleccionada) {
    this._notaSeleccionada = notaSeleccionada;
  }
  
  public HomeMaterias getHomeMaterias() {
    ApplicationContext _instance = ApplicationContext.getInstance();
    return _instance.<HomeMaterias>getSingleton(Materia.class);
  }
  
  public void searchMaterias() {
    HomeMaterias _homeMaterias = this.getHomeMaterias();
    List<Materia> _allInstances = _homeMaterias.allInstances();
    this._materias = _allInstances;
    this.setMateriaSeleccionada(null);
    this.setNotaSeleccionada(null);
    this.setNotas(null);
    return;
  }
}
