from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QComboBox,
    QLineEdit, QPushButton
)
from PyQt6.QtCore import Qt

class VehicleScreen(QWidget):
    def __init__(self):
        super().__init__()

        # Layouts
        layout = QVBoxLayout() # layout principal
        search_layout = QHBoxLayout() # layput para la búsqueda y filtros

        # Barra de búsqueda
        self.search_bar = QLineEdit(self)
        self.search_bar.setPlaceholderText("Buscar...")

        # Botón para ejecutar la búsqueda
        self.search_button = QPushButton("Buscar", self)

        # Desplegable para filtros
        self.filter = QComboBox(self)
        self.filter.addItem("Filtrar")
        self.filter.addItem("Rango de precio")
        self.filter.addItem("Kilómetros")
        self.filter.addItem("Combustible")
        self.filter.addItem("Consumo")
        self.filter.addItem("Autonomía")
        self.filter.addItem("Etiqueta Medioambiental")

        # Botón para eliminar filtros
        self.reset_button = QPushButton("Eliminar filtros", self)

        # Añadir widgets al layout de búsqueda
        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)
        search_layout.addWidget(self.filter)
        search_layout.addWidget(self.reset_button)

        # Contenedor intermedio para poder aplicar alineación al layout de búsqueda
        self.search_container = QWidget()
        self.search_container.setLayout(search_layout)

        # Añadir el contenedor con alineación arriba
        layout.addWidget(self.search_container, alignment=Qt.AlignmentFlag.AlignTop)

        # Establecer el layout principal
        self.setLayout(layout)
