# src/controller/main/LogViewerController.py

from model.loggerSingleton import LoggerSingleton
import os
from PyQt6.QtCore import QDate

class LogViewerController:
    def __init__(self, vista):
        self.vista = vista
        self.logger = LoggerSingleton()
        self.vista.load_button.clicked.connect(self.on_load_logs)
        self.load_logs_actuales()

    def on_load_logs(self):
        start = self.vista.start_date.date()
        end = self.vista.end_date.date()
        if start > end:
            self.vista.mostrar_error("La fecha de inicio no puede ser posterior a la fecha de fin.")
            return
        self.cargar_logs_por_rango(start, end)

    def cargar_logs_por_rango(self, start_date: QDate, end_date: QDate):
        logs_combined = []
        current_date = start_date

        while current_date <= end_date:
            file = os.path.join("logs", f"logs_{current_date.toString('yyyy-MM-dd')}.txt")
            if os.path.exists(file):
                with open(file, "r", encoding="utf-8") as f:
                    logs_combined.extend(f.read().splitlines())
            current_date = current_date.addDays(1)

        self.vista.mostrar_logs(logs_combined)

    def load_logs_actuales(self):
        logs = self.logger.get_log()
        self.vista.mostrar_logs(logs)
