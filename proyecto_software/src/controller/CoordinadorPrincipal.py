from model.vo.LoginVO import LoginVO
from interface.windows.login.login_window import LoginWindow
from interface.windows.main_gui.main_window import MainWindow

class CoordinadorPrincipal:
    def __init__(self,ventanalogin,modelo):
        self.ventana = ventanalogin
        self.modelo = modelo

    
    def iniciarlogin(self):
        username, password  = self.ventana.login_screen.get_credentials()
        
        if not username or not password:
            self.ventana.mostrar_mensaje("Por favor, completa todos los campos.")
            return
        
        login_vo = LoginVO(username, password)
        user = self.modelo.comprobarlogin(login_vo)

        if user is None:
            self.ventana.mostrar_mensaje("Nombre de usuario o contraseña incorrectos.")
        else:
            self.ventana.mostrar_mensaje("Inicio de sesión exitoso.")
            self.main_window = MainWindow()
            self.main_window.show()
            self.ventana.close()


    #    #comprobaciones
    #    # Aquí puedes implementar la lógica para iniciar sesión
    #    # Por ejemplo, verificar el nombre de usuario y la contraseña
    #    if self.modelo.validar_usuario(username):
    #        self.ventana.mostrar_mensaje("Inicio de sesión exitoso")
    #    else:
    #        self.ventana.mostrar_mensaje("Nombre de usuario o contraseña incorrectos")
#
    #    loginVO = LoginVO(username, password)
    #    resultado = self.modelo.comprobar_login(loginVO)
    #    #ventana.hide()
    #    #ventana.close()
        

        

        