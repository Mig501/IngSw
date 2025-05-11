from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit,
    QPushButton, QComboBox, QMessageBox
)
from PyQt6.QtCore import Qt
from model.BusinessObject import BusinessObject
from model.vo.RegisterUserVO import RegisterUserVO
from model.vo.EmployeeVO import EmployeeVO
from model.loggerSingleton import LoggerSingleton

class AdminRegisterEmployeeScreen(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registro de empleados")

        self.layout = QVBoxLayout()
        self.setLayout(self.layout)
        self.logger = LoggerSingleton()

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

        # Campos específicos del empleado
        self.campos_especificos = QFormLayout()

        self.extra_passport = QLineEdit()
        self.extra_ss = QLineEdit()
        self.extra_dwell = QLineEdit()
        self.extra_age = QLineEdit()
        self.extra_specialization = QComboBox()
        self.extra_specialization.addItems(["mecánico", "electricista", "informático"])
        self.extra_first_name = QLineEdit()
        self.extra_second_name = QLineEdit()
        self.admin_id = QLineEdit()

        self.campos_especificos.addRow("Pasaporte:", self.extra_passport)
        self.campos_especificos.addRow("SS Number:", self.extra_ss)
        self.campos_especificos.addRow("Dwell Time:", self.extra_dwell)
        self.campos_especificos.addRow("Edad:", self.extra_age)
        self.campos_especificos.addRow("Especialización:", self.extra_specialization)
        self.campos_especificos.addRow("Nombre:", self.extra_first_name)
        self.campos_especificos.addRow("Apellido:", self.extra_second_name)
        self.campos_especificos.addRow("ID Admin:", self.admin_id)

        self.layout.addLayout(self.campos_especificos)

        # Botón registrar
        self.boton_registrar = QPushButton("Registrar empleado")
        self.boton_registrar.clicked.connect(self.registrar_empleado)
        self.layout.addWidget(self.boton_registrar)

    def registrar_empleado(self):
        username = self.input_username.text()
        password = self.input_password.text()
        email = self.input_email.text()
        phone = self.input_phone.text()

        try:
            user_vo = RegisterUserVO(None, username, password, email, phone, rol="empleado")

            vo = EmployeeVO(
                self.extra_passport.text(),
                self.extra_ss.text(),
                int(self.extra_dwell.text()),
                int(self.extra_age.text()),
                self.extra_specialization.currentText(),
                self.extra_first_name.text(),
                self.extra_second_name.text()
            )

            BusinessObject().registrar_empleado(user_vo, vo, int(self.admin_id.text()))

            self.logger.add_log_activity(f"Empleado registrado: {username} correctamente por administrador.")

            QMessageBox.information(self, "Éxito", "Empleado registrado correctamente.")
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
            self.admin_id.clear()

        except Exception as e:
            QMessageBox.critical(self, "Error", str(e))
