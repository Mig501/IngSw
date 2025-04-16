# src/interface/windows/main_gui/screens/archRegisterScreen.py

from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit,
    QPushButton, QComboBox, QMessageBox
)
from PyQt6.QtCore import Qt
from model.BusinessObject import BusinessObject
from model.vo.RegisterUserVO import RegisterUserVO
from model.vo.EmployeeVO import EmployeeVO
from model.vo.AdminVO import AdminVO

class ArchRegisterScreen(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registro de empleados y administradores")

        self.layout = QVBoxLayout()
        self.setLayout(self.layout)

        title = QLabel("Registrar nuevo usuario")
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

        # Rol selector
        self.rol_selector = QComboBox()
        self.rol_selector.addItems(["empleado", "admin"])
        self.rol_selector.currentTextChanged.connect(self.mostrar_campos_especificos)
        self.layout.addWidget(self.rol_selector)

        # Contenedor de campos específicos
        self.campos_especificos = QFormLayout()
        self.layout.addLayout(self.campos_especificos)

        self.mostrar_campos_especificos(self.rol_selector.currentText())

        # Botón registrar
        self.boton_registrar = QPushButton("Registrar usuario")
        self.boton_registrar.clicked.connect(self.registrar_usuario)
        self.layout.addWidget(self.boton_registrar)

    def mostrar_campos_especificos(self, rol):
        while self.campos_especificos.count():
            self.campos_especificos.removeRow(0)

        self.extra_passport = QLineEdit()
        self.extra_ss = QLineEdit()
        self.extra_dwell = QLineEdit()
        self.extra_age = QLineEdit()

        if rol == "empleado":
            self.extra_specialization = QLineEdit()
            self.extra_first_name = QLineEdit()
            self.extra_second_name = QLineEdit()

            self.campos_especificos.addRow("Pasaporte:", self.extra_passport)
            self.campos_especificos.addRow("SS Number:", self.extra_ss)
            self.campos_especificos.addRow("Dwell Time:", self.extra_dwell)
            self.campos_especificos.addRow("Edad:", self.extra_age)
            self.campos_especificos.addRow("Especialización:", self.extra_specialization)
            self.campos_especificos.addRow("Nombre:", self.extra_first_name)
            self.campos_especificos.addRow("Apellido:", self.extra_second_name)
        else:
            self.extra_first_name = QLineEdit()
            self.extra_second_name = QLineEdit()

            self.campos_especificos.addRow("Pasaporte:", self.extra_passport)
            self.campos_especificos.addRow("SS Number:", self.extra_ss)
            self.campos_especificos.addRow("Dwell Time:", self.extra_dwell)
            self.campos_especificos.addRow("Edad:", self.extra_age)
            self.campos_especificos.addRow("Nombre:", self.extra_first_name)
            self.campos_especificos.addRow("Apellido:", self.extra_second_name)

    def registrar_usuario(self):
        username = self.input_username.text()
        password = self.input_password.text()
        email = self.input_email.text()
        phone = self.input_phone.text()
        rol = self.rol_selector.currentText()

        try:
            user_vo = RegisterUserVO(None, username, password, email, phone, rol)

            if rol == "empleado":
                vo = EmployeeVO(
                    self.extra_passport.text(),
                    self.extra_ss.text(),
                    int(self.extra_dwell.text()),
                    int(self.extra_age.text()),
                    self.extra_specialization.text(),
                    self.extra_first_name.text(),
                    self.extra_second_name.text(),
                )
                BusinessObject().registrar_empleado(user_vo, vo)

            else:
                vo = AdminVO(
                    self.extra_passport.text(),
                    self.extra_ss.text(),
                    int(self.extra_dwell.text()),
                    int(self.extra_age.text()),
                    self.extra_first_name.text(),
                    self.extra_second_name.text(),
                )
                BusinessObject().registrar_admin(user_vo, vo)

            QMessageBox.information(self, "Éxito", f"{rol.capitalize()} registrado correctamente.")
            self.input_username.clear()
            self.input_password.clear()
            self.input_email.clear()
            self.input_phone.clear()
            self.extra_passport.clear()
            self.extra_ss.clear()
            self.extra_dwell.clear()
            self.extra_age.clear()
            self.extra_specialization.clear()
            self.extra_first_name.clear()
            self.extra_second_name.clear()

        except Exception as e:
            QMessageBox.critical(self, "Error", str(e))
