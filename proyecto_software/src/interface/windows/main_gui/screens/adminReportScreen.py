from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QLabel, QPushButton, QDateEdit,
    QHBoxLayout
)
from PyQt6.QtCore import QDate, pyqtSignal
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

class AdminReportScreen(QWidget):
    generar_informe_signal = pyqtSignal(str, str)
    exportar_pdf_signal = pyqtSignal()

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Informe de Ventas")
        self.setGeometry(100, 100, 800, 600)

        self.layout = QVBoxLayout()
        self.setLayout(self.layout)

        # Fecha
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
        self.export_button = QPushButton("Exportar a PDF")
        btn_layout.addWidget(self.generate_button)
        btn_layout.addWidget(self.export_button)
        self.layout.addLayout(btn_layout)

        # Resultados
        self.results_label = QLabel()
        self.results_label.setWordWrap(True)
        self.layout.addWidget(self.results_label)

        # Gráfico
        self.figure = Figure(figsize=(5, 3))
        self.canvas = FigureCanvas(self.figure)
        self.layout.addWidget(self.canvas)

        # Señales
        self.generate_button.clicked.connect(self.emitir_generar)
        self.export_button.clicked.connect(self.exportar_pdf_signal.emit)

    def emitir_generar(self):
        start = self.start_date.date().toString("yyyy-MM-dd")
        end = self.end_date.date().toString("yyyy-MM-dd")
        self.generar_informe_signal.emit(start, end)

    def actualizar_resultados(self, texto):
        self.results_label.setText(texto)

    def graficar(self, datos):
        self.figure.clear()
        ax = self.figure.add_subplot(111)
        if not datos:
            ax.text(0.5, 0.5, "No hay datos en el rango seleccionado",
                    ha="center", va="center", fontsize=12, transform=ax.transAxes)
            ax.set_xticks([])
            ax.set_yticks([])
        else:
            fechas = [row[0] for row in datos]
            cantidades = [row[1] for row in datos]
            ax.plot(fechas, cantidades, marker='o')
            ax.set_title("Compra-Ventas por Día")
            ax.set_xlabel("Fecha")
            ax.set_ylabel("Cantidad")
            ax.grid(True)
        self.canvas.draw()

    def get_fecha_rango(self):
        return (
            self.start_date.date().toString("yyyy-MM-dd"),
            self.end_date.date().toString("yyyy-MM-dd")
        )
