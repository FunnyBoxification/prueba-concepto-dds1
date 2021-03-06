package ar.edu.pruebaconcepto.domain;

import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class Nota {
  private String _fecha;
  
  public String getFecha() {
    return this._fecha;
  }
  
  public void setFecha(final String fecha) {
    this._fecha = fecha;
  }
  
  private String _descripcion;
  
  public String getDescripcion() {
    return this._descripcion;
  }
  
  public void setDescripcion(final String descripcion) {
    this._descripcion = descripcion;
  }
  
  private Boolean _aprobado;
  
  public Boolean getAprobado() {
    return this._aprobado;
  }
  
  public void setAprobado(final Boolean aprobado) {
    this._aprobado = aprobado;
  }
}
