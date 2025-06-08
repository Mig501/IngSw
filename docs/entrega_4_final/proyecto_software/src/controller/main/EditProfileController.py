# src/controller/main/EditProfileController.py

from utils.email.send_verify_email import send_edit_confirmation_email
from utils.email.jwt_utils_email import generar_token_verificacion
from model.loggerSingleton import LoggerSingleton
from model.BusinessObject import BusinessObject

class EditProfileController:
    def __init__(self, vista, user_vo):
        self.vista = vista
        self.user_vo = user_vo
        self.bo = BusinessObject().user
        self.logger = LoggerSingleton()

        self.vista.save_changes_signal.connect(self.save_changes)
        if self.user_vo.rol == "cliente":
            client_id = self.bo.get_client_id(user_vo.user_id)
            saldo = self.bo.get_saldo_cliente(client_id)
            self.vista.set_saldo(saldo)

    def save_changes(self, datos):
        """
        Actualiza los datos del perfil del usuario. Si el correo cambia, se envía verificación;
        de lo contrario, se actualiza directamente (y el saldo si es cliente).

        Args:
            datos (dict): Diccionario con posibles cambios (username, email, phone, saldo).
        """
        username = datos["username"] or self.user_vo.username
        email = datos["email"] or self.user_vo.email
        phone = datos["phone"] or self.user_vo.phone

        if email != self.user_vo.email:
            try:
                token = generar_token_verificacion({
                    "user_id": self.user_vo.user_id,
                    "username": username,
                    "email": email,
                    "phone": phone
                })
                send_edit_confirmation_email(email, username, token)
                self.vista.show_message("Verificación enviada", f"Revisa tu correo ({email}) y confirma los cambios.")
            
            except Exception as e:
                self.vista.show_message("Error", f"No se pudo enviar el correo:\n{str(e)}", is_error=True)
        
        else:
            success, msg = self.bo.update_user_profile(self.user_vo.user_id, username, email, phone)
        
            if success:
                self.vista.show_message("Éxito", "Datos actualizados correctamente.")
                self.user_vo.username = username
                self.user_vo.email = email
                self.user_vo.phone = phone

                if self.user_vo.rol == "cliente":
                    try:
                        nuevo_saldo = float(datos["saldo"])
        
                        if nuevo_saldo < 0:
                            raise ValueError("El saldo no puede ser negativo.")
        
                        client_id = self.bo.get_client_id(self.user_vo.user_id)
                        self.bo.update_client_stats(client_id, nuevo_saldo)
        
                    except Exception as e:
                        self.vista.show_message("Error", f"Error al actualizar el saldo:\n{str(e)}", is_error=True)
            
            else:
                self.vista.show_message("Error", f"Error al actualizar: {msg}", is_error=True)
