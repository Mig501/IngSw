# src/interface/windows/main_gui/screens/logViewerScreen.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QTextEdit, QPushButton, QHBoxLayout, QDateEdit, QMessageBox
from PyQt6.QtCore import Qt, QDate
from model.loggerSingleton import LoggerSingleton
import os

class LogViewerScreen(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registro de Actividad del Sistema")
        self.setGeometry(200, 200, 700, 400)

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
        self.load_button.clicked.connect(self.load_logs_by_range)
        date_layout.addWidget(self.load_button)

        layout.addLayout(date_layout)

        # Campo de texto para mostrar los logs
        self.text_area = QTextEdit()
        self.text_area.setReadOnly(True)
        layout.addWidget(self.text_area)

        self.setLayout(layout)
        self.load_logs()


        # Cargar logs del día actual por defecto
        self.load_logs_for_date(QDate.currentDate(), QDate.currentDate())

    def load_logs_by_range(self):
        start = self.start_date.date()
        end = self.end_date.date()

        if start > end:
            QMessageBox.warning(self, "Error", "La fecha de inicio no puede ser posterior a la fecha de fin.")
            return
        
        self.load_logs_for_date(start, end)

    def load_logs_for_date(self, start_date, end_date):
        logs_combined = []
        current_date = start_date

        while current_date <= end_date:
            file = os.path.join("logs", f"logs_{current_date.toString('yyyy-MM-dd')}.txt")
            if os.path.exists(file):
                with open(file, "r", encoding="utf-8") as f:
                    logs_combined.extend(f.read().splitlines())

            current_date = current_date.addDays(1)

        if not logs_combined:
            self.text_area.setText("No se encontraron logs para el rango de fechas seleccionado.")

        else:
            self.text_area.setText("\n".join(logs_combined))

    def load_logs(self):
        logs = LoggerSingleton().get_log()
        self.text_area.setText("\n".join(logs))