# src/frontend/login/login_window.py

from PyQt6.QtWidgets import QMainWindow, QStackedWidget
from frontend.windows.login.screens.login_screen import LoginScreen
from frontend.windows.login.screens.register_screen import RegisterScreen
from frontend.windows.main_gui.main_window import MainWindow

class LoginWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA Login")
        self.setFixedSize(500, 600)

        # Crear stack de vistas
        self.stack = QStackedWidget()
        self.setCentralWidget(self.stack)

        # Crear pantallas
        self.login_screen = LoginScreen()
        self.register_screen = RegisterScreen()

        # Añadir al stack
        self.stack.addWidget(self.login_screen)
        self.stack.addWidget(self.register_screen)
        self.stack.setCurrentWidget(self.login_screen)

        # Conexiones
        self.login_screen.login_success.connect(self.open_main_window)
        self.login_screen.register_clicked.connect(self.show_register_screen)
        self.register_screen.back_to_login.connect(self.show_login_screen)

    def show_register_screen(self):
        self.stack.setCurrentWidget(self.register_screen)

    def show_login_screen(self):
        self.stack.setCurrentWidget(self.login_screen)

    def open_main_window(self):
        self.main_window = MainWindow()
        self.main_window.show()
        self.close()
