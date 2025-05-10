from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QComboBox,
    QLineEdit, QPushButton, QSpacerItem, QSizePolicy
)
from PyQt6.QtCore import Qt

class VehicleScreen(QWidget):
    def __init__(self):
        super().__init__()

        # Layout principal
        layout = QVBoxLayout()

        # Layout horizontal para barra de búsqueda + filtros + botones
        search_layout = QHBoxLayout()
        self.search_bar = QLineEdit(self)
        self.search_bar.setPlaceholderText("Buscar...")

        self.search_button = QPushButton("Buscar", self)

        self.filter = QComboBox(self)
        self.filter.addItem("Filtrar")
        self.filter.addItem("Rango de precio")
        self.filter.addItem("Kilómetros")
        self.filter.addItem("Combustible")
        self.filter.addItem("Consumo")
        self.filter.addItem("Autonomía")
        self.filter.addItem("Etiqueta Medioambiental")

        self.reset_button = QPushButton("Eliminar filtros", self)

        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)
        search_layout.addWidget(self.filter)
        search_layout.addWidget(self.reset_button)

        # Contenedor intermedio para poder aplicar alineación
        search_container = QWidget()
        search_container.setLayout(search_layout)

        # Añadir el contenedor con alineación arriba
        layout.addWidget(search_container, alignment=Qt.AlignmentFlag.AlignTop)

        # Establecer el layout principal
        self.setLayout(layout)
