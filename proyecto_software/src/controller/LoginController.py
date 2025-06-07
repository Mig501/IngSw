# src/controller/LoginController.py

from model.loggerSingleton import LoggerSingleton
from model.vo.LoginUserVO import LoginUserVO
from model.BusinessObject import BusinessObject

class LoginController:
    def __init__(self, modelo: BusinessObject, vista):
        """
        Controlador para gestionar el inicio de sesión.

        :param modelo: Objeto BusinessObject con acceso a la lógica de negocio.
        :param vista: Vista LoginScreen que contiene la UI.
        """
        self.modelo = modelo
        self.vista = vista
        self.logger = LoggerSingleton()

    def iniciar_sesion(self):
        """
        Procesa las credenciales introducidas por el usuario y valida el inicio de sesión.
        :return: UserVO si el login es exitoso, None en caso contrario.
        """
        username, password = self.vista.get_credentials()

        if not username or not password:
            self.vista.mostrar_error("Por favor, completa todos los campos.")
            return None

        login_vo = LoginUserVO(username, password)
        user_vo = self.modelo.user.comprobarlogin(login_vo)

        if user_vo is None:
            self.vista.mostrar_error("Nombre de usuario o contraseña incorrectos.")
            self.logger.add_log_activity(f"Intento fallido de login para el usuario '{username}'")
            return None

        self.logger.add_log_activity(f"Inicio de sesión exitoso para el usuario: '{username}'")
        return user_vo
