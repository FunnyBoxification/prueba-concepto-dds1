package ar.edu.pruebaconcepto.domain;

import ar.edu.pruebaconcepto.domain.Nota;
import ar.edu.pruebaconcepto.domain.UbicacionMateria;
import com.google.common.base.Objects;
import java.util.List;
import org.uqbar.commons.model.Entity;
import org.uqbar.commons.model.UserException;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class Materia extends Entity {
  private String _nombre;
  
  public String getNombre() {
    return this._nombre;
  }
  
  public void setNombre(final String nombre) {
    this._nombre = nombre;
  }
  
  private Integer _anioCursada;
  
  public Integer getAnioCursada() {
    return this._anioCursada;
  }
  
  public void setAnioCursada(final Integer anioCursada) {
    this._anioCursada = anioCursada;
  }
  
  private Boolean _finalAprobado;
  
  public Boolean getFinalAprobado() {
    return this._finalAprobado;
  }
  
  public void setFinalAprobado(final Boolean finalAprobado) {
    this._finalAprobado = finalAprobado;
  }
  
  private String _profesor;
  
  public String getProfesor() {
    return this._profesor;
  }
  
  public void setProfesor(final String profesor) {
    this._profesor = profesor;
  }
  
  private List<Nota> _notas;
  
  public List<Nota> getNotas() {
    return this._notas;
  }
  
  public void setNotas(final List<Nota> notas) {
    this._notas = notas;
  }
  
  private UbicacionMateria _ubicacionMateria;
  
  public UbicacionMateria getUbicacionMateria() {
    return this._ubicacionMateria;
  }
  
  public void setUbicacionMateria(final UbicacionMateria ubicacionMateria) {
    this._ubicacionMateria = ubicacionMateria;
  }
  
  public String toString() {
    return this.getNombre();
  }
  
  public void validar() {
    String _nombre = this.getNombre();
    boolean _equals = Objects.equal(_nombre, null);
    if (_equals) {
      throw new UserException("Debe ingresar una materia");
    }
  }
}
