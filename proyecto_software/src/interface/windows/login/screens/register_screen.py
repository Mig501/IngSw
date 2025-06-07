# src/frontend/windows/login/screens/register_screen.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QMessageBox
from PyQt6.QtCore import Qt, pyqtSignal

class RegisterScreen(QWidget):
    back_to_login = pyqtSignal()

    def __init__(self, controller=None):
        super().__init__()
        self.controller = controller  # Se puede asignar después

        layout = QVBoxLayout()

        self.title = QLabel("Registro de usuario")
        self.title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(self.title)

        self.input_user = QLineEdit()
        self.input_user.setPlaceholderText("Usuario")
        layout.addWidget(self.input_user)

        self.input_pass = QLineEdit()
        self.input_pass.setPlaceholderText("Contraseña")
        self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
        layout.addWidget(self.input_pass)

        self.input_email = QLineEdit()
        self.input_email.setPlaceholderText("Correo electrónico")
        layout.addWidget(self.input_email)

        self.phone_number = QLineEdit()
        self.phone_number.setPlaceholderText('Teléfono Móvil')
        layout.addWidget(self.phone_number)

        self.button_register = QPushButton("Registrarse")
        self.button_register.clicked.connect(self.validate)
        layout.addWidget(self.button_register)

        self.button_back = QPushButton("Atrás")
        self.button_back.clicked.connect(self.emitir_senal_volver)
        layout.addWidget(self.button_back)

        self.setLayout(layout)

    def emitir_senal_volver(self):
        self.back_to_login.emit()

    def validate(self):
        username = self.input_user.text().strip()
        password = self.input_pass.text().strip()
        email = self.input_email.text().strip()
        phone = self.phone_number.text().strip()

        # Limpiar estilos anteriores
        for field in [self.input_user, self.input_pass, self.input_email, self.phone_number]:
            field.setStyleSheet("")

        campos_vacios = []
        if not username:
            campos_vacios.append(self.input_user)
        if not password:
            campos_vacios.append(self.input_pass)
        if not email:
            campos_vacios.append(self.input_email)
        if not phone:
            campos_vacios.append(self.phone_number)

        if campos_vacios:
            for field in campos_vacios:
                field.setStyleSheet("border: 1px solid red;")
            self.mostrar_error("Por favor, completa todos los campos obligatorios.")
            return

        if self.controller is None:
            self.mostrar_error("Error interno: controlador no asignado.")
            return

        success = self.controller.enviar_registro(username, password, email, phone)

        if success:
            self.input_user.clear()
            self.input_pass.clear()
            self.input_email.clear()
            self.phone_number.clear()

    def mostrar_info(self, mensaje):
        QMessageBox.information(self, "Información", mensaje)

    def mostrar_error(self, mensaje):
        QMessageBox.critical(self, "Error", mensaje)
