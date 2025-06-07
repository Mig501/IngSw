#src/interface/windows/login/screens/login_screen.py
from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QLineEdit, QPushButton, QLabel, QSizePolicy, QMessageBox
from PyQt6.QtCore import QSize, Qt, pyqtSignal
from PyQt6.QtGui import QPixmap, QIcon

class LoginScreen(QWidget):
    login_clicked = pyqtSignal()  # Señal para mostrar MainWindow tras login exitoso
    register_clicked = pyqtSignal()

    def __init__(self, controller=None):
        super().__init__()
        self.controller = controller  # Puede ser asignado después

        # Layout principal centrado
        main_layout = QVBoxLayout()
        main_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)

        content = QWidget()
        layout = QVBoxLayout()
        layout.setSpacing(12)

        # Encabezado: Logo
        header_layout = QVBoxLayout()
        header_layout.setSpacing(10)

        self.logo = QLabel()
        pixmap = QPixmap("resources/images/logo2_removed.png")
        if pixmap.isNull():
            print("No se pudo cargar la imagen del logo.")
        pixmap = pixmap.scaledToWidth(200, Qt.TransformationMode.SmoothTransformation)
        self.logo.setPixmap(pixmap)
        self.logo.setAlignment(Qt.AlignmentFlag.AlignCenter)
        header_layout.addWidget(self.logo)

        layout.addLayout(header_layout)

        # Usuario
        self.input_user = QLineEdit()
        self.input_user.setPlaceholderText("Usuario")
        self.input_user.setFixedWidth(250)
        layout.addWidget(self.input_user, alignment=Qt.AlignmentFlag.AlignCenter)

        # Contraseña
        password_container = QWidget()
        password_layout = QHBoxLayout()
        password_layout.setContentsMargins(0, 0, 0, 0)
        password_layout.setSpacing(0)

        self.input_pass = QLineEdit()
        self.input_pass.setPlaceholderText("Contraseña")
        self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
        self.input_pass.setFixedWidth(250)

        self.toggle_button = QPushButton()
        self.toggle_button.setIcon(QIcon('resources/icons/eye.svg'))
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
        self.button_login.clicked.connect(self.procesar_login)
        layout.addWidget(self.button_login, alignment=Qt.AlignmentFlag.AlignCenter)

        # Botón de registro
        self.button_register = QPushButton("Registrarse")
        self.button_register.setObjectName('RegisterButton')
        self.button_register.setFixedSize(250, 40)
        self.button_register.clicked.connect(self.register_clicked.emit)
        layout.addWidget(self.button_register, alignment=Qt.AlignmentFlag.AlignCenter)

        content.setLayout(layout)
        main_layout.addWidget(content)
        self.setLayout(main_layout)

    def toggle_password_visibility(self):
        if self.toggle_button.isChecked():
            self.input_pass.setEchoMode(QLineEdit.EchoMode.Normal)
            self.toggle_button.setIcon(QIcon('resources/icons/eye_off.svg'))
        else:
            self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
            self.toggle_button.setIcon(QIcon('resources/icons/eye.svg'))

    def get_credentials(self):
        return self.input_user.text().strip(), self.input_pass.text().strip()

    def procesar_login(self):
        if not self.input_user.text().strip() or not self.input_pass.text().strip():
            self.mostrar_error("Por favor, completa todos los campos.")
            return

        if not self.controller:
            self.mostrar_error("Error interno: controlador no asignado.")
            return

        self.login_clicked.emit()


    def mostrar_error(self, mensaje):
        self.input_user.setStyleSheet("border: 1px solid red;")
        self.input_pass.setStyleSheet("border: 1px solid red;")
        QMessageBox.critical(self, "Error", mensaje)

    def mostrar_info(self, mensaje):
        QMessageBox.information(self, "Información", mensaje)
