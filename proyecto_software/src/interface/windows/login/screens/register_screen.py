# src/frontend/windows/login/screens/register_screen.py
from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QMessageBox
from PyQt6.QtCore import Qt, pyqtSignal
from model.vo.UserVO import UserVO
from model.BusinessObject import BusinessObject

class RegisterScreen(QWidget):
    # Señal para volver a la pantalla de login
    back_to_login = pyqtSignal()

    def __init__(self):
        super().__init__()

        # Layout principal vertical
        layout = QVBoxLayout()

        # Título
        self.title = QLabel("Registro de usuario")
        self.title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(self.title)

        # Campo: Nombre de usuario
        self.input_user = QLineEdit()
        self.input_user.setPlaceholderText("Usuario")
        layout.addWidget(self.input_user)

        # Campo: Contraseña
        self.input_pass = QLineEdit()
        self.input_pass.setPlaceholderText("Contraseña")
        self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
        layout.addWidget(self.input_pass)

        # Campo: Correo electrónico
        self.input_email = QLineEdit()
        self.input_email.setPlaceholderText("Correo electrónico")
        layout.addWidget(self.input_email)

        # Campo: Teléfono móvil
        self.phone_number = QLineEdit()
        self.phone_number.setPlaceholderText('Teléfono Móvil')
        layout.addWidget(self.phone_number)

        # Botón de registro
        self.button_register = QPushButton("Registrarse")
        self.button_register.clicked.connect(self.validate)
    
        layout.addWidget(self.button_register)
        self.setLayout(layout)

    def validate(self):
        '''
        Comprueba que los campos obligatorios estén completos.
        Si alguno falta, muestra un mensaje y no continúa.
        Si están todos, vuelve a la pantalla de login.
        '''
        user = self.input_user.text().strip()
        password = self.input_pass.text().strip()
        email = self.input_email.text().strip()
        phone = self.phone_number.text().strip()

        # Validación de campos obligatorios
        if not user or not password or not email or not phone:
            QMessageBox.warning(
                self,
                "Campos obligatorios",
                "Por favor, completa los campos obligatorios restantes."
            )
            return  # Si falta algo, no continúa

        try:
            # El id de usuario se genera automáticamente en la base de datos, así que no lo pasamos
            user_vo = UserVO(None, user, email, password, phone)
            rows = BusinessObject().insert(user_vo)
            
            if rows > 0:
                QMessageBox.information(self, "Registro exitoso", "Usuario registrado correctamente.")
                print("Usuario registrado correctamente")
                self.back_to_login.emit()

            else:
                QMessageBox.critical(self, "Error", "No se pudo registrar el usuario.")

        except Exception as e:
            if "Duplicate entry" in str(e):
                QMessageBox.critical(self, "Usuario existente", "El nombre de usuario o el correo ya están registrados.")
            else:
                QMessageBox.critical(self, "Error", f"Error al registrar el usuario:\n{str(e)}")
            return
