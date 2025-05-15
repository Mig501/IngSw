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
from model.loggerSingleton import LoggerSingleton

#class ArchRegisterScreen(QWidget):
#    def __init__(self):
#        super().__init__()
#        self.setWindowTitle("Registro de administradores")
#
#        self.layout = QVBoxLayout()
#        self.setLayout(self.layout)
#        self.logger = LoggerSingleton()
#
#        title = QLabel("Registrar nuevo usuario")
#        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
#        self.layout.addWidget(title)
#
#        # Formulario común
#        form = QFormLayout()
#        self.input_username = QLineEdit()
#        self.input_password = QLineEdit()
#        self.input_email = QLineEdit()
#        self.input_phone = QLineEdit()
#        self.input_password.setEchoMode(QLineEdit.EchoMode.Password)
#        self.admin_id = QLineEdit()
#
#        form.addRow("Usuario:", self.input_username)
#        form.addRow("Contraseña:", self.input_password)
#        form.addRow("Email:", self.input_email)
#        form.addRow("Teléfono:", self.input_phone)
#        form.addRow("ID Admin: ", self.admin_id)
#
#        self.layout.addLayout(form)
#
#        # Rol selector
#        self.rol_selector = QComboBox()
#        self.rol_selector.addItems(["empleado", "admin"])
#        self.rol_selector.currentTextChanged.connect(self.mostrar_campos_especificos)
#        self.layout.addWidget(self.rol_selector)
#
#        # Contenedor de campos específicos
#        self.campos_especificos = QFormLayout()
#        self.layout.addLayout(self.campos_especificos)
#
#        self.mostrar_campos_especificos(self.rol_selector.currentText())
#
#        # Botón registrar
#        self.boton_registrar = QPushButton("Registrar usuario")
#        self.boton_registrar.clicked.connect(self.registrar_usuario)
#        self.layout.addWidget(self.boton_registrar)
#
#    #----------------------Muestra los camppos específicos según el rol----------------------
#    def mostrar_campos_especificos(self, rol):
#        while self.campos_especificos.count():
#            self.campos_especificos.removeRow(0)
#
#        self.extra_passport = QLineEdit()
#        self.extra_ss = QLineEdit()
#        self.extra_dwell = QLineEdit()
#        self.extra_age = QLineEdit()
#
#        if rol == "empleado":
#            self.extra_specialization = QComboBox()
#            self.extra_specialization.addItems(["mecánico", "electricista", "informático"])
#            self.extra_first_name = QLineEdit()
#            self.extra_second_name = QLineEdit()
#
#            self.campos_especificos.addRow("Pasaporte:", self.extra_passport)
#            self.campos_especificos.addRow("SS Number:", self.extra_ss)
#            self.campos_especificos.addRow("Dwell Time:", self.extra_dwell)
#            self.campos_especificos.addRow("Edad:", self.extra_age)
#            self.campos_especificos.addRow("Especialización:", self.extra_specialization)
#        
#        else:
#            self.extra_first_name = QLineEdit()
#            self.extra_second_name = QLineEdit()
#
#            self.campos_especificos.addRow("Pasaporte:", self.extra_passport)
#            self.campos_especificos.addRow("SS Number:", self.extra_ss)
#            self.campos_especificos.addRow("Dwell Time:", self.extra_dwell)
#            self.campos_especificos.addRow("Edad:", self.extra_age)
#    
#        self.campos_especificos.addRow("Nombre:", self.extra_first_name)
#        self.campos_especificos.addRow("Apellido:", self.extra_second_name)
#
#    #----------------------Registrar usuario----------------------
#    def registrar_usuario(self):
#        # Recoger datos del formulario comunes
#        username = self.input_username.text()
#        password = self.input_password.text()
#        email = self.input_email.text()
#        phone = self.input_phone.text()
#        rol = self.rol_selector.currentText()
#
#        try:
#            # Instanciamos el objeto User con los datos comunes
#            user_vo = RegisterUserVO(None, username, password, email, phone, rol)
#
#            # Registramos los datos específicos según el rol
#            if rol == "empleado":
#                vo = EmployeeVO(
#                    self.extra_passport.text(),
#                    self.extra_ss.text(),
#                    int(self.extra_dwell.text()),
#                    int(self.extra_age.text()),
#                    self.extra_specialization.currentText(),
#                    self.extra_first_name.text(),
#                    self.extra_second_name.text(),
#                )
#                # Instanciamos al business object para que registre el empleado con todos los campos
#                BusinessObject().registrar_empleado(user_vo, vo, int(self.admin_id.text()))
#
#            else:
#                vo = AdminVO(
#                    self.extra_passport.text(),
#                    self.extra_ss.text(),
#                    int(self.extra_dwell.text()),
#                    int(self.extra_age.text()),
#                    self.extra_first_name.text(),
#                    self.extra_second_name.text(),
#                )
#                BusinessObject().registrar_admin(user_vo, vo)
#
#            self.logger.add_log_activity(f"{user_vo} registrado como {rol.capitalize()} correctamente por arch.")
#            
#            # Limpiamos los campos después de registrar
#            QMessageBox.information(self, "Éxito", f"{rol.capitalize()} registrado correctamente.")
#            self.input_username.clear()
#            self.input_password.clear()
#            self.input_email.clear()
#            self.input_phone.clear()
#            self.extra_passport.clear()
#            self.extra_ss.clear()
#            self.extra_dwell.clear()
#            self.extra_age.clear()
#            self.admin_id.clear()
#
#            if rol == 'empleado':
#                self.extra_specialization.clear()
#            
#            self.extra_first_name.clear()
#            self.extra_second_name.clear()
#
#        except Exception as e:
#            QMessageBox.critical(self, "Error", str(e))
#

