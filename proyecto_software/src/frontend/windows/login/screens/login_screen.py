# src/frontend/windows/login/screens/login.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QLineEdit, QPushButton, QLabel, QSizePolicy
from PyQt6.QtCore import QSize, Qt, pyqtSignal
from PyQt6.QtGui import QPixmap

class LoginScreen(QWidget):
    login_success = pyqtSignal()          # Señal emitida al iniciar sesión
    register_clicked = pyqtSignal()       # Señal emitida al pulsar "Registrarse"

    def __init__(self):
        super().__init__()

        # Layout principal centrado
        main_layout = QVBoxLayout()
        main_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        # Contenedor del contenido
        content = QWidget()
        layout = QVBoxLayout()
        layout.setSpacing(12)

        # Título + logo
        header_layout = QVBoxLayout()
        header_layout.setSpacing(10)

        self.title_label = QLabel("BSA Systems")
        self.title_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        header_layout.addWidget(self.title_label)

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

        # Contraseña + botón 👁️
        password_container = QWidget()
        password_layout = QHBoxLayout()
        password_layout.setContentsMargins(0, 0, 0, 0)
        password_layout.setSpacing(0)

        self.input_pass = QLineEdit()
        self.input_pass.setPlaceholderText("Contraseña")
        self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
        self.input_pass.setFixedWidth(250)

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
        self.button_login.setObjectName('LoginButton')
        self.button_login.setFixedSize(250, 40)
        self.button_login.clicked.connect(self.check_login)
        layout.addWidget(self.button_login, alignment=Qt.AlignmentFlag.AlignCenter)

        # Botón de registro
        self.button_register = QPushButton("Registrarse")
        self.button_register.setObjectName('RegisterButton')
        self.button_register.setFixedSize(250, 40)
        self.button_register.clicked.connect(self.register_clicked.emit)
        layout.addWidget(self.button_register, alignment=Qt.AlignmentFlag.AlignCenter)

        # Finalizar layouts
        content.setLayout(layout)
        main_layout.addWidget(content)
        self.setLayout(main_layout)

    def toggle_password_visibility(self):
        '''Muestra u oculta el texto de la contraseña'''
        if self.toggle_button.isChecked():
            self.input_pass.setEchoMode(QLineEdit.EchoMode.Normal)
        else:
            self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)

    def check_login(self):
        '''Emite la señal de login exitoso (sin validación por ahora)'''
        self.login_success.emit()