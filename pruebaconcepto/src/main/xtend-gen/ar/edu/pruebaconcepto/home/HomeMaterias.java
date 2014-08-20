package ar.edu.pruebaconcepto.home;

import ar.edu.pruebaconcepto.domain.Materia;
import ar.edu.pruebaconcepto.domain.Nota;
import ar.edu.pruebaconcepto.domain.UbicacionMateria;
import java.util.LinkedList;
import java.util.List;
import org.apache.commons.collections15.Predicate;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.uqbar.commons.model.CollectionBasedHome;
import org.uqbar.commons.model.UserException;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class HomeMaterias extends CollectionBasedHome<Materia> {
  public HomeMaterias() {
    this.init();
  }
  
  public void init() {
    LinkedList<Nota> _linkedList = new LinkedList<Nota>();
    UbicacionMateria _ubicacionMateria = new UbicacionMateria();
    this.create("caca", Integer.valueOf(2), Boolean.valueOf(true), "Pepe", _linkedList, _ubicacionMateria);
    LinkedList<Nota> _linkedList_1 = new LinkedList<Nota>();
    UbicacionMateria _ubicacionMateria_1 = new UbicacionMateria();
    this.create("ASDASD", Integer.valueOf(6), Boolean.valueOf(true), "Pepe", _linkedList_1, _ubicacionMateria_1);
  }
  
  public void create(final String pNombre, final Integer pAnioCursada, final Boolean pFinal, final String pProfe, final List<Nota> pNotas, final UbicacionMateria ubicacion) {
    Materia materia = new Materia();
    materia.setNombre(pNombre);
    materia.setAnioCursada(pAnioCursada);
    materia.setFinalAprobado(pFinal);
    materia.setProfesor(pProfe);
    materia.setNotas(pNotas);
    materia.setUbicacionMateria(ubicacion);
    this.create(materia);
  }
  
  public void validateCreate(final Materia materia) {
    materia.validar();
    this.validarMateriasDuplicadas(materia);
  }
  
  public void validarMateriasDuplicadas(final Materia materia) {
    final String nombre = materia.getNombre();
    List<Materia> _allInstances = this.allInstances();
    final Function1<Materia,Boolean> _function = new Function1<Materia,Boolean>() {
      public Boolean apply(final Materia mat) {
        String _nombre = mat.getNombre();
        return Boolean.valueOf(_nombre.equalsIgnoreCase(nombre));
      }
    };
    Iterable<Materia> _filter = IterableExtensions.<Materia>filter(_allInstances, _function);
    List<Materia> _list = IterableExtensions.<Materia>toList(_filter);
    boolean _isEmpty = _list.isEmpty();
    boolean _not = (!_isEmpty);
    if (_not) {
      throw new UserException(("Ya existe una materia con el nombre: " + nombre));
    }
  }
  
  public List<Materia> getMaterias() {
    return this.allInstances();
  }
  
  public Materia get(final String nombre) {
    List<Materia> _materias = this.getMaterias();
    final Function1<Materia,Boolean> _function = new Function1<Materia,Boolean>() {
      public Boolean apply(final Materia modelo) {
        String _nombre = modelo.getNombre();
        return Boolean.valueOf(_nombre.equals(nombre));
      }
    };
    return IterableExtensions.<Materia>findFirst(_materias, _function);
  }
  
  protected Predicate getCriterio(final Materia example) {
    return null;
  }
  
  public Materia createExample() {
    return new Materia();
  }
  
  public Class<Materia> getEntityType() {
    return Materia.class;
  }
}
