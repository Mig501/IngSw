# src/frontend/main_window.py

from PyQt6.QtWidgets import QMainWindow, QStackedWidget
from frontend.screens.login import LoginScreen

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA App")
        self.setFixedSize(500, 600)

        # Contenedor de pantallas
        self.stack = QStackedWidget()
        self.setCentralWidget(self.stack)

        # Crear e insertar pantallas
        self.login_screen = LoginScreen()
        self.stack.addWidget(self.login_screen)  # index 0

        # Mostrar login como pantalla inicial
        self.stack.setCurrentWidget(self.login_screen)