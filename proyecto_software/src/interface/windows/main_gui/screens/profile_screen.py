from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel

class ProfileScreen(QWidget):
    def __init__(self):
        super().__init__()
        
        layout = QVBoxLayout()
        label = QLabel("Pantalla de Cuenta")
        layout.addWidget(label)
        self.setLayout(layout)
