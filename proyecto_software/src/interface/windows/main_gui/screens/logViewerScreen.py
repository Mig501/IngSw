# src/interface/windows/main_gui/screens/logViewerScreen.py
from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QLabel, QTextEdit,
    QPushButton, QHBoxLayout, QDateEdit, QMessageBox
)
from PyQt6.QtCore import Qt, QDate


class LogViewerScreen(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registro de Actividad del Sistema")
        self.setGeometry(200, 200, 700, 400)
        self.controller = None

        layout = QVBoxLayout()

        title = QLabel("Logs del sistema (solo ARCH)")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        # Selector de fecha
        date_layout = QHBoxLayout()
        self.start_date = QDateEdit(QDate.currentDate())
        self.start_date.setCalendarPopup(True)
        self.end_date = QDateEdit(QDate.currentDate())
        self.end_date.setCalendarPopup(True)

        date_layout.addWidget(QLabel("Desde:"))
        date_layout.addWidget(self.start_date)
        date_layout.addWidget(QLabel("Hasta:"))
        date_layout.addWidget(self.end_date)

        self.load_button = QPushButton("Cargar Logs")
        date_layout.addWidget(self.load_button)

        layout.addLayout(date_layout)

        # Campo de texto para mostrar los logs
        self.text_area = QTextEdit()
        self.text_area.setReadOnly(True)
        layout.addWidget(self.text_area)

        self.setLayout(layout)

    def set_controller(self, controller):
        """Asigna el controlador que gestionará los eventos"""
        self.controller = controller
        self.load_button.clicked.connect(self.controller.on_load_logs)
        self.controller.load_logs_actuales()

    def mostrar_logs(self, logs: list[str]):
        """Muestra los logs en el área de texto"""
        if not logs:
            self.text_area.setText("No se encontraron logs para el rango de fechas seleccionado.")
        
        else:
            self.text_area.setText("\n".join(logs))

    def mostrar_error(self, mensaje: str):
        QMessageBox.warning(self, "Error", mensaje)
