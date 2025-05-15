# src/interface/windows/main_gui/screens/profile_screen.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QPushButton
from PyQt6.QtCore import pyqtSignal

class ProfileScreen(QWidget):
    logout_requested = pyqtSignal()

    def __init__(self):
        super().__init__()

        layout = QVBoxLayout()

        # Boton cerrar sesión
        self.btn_logout = QPushButton("Cerrar sesión")
        self.btn_logout.clicked.connect(self.logout_requested.emit)

        layout.addWidget(self.btn_logout)
        self.setLayout(layout)
