# src/controller/ControladorPrincipal.py

from PyQt6.QtWidgets import QApplication

class ControladorPrincipal:
    """
    Coordinador general que inicia la aplicación, carga los estilos
    y lanza la ventana principal de login.
    """

    def __init__(self, modelo, app: QApplication):
        self.modelo = modelo
        self.app = app
        self.login_window = None

    def iniciar(self):
        """
        Inicia la aplicación cargando los estilos y mostrando la primera ventana.
        """
        self.cargar_css()
        self.abrir_login_window()

    def cargar_css(self):
        """
        Carga el archivo de estilos CSS para aplicar a toda la app.
        """
        try:
            with open("src/interface/style.css", "r") as f:
                self.app.setStyleSheet(f.read())
        except Exception as e:
            print(f"Error al cargar el CSS: {e}")

    def abrir_login_window(self):
        """
        Muestra la ventana de login. Se importa aquí para evitar circularidad.
        """
        from interface.windows.login.login_window import LoginWindow
        self.login_window = LoginWindow(self.modelo)
        self.login_window.show()
