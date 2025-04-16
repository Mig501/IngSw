# src/controller/CoordinadorPrincipal.py

from model.vo.LoginUserVO import LoginUserVO
from interface.windows.login.login_window import LoginWindow
from interface.windows.main_gui.main_window import MainWindow

class CoordinadorPrincipal:
    def __init__(self, ventanalogin, modelo) -> None:
        """
        Constructor del coordinador principal.
        Este se encarga de coordinar lo que ocurre cuando
        el usuario interactúa con la interfaz.
        """
        self.ventana = ventanalogin
        self.modelo = modelo
    
    def iniciarlogin(self) -> None:
        """
        Método para iniciar sesión desde la ventana de login.
        Recupera el usuario y contraseña del formulario y los
        valida con el modelo. Si son correctos, abre MainWindow.
        """
        # Obtener datos desde la vista
        username, password = self.ventana.login_screen.get_credentials()

        # Validación simple de campos vacíos
        if not username or not password:
            self.ventana.mostrar_mensaje("Por favor, completa todos los campos.")
            return

        # Crear VO y comprobar con el modelo
        login_vo = LoginUserVO(username, password)
        user = self.modelo.comprobarlogin(login_vo)

        # Usuario incorrecto
        if user is None:
            self.ventana.mostrar_mensaje("Nombre de usuario o contraseña incorrectos.")
        else:
            # Usuario correcto
            self.ventana.mostrar_mensaje("¡¡Inicio de sesión exitoso!!")

            # Comprobar si el usuario es admin
            is_admin = username.strip().lower() == "arch"  # Cambiar por: user.rol == 'admin'

            # Abrir ventana principal con o sin privilegios
            self.main_window = MainWindow(is_admin=is_admin)
            self.main_window.show()
            self.ventana.close()
