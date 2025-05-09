from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit, QPushButton, QLabel, QFormLayout
from PyQt6.QtCore import Qt

class VehicleScreen(QWidget):
    def __init__(self):
        super().__init__()

        # Layout principal
        layout = QVBoxLayout()

        # Barra de búsqueda
        search_layout = QHBoxLayout()  # Layout horizontal para búsqueda, filtros y botones
        self.search_bar = QLineEdit(self)
        self.search_bar.setPlaceholderText("Buscar...")

        # Botón de Buscar
        self.search_button = QPushButton("Buscar", self)

        # Filtro de precio (rango) - Desplegable
        self.filter = QComboBox(self)
        self.filter.addItem("Filtrar")
        self.filter.addItem("Rango de precio")  # price
        self.filter.addItem('Kilómetros') # kilometers
        self.filter.addItem('Combustible') # engine
        self.filter.addItem('Consumo') # consume
        self.filter.addItem('Autonomía') # autonomy
        self.filter.addItem('Etiqueta Medioambiental') # enviromental label

        # Crear el formulario para el filtro
        self.filter_layout = QVBoxLayout()

        # Campos para precio mínimo y máximo
        self.min_price_input = QLineEdit(self)
        self.min_price_input.setPlaceholderText("Desde")
        self.max_price_input = QLineEdit(self)
        self.max_price_input.setPlaceholderText("Hasta")

        # Kilometraje (min y max)
        self.min_km_input = QLineEdit(self)
        self.min_km_input.setPlaceholderText('Desde')
        self.max_km_input = QLineEdit(self)
        self.max_km_input.setPlaceholderText('Hasta')

        # Agregar los campos de los filtros al layout
        self.filter_layout.addWidget(self.min_price_input)
        self.filter_layout.addWidget(self.max_price_input)
        self.filter_layout.addWidget(self.min_km_input)
        self.filter_layout.addWidget(self.max_km_input)

        # Crear un widget para el formulario de filtros
        self.filter_widget = QWidget(self)
        self.filter_widget.setLayout(self.filter_layout)
        
        # El formulario de filtros estará oculto inicialmente
        self.filter_widget.setVisible(False)

        # Crear el widget para kilometraje
        self.km_widget = QWidget(self)
        km_layout = QVBoxLayout(self.km_widget)

        # Campos para kilometraje (min y max)
        self.min_km_input = QLineEdit(self)
        self.min_km_input.setPlaceholderText("Desde")
        self.max_km_input = QLineEdit(self)
        self.max_km_input.setPlaceholderText("Hasta")
        km_layout.addWidget(self.min_km_input)
        km_layout.addWidget(self.max_km_input)

        # Botón de eliminar filtros
        self.reset_button = QPushButton("Eliminar filtros", self)

        # Agregar widgets al layout de búsqueda
        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)  # Botón de Buscar
        search_layout.addWidget(self.filter)
        search_layout.addWidget(self.reset_button)

        # Añadir el layout de búsqueda al layout principal
        layout.addLayout(search_layout)

        # Añadir el formulario de filtros (que estará oculto al principio)
        layout.addWidget(self.filter_widget)
        layout.addWidget(self.km_widget)

        # Conectar el evento de selección en el QComboBox a las funciones de mostrar/ocultar formularios
        self.filter.currentIndexChanged.connect(self.show_price_form)
        self.filter.currentIndexChanged.connect(self.show_km_form)

        # Establecer el layout de la ventana
        self.setLayout(layout)

    def show_price_form(self):
        # Mostrar el formulario de precio solo cuando el usuario seleccione "Rango de precio"
        if self.filter.currentIndex() == 1:
            self.filter_widget.setVisible(True)  # Mostrar el formulario de precios
        else:
            self.filter_widget.setVisible(False)  # Ocultar el formulario de precios

    def show_km_form(self):
        ''' Mostrar los filtros para kilometraje máximo y mínimo cuando se seleccione "Kilómetros" '''
        if self.filter.currentIndex() == 2:
            # Mostrar el formulario de kilometraje
            self.km_widget.setVisible(True)  # Mostrar el widget de kilometraje
        else:
            # Ocultar los campos de kilometraje cuando no se selecciona "Kilómetros"
            self.km_widget.setVisible(False)  # Ocultar el widget de kilometraje
