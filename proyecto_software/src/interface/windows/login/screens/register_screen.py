# src/frontend/windows/login/screens/register_screen.py
from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QMessageBox
from PyQt6.QtCore import Qt, pyqtSignal
from model.vo.RegisterUserVO import RegisterUserVO
from model.BusinessObject import BusinessObject
from model.dao.UserDao import UserDao
from model.vo.ArchVO import ArchVO

class RegisterScreen(QWidget):
    # Señal para volver a la pantalla de login
    back_to_login = pyqtSignal()

    def __init__(self):
        super().__init__()

        # Layout principal vertical
        layout = QVBoxLayout()

        # Título
        self.title = QLabel("Registro de usuario")
        self.title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(self.title)

        # Campo: Nombre de usuario
        self.input_user = QLineEdit()
        self.input_user.setPlaceholderText("Usuario")
        layout.addWidget(self.input_user)

        # Campo: Contraseña
        self.input_pass = QLineEdit()
        self.input_pass.setPlaceholderText("Contraseña")
        self.input_pass.setEchoMode(QLineEdit.EchoMode.Password)
        layout.addWidget(self.input_pass)

        # Campo: Correo electrónico
        self.input_email = QLineEdit()
        self.input_email.setPlaceholderText("Correo electrónico")
        layout.addWidget(self.input_email)

        # Campo: Teléfono móvil
        self.phone_number = QLineEdit()
        self.phone_number.setPlaceholderText('Teléfono Móvil')
        layout.addWidget(self.phone_number)

        # Botón de registro
        self.button_register = QPushButton("Registrarse")
        self.button_register.clicked.connect(self.validate)
    
        layout.addWidget(self.button_register)
        self.setLayout(layout)

    def validate(self):
        '''
        Comprueba que los campos obligatorios estén completos.
        Si alguno falta, muestra un mensaje y no continúa.
        Si están todos, vuelve a la pantalla de login.
        '''
        # Capturamos los valores introducidos por el usuario
        user = self.input_user.text().strip()
        password = self.input_pass.text().strip()
        email = self.input_email.text().strip()
        phone = self.phone_number.text().strip()
    
        # Validación de campos obligatorios
        if not user or not password or not email or not phone:
            QMessageBox.warning(
                self,
                "Campos obligatorios",
                "Por favor, completa los campos obligatorios restantes."
            )
            return  # Si falta algo, no continúa
    
        try:
            user_vo = RegisterUserVO(None, user, password, email, phone)
    
            # Verificar si es el primer usuario
            from model.dao.UserDao import UserDao
            from model.vo.ArchVO import ArchVO
            user_dao = UserDao()
            cursor = user_dao.getCursor()
            cursor.execute("SELECT COUNT(*) FROM users")
            count = cursor.fetchone()[0]
            cursor.close()
            user_dao.closeConnection()
    
            if count == 0:
                user_vo.rol = "arch"
                arch_vo = ArchVO("ARC000001", "559678146234", 10, 40, "Arch", "System")
                success = BusinessObject().registrar_arch(user_vo, arch_vo)
            else:
                user_vo.rol = "cliente"
                success = BusinessObject().registrar_cliente(user_vo)
    
            if success:
                QMessageBox.information(self, "Registro exitoso", "Usuario registrado correctamente.")
                print("Usuario registrado correctamente")
                self.back_to_login.emit()  # Volvemos al login
            
                # Limpiar los campos después del registro
                self.input_user.clear()
                self.input_pass.clear()
                self.input_email.clear()
                self.phone_number.clear()

            else:
                QMessageBox.critical(self, "Error", "No se pudo registrar el usuario.")
    
        except Exception as e:
            if "Duplicate entry" in str(e):
                QMessageBox.critical(self, "Usuario existente", "El nombre de usuario o el correo ya están registrados.")
            else:
                QMessageBox.critical(self, "Error", f"Error al registrar el usuario:\n{str(e)}")
            return
    