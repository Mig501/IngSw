# src/frontend/main_window.py

from PyQt6.QtWidgets import QMainWindow, QStackedWidget
from frontend.screens.login import LoginScreen

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA App - Principal")
        self.setFixedSize(900, 600)

        label = QLabel("Bienvenido al panel principal")
        label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.setCentralWidget(label)
