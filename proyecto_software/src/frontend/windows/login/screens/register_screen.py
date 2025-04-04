# src/frontend/windows/login/screens/register_screen.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QMessageBox
from PyQt6.QtCore import Qt, pyqtSignal

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

        # Campo: Nombre de usuario (obligatorio)
        self.input_user = QLineEdit()
        self.input_user.setPlaceholderText("Usuario")
        layout.addWidget(self.input_user)

        # Campo: Contraseña (obligatorio)
        self.input_pass = QLineEdit()
        self.input_pass.setPlaceholderText("Contraseña")
        self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
        layout.addWidget(self.input_pass)

        # Campo: Correo electrónico (obligatorio)
        self.input_email = QLineEdit()
        self.input_email.setPlaceholderText("Correo electrónico")
        layout.addWidget(self.input_email)

        # Campo: Código postal (opcional)
        self.zip_code = QLineEdit()
        self.zip_code.setPlaceholderText("Código Postal")
        layout.addWidget(self.zip_code)

        # Campo: País (opcional)
        self.country = QLineEdit()
        self.country.setPlaceholderText('País')
        layout.addWidget(self.country)

        # Campo: Dirección (opcional)
        self.street = QLineEdit()
        self.street.setPlaceholderText('Dirección')
        layout.addWidget(self.street)

        # Campo: Número (opcional)
        self.house_number = QLineEdit()
        self.house_number.setPlaceholderText('Número')
        layout.addWidget(self.house_number)

        # Campo: Piso (opcional)
        self.floor = QLineEdit()
        self.floor.setPlaceholderText('Piso')
        layout.addWidget(self.floor)

        # Campo: Teléfono móvil (obligatorio)
        self.phone_number = QLineEdit()
        self.phone_number.setPlaceholderText('Teléfono Móvil')
        layout.addWidget(self.phone_number)

        # Botón de registro
        self.button_register = QPushButton("Registrarse")

        self.button_register.clicked.connect(self.validate)

        layout.addWidget(self.button_register)

        # Aplicar layout a la ventana
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

        # Si todo está bien, vuelve al login
        self.back_to_login.emit()
