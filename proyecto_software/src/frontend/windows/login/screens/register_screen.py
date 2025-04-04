from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton
from PyQt6.QtCore import Qt, pyqtSignal

class RegisterScreen(QWidget):
    proceed_to_main = pyqtSignal()  # ✅ esta es la señal que necesitas

    def __init__(self):
        super().__init__()

        layout = QVBoxLayout()

        title = QLabel("Registro de usuario")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

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

        self.button_register = QPushButton("Entrar a la aplicación")
        self.button_register.clicked.connect(self.proceed_to_main.emit)  # ✅ emitir señal
        layout.addWidget(self.button_register)

        self.setLayout(layout)
