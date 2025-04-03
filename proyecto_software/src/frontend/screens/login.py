# src/frontend/screens/login.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QLineEdit, QPushButton, QLabel, QSpacerItem, QSizePolicy
from PyQt6.QtCore import QSize, Qt
from PyQt6.QtGui import QPixmap

class LoginScreen(QWidget):
    def __init__(self):
        super().__init__()

        main_layout = QVBoxLayout()
        main_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        content = QWidget()
        layout = QVBoxLayout()
        layout.setSpacing(12)

        # Layout: Título + Logo
        header_layout = QVBoxLayout()
        header_layout.setSpacing(10)

        # Titulo
        self.title_label = QLabel("BSA Systems")
        self.title_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        header_layout.addWidget(self.title_label)

        # Logo
        self.logo = QLabel()
        pixmap = QPixmap("src/frontend/images/logo/logo_sin_fondo.png")
        if pixmap.isNull():
            print("❌ No se pudo cargar la imagen del logo.")
        pixmap = pixmap.scaledToWidth(170, Qt.TransformationMode.SmoothTransformation)
        self.logo.setPixmap(pixmap)
        self.logo.setAlignment(Qt.AlignmentFlag.AlignCenter)
        header_layout.addWidget(self.logo)
        layout.addLayout(header_layout)

        # Usuario
        self.input_user = QLineEdit()
        self.input_user.setPlaceholderText("Usuario")
        self.input_user.setFixedWidth(250)
        layout.addWidget(self.input_user, alignment=Qt.AlignmentFlag.AlignCenter)

        # Layout: Contraseña + botón de mostrar/ocultar
        password_container = QWidget()
        password_layout = QHBoxLayout()
        password_layout.setContentsMargins(0, 0, 0, 0)
        password_layout.setSpacing(0)

        # Contraseña
        self.input_pass = QLineEdit()
        self.input_pass.setPlaceholderText("Contraseña")
        self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
        self.input_pass.setFixedWidth(250)

        # Botón de mostrar/ocultar contraseña
        self.toggle_button = QPushButton("👁️")
        self.toggle_button.setCheckable(True)
        self.toggle_button.setFixedSize(QSize(30, 30))
        self.toggle_button.clicked.connect(self.toggle_password_visibility)
        self.toggle_button.setSizePolicy(QSizePolicy.Policy.Fixed, QSizePolicy.Policy.Fixed)

        password_layout.addWidget(self.input_pass)
        password_layout.addSpacing(5)
        password_layout.addWidget(self.toggle_button)
        password_container.setLayout(password_layout)
        layout.addWidget(password_container, alignment=Qt.AlignmentFlag.AlignCenter)

        # Botón de login
        self.button_login = QPushButton("Iniciar sesión")
        self.button_login.setObjectName('LoginButtom')
        self.button_login.setFixedWidth(250)
        self.button_login.setFixedHeight(40)
        layout.addWidget(self.button_login, alignment=Qt.AlignmentFlag.AlignCenter)
        content.setLayout(layout)
        main_layout.addWidget(content)
        self.setLayout(main_layout)

    def toggle_password_visibility(self):
        '''Modifica la visibilidad de la contraseña cuando se pulse el botón asignado a la acción'''
        if self.toggle_button.isChecked():
            self.input_pass.setEchoMode(QLineEdit.EchoMode.Normal)
        else:
            self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
