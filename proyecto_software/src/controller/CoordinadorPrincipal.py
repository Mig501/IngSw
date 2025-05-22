# CoordinadorPrincipal.py
from controller.InterfaceController import InterfaceController

class CoordinadorPrincipal:
    def __init__(self, modelo, app):
        """Constructor del Coordinador Principal"""
        self.modelo = modelo
        self.app = app
        # Crear el controlador de la interfaz
        self.interface_controller = InterfaceController(self.modelo, self.app)

    def iniciar(self):
        """Inicia la aplicación, mostrando la ventana de login"""
        self.interface_controller.mostrar_login_window()
