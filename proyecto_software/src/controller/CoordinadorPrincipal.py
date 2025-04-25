from model.vo.LoginUserVO import LoginUserVO
from interface.windows.login.login_window import LoginWindow
from interface.windows.main_gui.main_window import MainWindow
from model.loggerSingleton import LoggerSingleton

class CoordinadorPrincipal:
    def __init__(self,ventanalogin,modelo) -> None:
        """Constructor de la clase CoordinadorPrincipal.
        Este se encarga coordinar lo que ocurre cuando el
        usuario interactúa con la interfaz"""
        self.ventana = ventanalogin
        self.modelo = modelo
        self.logger = LoggerSingleton()
    
    def iniciarlogin(self) -> None:
        """Método para iniciar la ventana de inicio de sesión."""
        username, password = self.ventana.login_screen.get_credentials()

        # En caso de no ser correcta, muestra un mensaje para que el usuario complete
        if not username or not password:
            self.ventana.mostrar_mensaje("Por favor, completa todos los campos.")
            return

        # Instanciamos el objeto VO con los datos requeridos en el formulario y comprobamos el login llamando
        # al business object con el método comprobarlogin
        login_vo = LoginUserVO(username, password)
        user = self.modelo.comprobarlogin(login_vo) #Devuelv el usuario si existe en la base de datos o NOne en caso contrario

        if user is None:
            self.ventana.mostrar_mensaje("Nombre de usuario o contraseña incorrectos.")
            self.logger.add_log_activity(f"Intento de inicio de sesión fallido para el usuario {username}.")

        else:
            self.ventana.mostrar_mensaje("¡¡Inicio de sesión exitoso!!")
            self.logger.add_log_activity(f"Usuario {user.username} ha iniciado sesión.")

            # Asigno el rol según ID
            if user.user_id == 1:
                rol = "arch"

            else:
                rol = self.modelo.get_user_rol(user.user_id) # Obtengo el rol según el ID del usuario para la ventana principal

            self.main_window = MainWindow(user_rol=rol)  # aquí se pasa el rol para mostrar unas opciones u otras
            self.main_window.show()
            self.ventana.close()