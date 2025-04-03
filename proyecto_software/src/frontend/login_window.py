# src/frontend/login_window.py

from PyQt6.QtWidgets import QMainWindow
from frontend.screens.login import LoginScreen
from frontend.main_window import MainWindow

class LoginWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA Login")
        self.setFixedSize(500, 600)

        # Crear pantalla de login
        self.login_screen = LoginScreen()
        self.setCentralWidget(self.login_screen)

        # Conectar señal de login correcto
        self.login_screen.login_success.connect(self.handle_login_success)

    def handle_login_success(self):
        # Abrir ventana principal y cerrar login
        self.main_window = MainWindow()
        self.main_window.show()
        self.close()
