# src/frontend/windows/login/screens/register_screen.py
from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton, QMessageBox
from PyQt6.QtCore import Qt, pyqtSignal
from model.vo.RegisterUserVO import RegisterUserVO
from model.BusinessObject import BusinessObject
from model.dao.UserDao import UserDao
from model.vo.ArchVO import ArchVO
from model.loggerSingleton import LoggerSingleton
from src.utils.email.jwt_utils_email import generar_token_verificacion
from src.utils.email.send_verify_email import send_verification_email


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
        self.logger = LoggerSingleton()

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
            # Verificar si es el primer usuario
            user_dao = UserDao()
            cursor = user_dao.getCursor()
            cursor.execute("SELECT COUNT(*) FROM users")
            count = cursor.fetchone()[0]
            cursor.close()
            user_dao.closeConnection()

            # Definir el rol
            rol = "arch" if count == 0 else "cliente"

            # Preparar los datos para el token
            user_data = {
                "username": user,
                "password": password,
                "email": email,
                "phone": phone,
                "rol": rol
            }

            # Generar token JWT
            token = generar_token_verificacion(user_data)

            # Enviar correo
            send_verification_email(email, user, token)

            QMessageBox.information(
                self,
                "Verificación enviada",
                f"Hemos enviado un correo a {email}. Haz clic en el enlace para verificar tu cuenta."
            )

            # Limpiar los campos después del registro
            self.input_user.clear()
            self.input_pass.clear()
            self.input_email.clear()
            self.phone_number.clear()

        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error durante el registro:\n{str(e)}")
