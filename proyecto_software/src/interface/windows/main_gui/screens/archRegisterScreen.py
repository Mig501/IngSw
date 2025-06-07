# src/interface/windows/main_gui/screens/arch_register_screen.py
from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit, QPushButton, QMessageBox
)
from PyQt6.QtCore import Qt, pyqtSignal

class ArchRegisterScreen(QWidget):
    registrar_admin_signal = pyqtSignal(dict)

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registro de administradores")

        layout = QVBoxLayout()
        self.setLayout(layout)

        title = QLabel("Registrar nuevo administrador")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        form = QFormLayout()
        self.input_username = QLineEdit()
        self.input_password = QLineEdit()
        self.input_password.setEchoMode(QLineEdit.EchoMode.Password)
        self.input_email = QLineEdit()
        self.input_phone = QLineEdit()

        form.addRow("Usuario:", self.input_username)
        form.addRow("Contraseña:", self.input_password)
        form.addRow("Email:", self.input_email)
        form.addRow("Teléfono:", self.input_phone)

        layout.addLayout(form)

        self.extra_passport = QLineEdit()
        self.extra_ss = QLineEdit()
        self.extra_dwell = QLineEdit()
        self.extra_age = QLineEdit()
        self.extra_first_name = QLineEdit()
        self.extra_second_name = QLineEdit()

        extra_form = QFormLayout()
        extra_form.addRow("Pasaporte:", self.extra_passport)
        extra_form.addRow("SS Number:", self.extra_ss)
        extra_form.addRow("Dwell Time:", self.extra_dwell)
        extra_form.addRow("Edad:", self.extra_age)
        extra_form.addRow("Nombre:", self.extra_first_name)
        extra_form.addRow("Apellido:", self.extra_second_name)
        layout.addLayout(extra_form)

        self.boton_registrar = QPushButton("Registrar administrador")
        self.boton_registrar.clicked.connect(self.emitir_datos_registro)
        layout.addWidget(self.boton_registrar)

    def emitir_datos_registro(self):
        datos = {
            "username": self.input_username.text(),
            "password": self.input_password.text(),
            "email": self.input_email.text(),
            "phone": self.input_phone.text(),
            "passport": self.extra_passport.text(),
            "ss_number": self.extra_ss.text(),
            "dwell_time": self.extra_dwell.text(),
            "age": self.extra_age.text(),
            "first_name": self.extra_first_name.text(),
            "second_name": self.extra_second_name.text()
        }
        self.registrar_admin_signal.emit(datos)

    def mostrar_mensaje(self, titulo, mensaje, es_error=False):
        if es_error:
            QMessageBox.critical(self, titulo, mensaje)
        else:
            QMessageBox.information(self, titulo, mensaje)

    def limpiar_campos(self):
        for campo in [
            self.input_username, self.input_password, self.input_email, self.input_phone,
            self.extra_passport, self.extra_ss, self.extra_dwell, self.extra_age,
            self.extra_first_name, self.extra_second_name
        ]:
            campo.clear()
