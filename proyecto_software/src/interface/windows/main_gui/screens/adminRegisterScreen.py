# src/interface/windows/main_gui/screens/adminRegisterEmployeeScreen.py

from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit,
    QPushButton, QComboBox, QMessageBox
)
from PyQt6.QtCore import Qt, pyqtSignal


class AdminRegisterEmployeeScreen(QWidget):
    registrar_empleado_signal = pyqtSignal(dict)  # Señal para enviar datos al controlador

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registro de empleados")

        self.layout = QVBoxLayout()
        self.setLayout(self.layout)

        title = QLabel("Registrar nuevo empleado")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.layout.addWidget(title)

        # Formulario común
        form = QFormLayout()
        self.input_username = QLineEdit()
        self.input_password = QLineEdit()
        self.input_email = QLineEdit()
        self.input_phone = QLineEdit()
        self.input_password.setEchoMode(QLineEdit.EchoMode.Password)

        form.addRow("Usuario:", self.input_username)
        form.addRow("Contraseña:", self.input_password)
        form.addRow("Email:", self.input_email)
        form.addRow("Teléfono:", self.input_phone)
        self.layout.addLayout(form)

        # Campos específicos
        self.campos_especificos = QFormLayout()
        self.extra_passport = QLineEdit()
        self.extra_ss = QLineEdit()
        self.extra_dwell = QLineEdit()
        self.extra_age = QLineEdit()
        self.extra_specialization = QComboBox()
        self.extra_specialization.addItems(["mecánico", "electricista", "informático"])
        self.extra_first_name = QLineEdit()
        self.extra_second_name = QLineEdit()

        self.campos_especificos.addRow("Pasaporte:", self.extra_passport)
        self.campos_especificos.addRow("SS Number:", self.extra_ss)
        self.campos_especificos.addRow("Dwell Time:", self.extra_dwell)
        self.campos_especificos.addRow("Edad:", self.extra_age)
        self.campos_especificos.addRow("Especialización:", self.extra_specialization)
        self.campos_especificos.addRow("Nombre:", self.extra_first_name)
        self.campos_especificos.addRow("Apellido:", self.extra_second_name)
        self.layout.addLayout(self.campos_especificos)

        # Botón registrar
        self.boton_registrar = QPushButton("Registrar empleado")
        self.boton_registrar.clicked.connect(self.emitir_datos_registro)
        self.layout.addWidget(self.boton_registrar)

    def emitir_datos_registro(self):
        datos = {
            "username": self.input_username.text(),
            "password": self.input_password.text(),
            "email": self.input_email.text(),
            "phone": self.input_phone.text(),
            "passport": self.extra_passport.text(),
            "ss": self.extra_ss.text(),
            "dwell": self.extra_dwell.text(),
            "age": self.extra_age.text(),
            "specialization": self.extra_specialization.currentText(),
            "first_name": self.extra_first_name.text(),
            "second_name": self.extra_second_name.text()
        }
        self.registrar_empleado_signal.emit(datos)

    def limpiar_campos(self):
        self.input_username.clear()
        self.input_password.clear()
        self.input_email.clear()
        self.input_phone.clear()
        self.extra_passport.clear()
        self.extra_ss.clear()
        self.extra_dwell.clear()
        self.extra_age.clear()
        self.extra_specialization.setCurrentIndex(0)
        self.extra_first_name.clear()
        self.extra_second_name.clear()

    def mostrar_mensaje(self, titulo: str, mensaje: str, error: bool = False):
        if error:
            QMessageBox.critical(self, titulo, mensaje)
        else:
            QMessageBox.information(self, titulo, mensaje)