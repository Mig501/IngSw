# src/interface/windows/main_gui/screens/logViewerScreen.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QTextEdit, QPushButton
from PyQt6.QtCore import Qt
from model.loggerSingleton import LoggerSingleton

class LogViewerScreen(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registro de Actividad del Sistema")
        self.setGeometry(200, 200, 700, 400)

        layout = QVBoxLayout()

        title = QLabel("Logs del sistema (solo ARCH)")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.text_area = QTextEdit()
        self.text_area.setReadOnly(True)
        layout.addWidget(self.text_area)

        self.setLayout(layout)
        self.load_logs()

    def load_logs(self):
        logs = LoggerSingleton().get_log()
        self.text_area.setText("\n".join(logs))