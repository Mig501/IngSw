from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QLabel, QPushButton, QDateEdit,
    QMessageBox, QHBoxLayout, QFileDialog
)
from PyQt6.QtCore import QDate
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure
from model.BusinessObject import BusinessObject
import matplotlib.pyplot as plt
from fpdf import FPDF
import os

class AdminReportScreen(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Informe de Ventas")
        self.setGeometry(100, 100, 800, 600)

        self.business = BusinessObject()
        self.layout = QVBoxLayout()
        self.setLayout(self.layout)

        # Selector de fechas
        date_layout = QHBoxLayout()
        self.start_date = QDateEdit(QDate.currentDate())
        self.start_date.setCalendarPopup(True)
        self.end_date = QDateEdit(QDate.currentDate())
        self.end_date.setCalendarPopup(True)
        date_layout.addWidget(QLabel("Desde:"))
        date_layout.addWidget(self.start_date)
        date_layout.addWidget(QLabel("Hasta:"))
        date_layout.addWidget(self.end_date)

        self.layout.addLayout(date_layout)

        # Botones
        btn_layout = QHBoxLayout()
        self.generate_button = QPushButton("Generar informe")
        self.generate_button.clicked.connect(self.generate_report)
        self.export_button = QPushButton("Exportar a PDF")
        self.export_button.clicked.connect(self.export_pdf)
        btn_layout.addWidget(self.generate_button)
        btn_layout.addWidget(self.export_button)
        self.layout.addLayout(btn_layout)

        # Área para resultados
        self.results_label = QLabel()
        self.results_label.setWordWrap(True)
        self.layout.addWidget(self.results_label)

        # Área de gráfica
        self.figure = Figure(figsize=(5, 3))
        self.canvas = FigureCanvas(self.figure)
        self.layout.addWidget(self.canvas)

        # Guardamos últimos datos
        self.last_summary = ""
        self.last_dates = ("", "")

    def generate_report(self):
        start = self.start_date.date().toString("yyyy-MM-dd")
        end = self.end_date.date().toString("yyyy-MM-dd")
        self.last_dates = (start, end)

        # Validar fechas
        if start > end:
            QMessageBox.warning(self, "Error", "La fecha de inicio no puede ser mayor que la fecha de fin.")
            return

        try:
            top_buyer = self.business.get_top_buyer(start, end)
            top_seller = self.business.get_top_seller(start, end)
            top_brand = self.business.get_top_brand(start, end)
            total_compras_ventas = self.business.get_totals(start, end)
            daily_sales = self.business.get_daily_sales(start, end)

            summary = f"""
Informe de Ventas del {start} al {end}:

 Total de compra-ventas: {total_compras_ventas}
 ID Mayor comprador: {top_buyer[0]} ({top_buyer[1]} compras)
 ID Mayor vendedor: {top_seller[0]} ({top_seller[1]} ventas)
 Marca más comprada: {top_brand[0]} ({top_brand[1]} veces)
"""

            self.results_label.setText(summary)
            self.last_summary = summary
            self.plot_graph(daily_sales)

        except Exception as e:
            QMessageBox.critical(self, "Error", f"No se pudo generar el informe:\n{e}")

    def plot_graph(self, data):
        self.figure.clear()
        ax = self.figure.add_subplot(111)

        fechas = [row[0] for row in data]
        cantidades = [row[1] for row in data]

        ax.plot(fechas, cantidades, marker='o')
        ax.set_title("Compra-Ventas por Día")
        ax.set_xlabel("Fecha")
        ax.set_ylabel("Cantidad")
        ax.grid(True)
        self.canvas.draw()

    def export_pdf(self):
        if not self.last_summary:
            QMessageBox.warning(self, "Aviso", "Primero debes generar el informe.")
            return

        default_name = f"informe_{self.last_dates[0]}_a_{self.last_dates[1]}.pdf"
        filepath, _ = QFileDialog.getSaveFileName(self, "Guardar PDF", default_name, "PDF Files (*.pdf)")

        if not filepath:
            return

        # Guardar gráfica como imagen temporal
        img_path = "temp_chart.png"
        self.figure.savefig(img_path)

        try:

            pdf = FPDF()
            pdf.add_page()
            pdf.set_font("Helvetica", size=12)

            for line in self.last_summary.strip().split("\n"):
                pdf.cell(200, 10, txt=line, ln=True)

            pdf.image(img_path, x=10, y=None, w=pdf.w - 20)
            pdf.output(filepath)
            QMessageBox.information(self, "Éxito", "Informe exportado correctamente.")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error al exportar el PDF:\n{e}")
        finally:
            if os.path.exists(img_path):
                os.remove(img_path)
