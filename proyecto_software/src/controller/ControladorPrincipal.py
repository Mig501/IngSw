#src/controller/ControladorPrincipal.py
from controller.login.LoginController import LoginController
from controller.main.MainController import MainController
from model.conexion.Conexion import Conexion

class ControladorPrincipal:
    """
    Controlador principal que orquesta la aplicación BSA.
    Se encarga de iniciar la aplicación, cambiar entre ventanas
    y mantener la referencia al modelo y controladores secundarios.
    """

    def __init__(self, modelo):
        self.modelo = modelo
        self.conexion = Conexion()

        self.login_window = None
        self.main_window = None

        self.login_controller = None
        self.main_controller = None

    def iniciar(self):
        """Inicia la aplicación cargando estilos y mostrando la ventana de login."""
        self.mostrar_login()

    def mostrar_login(self):
        """
        Crea y muestra la ventana de login y su controlador.
        Se usa tanto al iniciar la app como tras cerrar sesión.
        """
        from interface.windows.login.login_window import LoginWindow

        self.login_window = LoginWindow(self.modelo)
        self.login_controller = LoginController(
            login_window=self.login_window,
            modelo=self.modelo,
            coordinador=self
        )

        self.login_window.show()

        # Si venimos del logout, cerramos la ventana principal si está abierta
        if self.main_window:
            self.main_window.close()
            self.main_window = None
            self.main_controller = None

    def abrir_main_window(self, user_vo):
        """
        Crea y muestra la ventana principal tras login exitoso,
        y cierra la ventana de login.
        """
        from interface.windows.main_gui.main_window import MainWindow

        self.main_window = MainWindow(
            user_rol=user_vo.rol,
            client_id=user_vo.user_id,
            user_vo=user_vo
        )

        self.main_controller = MainController(
            main_window=self.main_window,
            modelo=self.modelo,
            coordinador=self,
            user_vo=user_vo,
            conexion=self.conexion
        )

        self.main_window.show()

        if self.login_window:
            self.login_window.close()
            self.login_window = None
            self.login_controller = None