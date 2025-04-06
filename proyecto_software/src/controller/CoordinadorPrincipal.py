from src.model.vo.LoginVO import LoginVO
class CoordinadorPrincipal:
    def __init__(self,ventanalogin,modelo):
        self.ventana = ventanalogin
        self.modelo = modelo

    
    def iniciarlogin(self, username, password):
        #comprobaciones
        # Aquí puedes implementar la lógica para iniciar sesión
        # Por ejemplo, verificar el nombre de usuario y la contraseña
        if self.modelo.validar_usuario(username):
            self.ventana.mostrar_mensaje("Inicio de sesión exitoso")
        else:
            self.ventana.mostrar_mensaje("Nombre de usuario o contraseña incorrectos")

        loginVO = LoginVO(username, password)
        resultado = self.modelo.comprobar_login(loginVO)
        #ventana.hide()
        #ventana.close()
        

        

        