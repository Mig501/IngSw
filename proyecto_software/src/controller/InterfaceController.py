# InterfaceController.py

from model.vo.LoginUserVO import LoginUserVO
from interface.windows.main_gui.main_window import MainWindow
from model.loggerSingleton import LoggerSingleton
from interface.windows.login.login_window import LoginWindow

class InterfaceController:
    def __init__(self, modelo, app):
        """Constructor de InterfaceController"""
        self.modelo = modelo
        self.app = app
        self.logger = LoggerSingleton()
        self.login_window = LoginWindow()
        self.login_window.login_screen.login_clicked.connect(self.iniciar_login)

    def load_css(self):
        with open('src/interface/style.css', 'r') as f:
            self.app.setStyleSheet(f.read())

    def mostrar_login_window(self):
        """Muestra la ventana de login"""
        self.load_css()
        self.login_window.show()

    def iniciar_login(self):
        """Lógica para el inicio de sesión"""
        username, password = self.login_window.login_screen.get_credentials()

        # Validación de credenciales
        if not username or not password:
            self.login_window.mostrar_mensaje("Por favor, completa todos los campos.")
            return

        login_vo = LoginUserVO(username, password)
        user = self.modelo.comprobarlogin(login_vo)

        if user is None:
            self.login_window.mostrar_mensaje("Nombre de usuario o contraseña incorrectos.")
            self.logger.add_log_activity(f"Intento de inicio de sesión fallido para el usuario {username}.")
        else:
            self.login_window.mostrar_mensaje("¡¡Inicio de sesión exitoso!!")
            self.logger.add_log_activity(f"Usuario {user.username} ha iniciado sesión.")
            self.mostrar_main_window(user)

    def mostrar_main_window(self, user):
        """Muestra la ventana principal con el rol del usuario"""
        rol = self.modelo.get_user_rol(user.user_id) if user.user_id != 1 else "arch"
        self.main_window = MainWindow(user_rol=rol, client_id=user.user_id, user_vo=user)
        self.main_window.show()
        self.login_window.close()
