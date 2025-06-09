# src/interface/windows/main_gui/screens/service_screen.py

from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit, QPushButton,
    QListWidget, QListWidgetItem, QLabel, QFormLayout, QSpinBox, QMessageBox
)
from PyQt6.QtCore import Qt, pyqtSignal
from PyQt6.QtGui import QFont
from functools import partial

class ServiceScreen(QWidget):
    buscar_servicios_signal = pyqtSignal()
    contratar_servicio_signal = pyqtSignal(int)
    eliminar_filtros_signal = pyqtSignal()

    def __init__(self, user_vo):
        super().__init__()
        self.user_vo = user_vo
        self.setup_ui()

    def setup_ui(self):
        self.layout = QVBoxLayout(self)

        # Layout de búsqueda y filtros
        search_layout = QHBoxLayout()
        self.search_bar = QLineEdit()
        self.search_bar.setPlaceholderText("Buscar por nombre del servicio")

        self.search_button = QPushButton("Buscar")
        self.reset_button = QPushButton("Eliminar filtros")

        self.filter_combo = QComboBox()
        self.filter_combo.addItems(["Filtrar", "Precio"])

        # Conectar botones a señales
        self.search_button.clicked.connect(lambda: self.buscar_servicios_signal.emit())
        self.reset_button.clicked.connect(lambda: self.eliminar_filtros_signal.emit())

        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)
        search_layout.addWidget(self.filter_combo)
        search_layout.addWidget(self.reset_button)
        self.layout.addLayout(search_layout)

        # Zona dinámica para filtros
        self.filter_fields_layout = QFormLayout()
        self.filter_fields_widget = QWidget()
        self.filter_fields_widget.setLayout(self.filter_fields_layout)
        self.layout.addWidget(self.filter_fields_widget)

        # Widgets de filtro (por ahora solo precio)
        self.min_price = QSpinBox()
        self.min_price.setRange(0, 1_000_000)

        self.max_price = QSpinBox()
        self.max_price.setRange(0, 1_000_000)

        # Lista de servicios
        self.service_list = QListWidget()
        self.service_list.setSpacing(8)
        self.layout.addWidget(self.service_list)

    def mostrar_filtros(self, widgets):
        """Recibe una lista de tuplas (etiqueta, widget) y los muestra en el layout de filtros."""
        for i in reversed(range(self.filter_fields_layout.count())):
            self.filter_fields_layout.itemAt(i).widget().setParent(None)

        for label, widget in widgets:
            self.filter_fields_layout.addRow(label, widget)

    def limpiar_filtros(self):
        self.filter_combo.setCurrentIndex(0)
        self.mostrar_filtros([])

    def resetear_vista(self):
        self.search_bar.clear()
        self.min_price.setValue(0)
        self.max_price.setValue(0)
        self.limpiar_filtros()
        self.service_list.clear()

    def mostrar_resultado_vacio(self):
        item = QListWidgetItem("No hay servicios disponibles con los filtros actuales.")
        item.setFlags(Qt.ItemFlag.NoItemFlags)
        self.service_list.addItem(item)

    def mostrar_servicios(self, lista_servicios, get_owner_id_fn, client_id):
        self.service_list.clear()

        for service in lista_servicios:
            widget = QWidget()
            layout = QVBoxLayout(widget)

            # Nombre
            title = QLabel(service["ser_name"])
            title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
            title.setAlignment(Qt.AlignmentFlag.AlignCenter)

            # Descripción y precio
            desc = QLabel(f"Descripción: {service['ser_description']} | Precio: {service['price']}€")
            desc.setAlignment(Qt.AlignmentFlag.AlignCenter)

            layout.addWidget(title)
            layout.addWidget(desc)

            if get_owner_id_fn(service["ServiceID"]) != client_id:
                contratar_btn = QPushButton("Contratar")
                contratar_btn.clicked.connect(lambda _, sid=service["ServiceID"]: self.confirmar_contratacion(sid))
                layout.addWidget(contratar_btn)

            layout.setContentsMargins(8, 8, 8, 8)
            layout.setSpacing(4)

            item = QListWidgetItem()
            item.setSizeHint(widget.sizeHint())
            self.service_list.addItem(item)
            self.service_list.setItemWidget(item, widget)

    def confirmar_contratacion(self, service_id):
        confirm = QMessageBox.question(
            self,
            "Confirmar contratación",
            "¿Estás seguro de que quieres contratar este servicio?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )
        if confirm == QMessageBox.StandardButton.Yes:
            self.contratar_servicio_signal.emit(service_id)

    def mostrar_mensaje(self, titulo, mensaje, error=False):
        if error:
            QMessageBox.critical(self, titulo, mensaje)
        else:
            QMessageBox.information(self, titulo, mensaje)
