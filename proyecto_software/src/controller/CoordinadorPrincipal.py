from model.vo.LoginUserVO import LoginUserVO
from interface.windows.login.login_window import LoginWindow
from interface.windows.main_gui.main_window import MainWindow

class CoordinadorPrincipal:
    def __init__(self,ventanalogin,modelo) -> None:
        """Constructor de la clase CoordinadorPrincipal.
        Este se encarga coordinar lo que ocurre cuando el
        usuario interactúa con la interfaz"""
        self.ventana = ventanalogin
        self.modelo = modelo
    
    def iniciarlogin(self) -> None:
        """Método para inciar la ventana de inicio de sesión."""
        # Obtiene las credenciales del formulario de inicio de sesión introducidas por el usuario
        username, password  = self.ventana.login_screen.get_credentials()
        
        # Validar que los campos no estén vacíos
        if not username or not password:
            self.ventana.mostrar_mensaje("Por favor, completa todos los campos.")
            return
        
        # Instanciamos el objeto VO con los datos requeridos en el formulario
        login_vo = LoginUserVO(username, password)
        user = self.modelo.comprobarlogin(login_vo) # Comprobamos que existe ese usuario con esa contraseña

        if user is None:
            self.ventana.mostrar_mensaje("Nombre de usuario o contraseña incorrectos.")

        else:
            self.ventana.mostrar_mensaje("¡¡Inicio de sesión exitoso!!")
            self.main_window = MainWindow() # Redirigimos a la ventana principal
            self.main_window.show() # Mostramos la ventana principal
            self.ventana.close() # Cerramos la ventana de inicio de sesión

    #    #comprobaciones
    #    # Aquí puedes implementar la lógica para iniciar sesión
    #    # Por ejemplo, verificar el nombre de usuario y la contraseña
    #    if self.modelo.validar_usuario(username):
    #        self.ventana.mostrar_mensaje("Inicio de sesión exitoso")
    #    else:
    #        self.ventana.mostrar_mensaje("Nombre de usuario o contraseña incorrectos")
#
    #    loginVO = LoginUserVO(username, password)
    #    resultado = self.modelo.comprobar_login(loginVO)
    #    #ventana.hide()
    #    #ventana.close()