class ArchRegisterScreen(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registro de administradores")

        self.layout = QVBoxLayout()
        self.setLayout(self.layout)
        self.logger = LoggerSingleton()

        title = QLabel("Registrar nuevo administrador")
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

        # Campos específicos del administrador
        self.campos_especificos = QFormLayout()

        self.extra_passport = QLineEdit()
        self.extra_ss = QLineEdit()
        self.extra_dwell = QLineEdit()
        self.extra_age = QLineEdit()
        self.extra_first_name = QLineEdit()
        self.extra_second_name = QLineEdit()

        self.campos_especificos.addRow("Pasaporte:", self.extra_passport)
        self.campos_especificos.addRow("SS Number:", self.extra_ss)
        self.campos_especificos.addRow("Dwell Time:", self.extra_dwell)
        self.campos_especificos.addRow("Edad:", self.extra_age)
        self.campos_especificos.addRow("Nombre:", self.extra_first_name)
        self.campos_especificos.addRow("Apellido:", self.extra_second_name)

        self.layout.addLayout(self.campos_especificos)

        # Botón registrar
        self.boton_registrar = QPushButton("Registrar administrador")
        self.boton_registrar.clicked.connect(self.registrar_empleado)
        self.layout.addWidget(self.boton_registrar)

    def registrar_empleado(self):
        username = self.input_username.text()
        password = self.input_password.text()
        email = self.input_email.text()
        phone = self.input_phone.text()

        try:
            user_vo = RegisterUserVO(None, username, password, email, phone, rol="empleado")

            vo = AdminVO(
                self.extra_passport.text(),
                self.extra_ss.text(),
                int(self.extra_dwell.text()),
                int(self.extra_age.text()),
                self.extra_first_name.text(),
                self.extra_second_name.text()
            )

            BusinessObject().registrar_admin(user_vo, vo)

            self.logger.add_log_activity(f"Administrador registrado: {username} correctamente.")

            QMessageBox.information(self, "Éxito", "Administrador registrado correctamente.")
            self.input_username.clear()
            self.input_password.clear()
            self.input_email.clear()
            self.input_phone.clear()
            self.extra_passport.clear()
            self.extra_ss.clear()
            self.extra_dwell.clear()
            self.extra_age.clear()
            self.extra_first_name.clear()
            self.extra_second_name.clear()

        except Exception as e:
            QMessageBox.critical(self, "Error", str(e))
