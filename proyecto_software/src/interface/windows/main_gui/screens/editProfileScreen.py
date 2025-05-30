from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QMessageBox
from PyQt6.QtCore import Qt, pyqtSignal
from utils.email.send_verify_email import send_edit_confirmation_email
from utils.email.jwt_utils_email import generar_token_verificacion
from model.BusinessObject import BusinessObject
from model.loggerSingleton import LoggerSingleton
from PyQt6.QtCore import Qt

class EditProfileScreen(QWidget):

    logout_signal = pyqtSignal() # Signal to notify logout action

    def __init__(self, user_vo):
        super().__init__()
        self.user_vo = user_vo
        self.bo = BusinessObject().user
        self.logger = LoggerSingleton()

        layout = QVBoxLayout()
        self.setLayout(layout)

        # Título
        title = QLabel("Modificar Datos Personales")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        # Campos
        self.username_input = QLineEdit(self.user_vo.username)
        self.email_input = QLineEdit(self.user_vo.email)
        self.phone_input = QLineEdit(self.user_vo.phone)

        layout.addWidget(QLabel("Usuario"))
        layout.addWidget(self.username_input)
        layout.addWidget(QLabel("Correo"))
        layout.addWidget(self.email_input)
        layout.addWidget(QLabel("Teléfono"))
        layout.addWidget(self.phone_input)

        print(f"Rol del usuario: {self.user_vo.rol}")
        # Modificar saldo para el cliente
        if self.user_vo.rol == "cliente":
            try:
                client_id = self.bo.get_client_id(self.user_vo.user_id)
                saldo_actual = self.bo.get_saldo_cliente(client_id)

                self.saldo_input = QLineEdit(str(saldo_actual))
                self.saldo_input.setPlaceholderText("Saldo actual (€)")
                layout.addWidget(QLabel("Saldo (€)"))
                layout.addWidget(self.saldo_input)

            except Exception as e:
                print(f"Error al obtener el saldo: {e}")


        # Botón guardar
        save_btn = QPushButton("Guardar cambios")
        save_btn.clicked.connect(self.save_changes)
        layout.addWidget(save_btn)

        # Botón cerrar sesión
        logout_btn = QPushButton("Cerrar sesión")
        logout_btn.clicked.connect(self.emit_logout_signal)
        self.logger.add_log_activity(f"Usuario {self.user_vo.username} ha cerrado sesión.")
        layout.addWidget(logout_btn)

    def save_changes(self):
        new_username = self.username_input.text().strip()
        new_email = self.email_input.text().strip()
        new_phone = self.phone_input.text().strip()

        username = new_username if new_username else self.user_vo.username
        email = new_email if new_email else self.user_vo.email
        phone = new_phone if new_phone else self.user_vo.phone

        if email != self.user_vo.email:
            try:
                user_data = {
                    "user_id": self.user_vo.user_id,
                    "username": username,
                    "email": email,
                    "phone": phone,
                }

                token = generar_token_verificacion(user_data)

                # Enviamos correo de verificación
                send_edit_confirmation_email(email, username, token)

                QMessageBox.information(self, "Verificación enviada", f"Revisa tu correo ({email}) y confirma los cambios.")

            except Exception as e:
                QMessageBox.critical(self, "Error", f"No se pudo enviar el correo de verificación:\n{str(e)}")

        else:
            # Si no cambió el correo, actualizamos directamente
            success, msg = self.bo.update_user_profile(self.user_vo.user_id, username, email, phone)

            if success:
                QMessageBox.information(self, "Éxito", "Datos actualizados correctamente.")
                self.user_vo.username = username
                self.user_vo.email = email
                self.user_vo.phone = phone

                if self.user_vo.rol == "cliente":
                    try:
                        nuevo_saldo = float(self.saldo_input.text().strip())
                        if nuevo_saldo < 0:
                            raise ValueError("El saldo no puede ser negativo.")
                        
                        client_id = self.bo.get_client_id(self.user_vo.user_id)
                        self.bo.update_client_stats(client_id, nuevo_saldo)

                    except Exception as e:
                        QMessageBox.critical(self, "Error", f"Error al actualizar el saldo:\n{str(e)}")

            else:
                QMessageBox.critical(self, "Error", f"Error al actualizar: {msg}")

    def emit_logout_signal(self):
        self.logout_signal.emit()