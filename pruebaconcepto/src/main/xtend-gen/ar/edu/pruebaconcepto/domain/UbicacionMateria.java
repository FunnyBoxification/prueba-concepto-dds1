package ar.edu.pruebaconcepto.domain;

@SuppressWarnings("all")
public class UbicacionMateria {
  private String _cuandoSeDa;
  
  public String getCuandoSeDa() {
    return this._cuandoSeDa;
  }
  
  public void setCuandoSeDa(final String cuandoSeDa) {
    this._cuandoSeDa = cuandoSeDa;
  }
  
  private Integer _anioMateria;
  
  public Integer getAnioMateria() {
    return this._anioMateria;
  }
  
  public void setAnioMateria(final Integer anioMateria) {
    this._anioMateria = anioMateria;
  }
}
