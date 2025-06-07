# src/controller/RegisterController.py

from model.loggerSingleton import LoggerSingleton
from utils.email.jwt_utils_email import generar_token_verificacion
from utils.email.send_verify_email import send_verification_email
from model.BusinessObject import BusinessObject
from model.vo.RegisterUserVO import RegisterUserVO

class RegisterController:
    def __init__(self, modelo: BusinessObject, vista):
        """
        Controlador que gestiona el registro de nuevos usuarios.

        :param modelo: Objeto BusinessObject con acceso a la lógica de negocio.
        :param vista: Vista asociada (RegisterScreen) que llama al controlador.
        """
        self.modelo = modelo
        self.vista = vista
        self.logger = LoggerSingleton()

    def enviar_registro(self, username: str, password: str, email: str, phone: str) -> bool:
        """
        Envía la solicitud de registro y lanza correo de verificación.

        :return: True si se envió correctamente, False si hubo error.
        """
        if not username or not password or not email or not phone:
            self.vista.mostrar_error("Por favor, completa los campos obligatorios.")
            return False

        try:
            if self.modelo.user.username_exists(username):
                self.vista.mostrar_error("El nombre de usuario ya está en uso.")
                return False

            count = self.modelo.user.user_dao.count_users()
            rol = "arch" if count == 0 else "cliente"

            user_data = {
                "username": username,
                "password": password,
                "email": email,
                "phone": phone,
                "rol": rol
            }

            token = generar_token_verificacion(user_data)
            send_verification_email(email, username, token)

            self.logger.add_log_activity(f"Registro iniciado para: '{username}' con rol '{rol}'")
            self.vista.mostrar_info(f"Hemos enviado un correo a {email} para verificar tu cuenta.")
            return True

        except Exception as e:
            self.vista.mostrar_error(f"Error durante el registro:\n{str(e)}")
            self.logger.add_log_activity(f"Error en el registro de '{username}': {e}")
            return False
