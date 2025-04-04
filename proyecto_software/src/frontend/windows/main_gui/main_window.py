# src/frontend/windows/main_gui/main_window.py

from PyQt6.QtWidgets import QMainWindow, QLabel
from PyQt6.QtCore import Qt

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA App")
        self.setFixedSize(900, 600)

        label = QLabel("Bienvenido al panel principal")
        label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.setCentralWidget(label)
