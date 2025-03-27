# src/frontend/screens/login.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLineEdit, QPushButton, QHBoxLayout, QLabel
from PyQt6.QtCore import QSize, Qt

class LoginScreen(QWidget):
    def __init__(self):
        super().__init__()

        layout = QVBoxLayout()

        # Título del login
        self.title_label = QLabel("Inicio de sesión")
        self.title_label.setAlignment(Qt.AlignmentFlag.AlignCenter)  # Centrado
        layout.addWidget(self.title_label)

        # Campo de usuario
        self.input_user = QLineEdit()
        self.input_user.setPlaceholderText("Usuario")

        # Campo de contraseña con botón de mostrar/ocultar
        password_layout = QHBoxLayout()
        self.input_pass = QLineEdit()
        self.input_pass.setPlaceholderText("Contraseña")
        self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)

        self.toggle_button = QPushButton("👁️")
        self.toggle_button.setCheckable(True)
        self.toggle_button.setFixedSize(QSize(30, 30))
        self.toggle_button.clicked.connect(self.toggle_password_visibility)

        password_layout.addWidget(self.input_pass)
        password_layout.addWidget(self.toggle_button)

        # Botón de login
        self.button_login = QPushButton("Iniciar sesión")

        # Añadir widgets al layout
        layout.addWidget(self.input_user)
        layout.addLayout(password_layout)
        layout.addWidget(self.button_login)

        self.setLayout(layout)

    def toggle_password_visibility(self):
        '''Controla la visibilidad de la contraseña'''
        if self.toggle_button.isChecked():
            self.input_pass.setEchoMode(QLineEdit.EchoMode.Normal)
        else:
            self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)