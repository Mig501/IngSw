# src/frontend/windows/login/screens/register_screen.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton
from PyQt6.QtCore import Qt, pyqtSignal

class RegisterScreen(QWidget):
    back_to_login = pyqtSignal()

    def __init__(self):
        super().__init__()

        # layout
        layout = QVBoxLayout()

        # Título
        self.title = QLabel("Registro de usuario")
        self.title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(self.title)

        # Username
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

        self.button_register = QPushButton("Registrarse")
        self.button_register.clicked.connect(self.back_to_login.emit)  
        layout.addWidget(self.button_register)

        self.setLayout(layout)
