#src/controller/login/LoginController.py
from model.vo.LoginUserVO import LoginUserVO
from model.loggerSingleton import LoggerSingleton

class LoginController:
    """
    Controlador que gestiona la lógica de inicio de sesión.
    Escucha los eventos de la vista de login y actúa en consecuencia.
    """

    def __init__(self, login_window, modelo, coordinador):
        self.vista = login_window
        self.modelo = modelo
        self.coordinador = coordinador
        self.logger = LoggerSingleton()

        # Asignar controlador a las pantallas
        self.vista.login_screen.controller = self
        self.vista.register_screen.controller = self

        # Conexión de señales
        self.vista.login_screen.login_clicked.connect(self.validar_login)
        self.vista.login_screen.register_clicked.connect(self.vista.show_register_screen)
        self.vista.register_screen.back_to_login.connect(self.vista.show_login_screen)

    def validar_login(self):
        """
        Obtiene las credenciales desde la vista, valida con el modelo
        y notifica al coordinador si el login es exitoso.
        """
        username, password = self.vista.login_screen.get_credentials()

        if not username or not password:
            self.vista.mostrar_mensaje("Campos vacíos", "Por favor, completa todos los campos.", is_error=True)
            return

        login_vo = LoginUserVO(username, password)
        user_vo = self.modelo.user.comprobarlogin(login_vo)

        if not user_vo:
            self.vista.mostrar_mensaje("Error", "Usuario o contraseña incorrectos.", is_error=True)
            return

        self.logger.add_log_activity(f"Usuario {username} ha iniciado sesión correctamente.")

        self.vista.clear_fields()
        self.coordinador.abrir_main_window(user_vo)

    def enviar_registro(self, username, password, email, phone):
        """
        Envía los datos de registro al modelo y maneja la lógica de registro.
        :param username: Nombre de usuario
        :param password: Contraseña del usuario
        :param email: Correo electrónico del usuario
        :param phone: Teléfono del usuario
        :return: True si el registro fue exitoso, False en caso contrario
        """
        try:
            # Verificar si es el primer usuario registrado
            count = self.modelo.user.count_users()
            rol = "arch" if count == 0 else "cliente"

            user_data = {
                "username": username,
                "password": password,
                "email": email,
                "phone": phone,
                "rol": rol
            }

            # Generar token y enviar correo
            from utils.email.jwt_utils_email import generar_token_verificacion
            from utils.email.send_verify_email import send_verification_email

            token = generar_token_verificacion(user_data)
            send_verification_email(email, username, token)

            self.vista.register_screen.mostrar_info(f"Hemos enviado un correo a {email}. Confirma tu cuenta.")
            self.logger.add_log_activity(f"Usuario registrado: {username} con rol {rol}.")
            return True

        except Exception as e:
            self.vista.register_screen.mostrar_error(f"Error durante el registro:\n{str(e)}")
            return False
