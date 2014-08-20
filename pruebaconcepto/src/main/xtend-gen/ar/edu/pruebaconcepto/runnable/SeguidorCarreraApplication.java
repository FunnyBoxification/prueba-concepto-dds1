package ar.edu.pruebaconcepto.runnable;

import ar.edu.pruebaconcepto.domain.Materia;
import ar.edu.pruebaconcepto.home.HomeMaterias;
import ar.edu.pruebaconcepto.ui.SeguidorCarreraWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;
import org.uqbar.commons.utils.ApplicationContext;

@SuppressWarnings("all")
public class SeguidorCarreraApplication extends Application {
  public static void main(final String[] args) {
    SeguidorCarreraApplication _seguidorCarreraApplication = new SeguidorCarreraApplication();
    _seguidorCarreraApplication.start();
  }
  
  protected Window<?> createMainWindow() {
    ApplicationContext _instance = ApplicationContext.getInstance();
    HomeMaterias _homeMaterias = new HomeMaterias();
    _instance.<HomeMaterias>configureSingleton(Materia.class, _homeMaterias);
    return new SeguidorCarreraWindow(this);
  }
}
