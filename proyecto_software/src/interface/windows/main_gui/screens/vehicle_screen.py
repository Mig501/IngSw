# src/interface/windows/main_gui/screens/vehicle_screen.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QHBoxLayout, QLineEdit
from PyQt6.QtCore import Qt

class VehicleScreen(QWidget):
    def __init__(self):
        super().__init__()

        # Layouts
        self.layout = QVBoxLayout() # layout principal
        self.upper_layout = QHBoxLayout() # layout para la zona superior de la barra de búsquedas y filtros

        # Barra de búsqueda
        self.search_bar = QLineEdit(self)
        self.search_bar.setPlaceholderText("Buscar...")
        self.search_bar.textChanged.connect(self.filter_results)

        self.setLayout(self.layout)

    def filter_results(self):
        '''La función se activará cada vez que el texto cambie para actualizar la búsqueda'''
        search_text = self.search_bar.text().lower()
