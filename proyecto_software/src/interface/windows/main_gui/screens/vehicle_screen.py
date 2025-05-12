from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit, QPushButton, QListWidget, QListWidgetItem, QLabel, QFormLayout, QSpinBox
from PyQt6.QtCore import Qt, QSize
from PyQt6.QtGui import QPixmap, QFont
from model.BusinessObject import BusinessObject
class VehicleScreen(QWidget):
    def __init__(self):
        super().__init__()

        self.business_object = BusinessObject()
        self.setLayout(self.setup_ui())

    def setup_ui(self):
        layout = QVBoxLayout()

        # Barra de búsqueda y botones
        search_layout = QHBoxLayout()
        self.search_bar = QLineEdit(self)
        self.search_bar.setPlaceholderText("Buscar por marca modelo")

        self.search_button = QPushButton("Buscar", self)
        self.search_button.clicked.connect(self.search_cars)

        self.filter_combo = QComboBox(self)
        self.filter_combo.addItem("Filtrar")
        self.filter_combo.addItem("Kilómetros")
        self.filter_combo.addItem("Consumo")
        self.filter_combo.addItem("Autonomía")
        self.filter_combo.addItem("Combustible")
        self.filter_combo.addItem("Etiqueta Medioambiental")
        self.filter_combo.currentTextChanged.connect(self.show_filter_fields)

        self.reset_button = QPushButton("Eliminar filtros", self)
        self.reset_button.clicked.connect(self.reset_filters)

        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)
        search_layout.addWidget(self.filter_combo)
        search_layout.addWidget(self.reset_button)

        layout.addLayout(search_layout)

        # Zona dinámica para filtros
        self.filter_fields_layout = QFormLayout()
        self.filter_fields_widget = QWidget()
        self.filter_fields_widget.setLayout(self.filter_fields_layout)
        layout.addWidget(self.filter_fields_widget)

        # Widgets de filtro
        self.min_km = QSpinBox()
        self.min_km.setRange(0, 1000000)
        self.max_km = QSpinBox()
        self.max_km.setRange(0, 1000000)

        self.min_consume = QSpinBox()
        self.min_consume.setRange(0, 100)
        self.max_consume = QSpinBox()
        self.max_consume.setRange(0, 100)

        self.min_autonomy = QSpinBox()
        self.min_autonomy.setRange(0, 2000)
        self.max_autonomy = QSpinBox()
        self.max_autonomy.setRange(0, 2000)

        self.fuel_type = QComboBox()
        self.fuel_type.addItems(["", "Gasolina", "Diésel", "Eléctrico", "Híbrido"])

        self.env_label = QComboBox()
        self.env_label.addItems(["", "0", "ECO", "B", "C"])

        # Lista de resultados
        self.car_list = QListWidget()
        self.car_list.setSpacing(8)
        layout.addWidget(self.car_list)

        return layout

    def show_filter_fields(self, text):
        for i in reversed(range(self.filter_fields_layout.count())):
            self.filter_fields_layout.itemAt(i).widget().setParent(None)

        if text == "Kilómetros":
            self.filter_fields_layout.addRow("Mín. km:", self.min_km)
            self.filter_fields_layout.addRow("Máx. km:", self.max_km)
        elif text == "Consumo":
            self.filter_fields_layout.addRow("Mín. consumo:", self.min_consume)
            self.filter_fields_layout.addRow("Máx. consumo:", self.max_consume)
        elif text == "Autonomía":
            self.filter_fields_layout.addRow("Mín. autonomía:", self.min_autonomy)
            self.filter_fields_layout.addRow("Máx. autonomía:", self.max_autonomy)
        elif text == "Combustible":
            self.filter_fields_layout.addRow("Tipo de combustible:", self.fuel_type)
        elif text == "Etiqueta Medioambiental":
            self.filter_fields_layout.addRow("Etiqueta:", self.env_label)

    #def search_cars(self):
    #    self.car_list.clear()
    #    query = self.search_bar.text().strip()
    #    
    #    if not query:
    #        return
#
    #    parts = query.split()
    #    brand = parts[0] if parts else ""
    #    model = " ".join(parts[1:]) if len(parts) > 1 else ""
#
    #    filters = {
    #        "brand": brand,
    #        "model": model
    #    }
#
    #    match self.filter_combo.currentText():
    #        case "Kilómetros":
    #            filters["kilometers_range"] = (self.min_km.value(), self.max_km.value())
    #        case "Consumo":
    #            filters["consume_range"] = (self.min_consume.value(), self.max_consume.value())
    #        case "Autonomía":
    #            filters["autonomy_range"] = (self.min_autonomy.value(), self.max_autonomy.value())
    #        case "Combustible":
    #            filters["fuel_type"] = self.fuel_type.currentText()
    #        case "Etiqueta Medioambiental":
    #            filters["environmental_label"] = self.env_label.currentText()
#
    #    results = self.business_object.get_filtered_cars(**filters)
#
    #    if not results:
    #        item = QListWidgetItem("No hay coches disponibles con los filtros actuales.")
    #        item.setFlags(Qt.ItemFlag.NoItemFlags)
    #        self.car_list.addItem(item)
    #        return
#
    #    for car in results:
    #        widget = QWidget()
    #        layout = QVBoxLayout(widget)
#
    #        image_label = QLabel()
    #        image_path = car.get('pimage')
    #        pixmap = QPixmap(image_path)
    #        if not pixmap.isNull():
    #            image_label.setPixmap(pixmap.scaled(200, 120, Qt.AspectRatioMode.KeepAspectRatio))
    #        
    #        else:
    #            image_label.setText("Sin imagen")
    #            image_label.setAlignment(Qt.AlignmentFlag.AlignLeft)
#
    #        title = QLabel(f"{car['brand']} {car['model']}")
    #        title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
    #        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
#
    #        desc = QLabel(f"{car['kilometers']} km | {car['enviormental_label']} | {car['price']}€")
    #        desc.setAlignment(Qt.AlignmentFlag.AlignCenter)
#
    #        description_label = QLabel()
    #        description = car.get('pdescription', 'Sin descripción')
    #        description_label.setText(description)
    #        description_label.setAlignment(Qt.AlignmentFlag.AlignRight)
#
    #        layout.addWidget(image_label)
    #        layout.addWidget(description_label)
    #        layout.addWidget(title)
    #        layout.addWidget(desc)
    #        layout.setContentsMargins(8, 8, 8, 8)
    #        layout.setSpacing(4)
#
    #        item = QListWidgetItem()
    #        item.setSizeHint(widget.sizeHint())
    #        self.car_list.addItem(item)
    #        self.car_list.setItemWidget(item, widget)

    def search_cars(self):
        self.car_list.clear()  # Limpiar la lista de coches al realizar una nueva búsqueda
        query = self.search_bar.text().strip()
        
        if not query:
            return
    
        # Dividir el término de búsqueda en marca y modelo
        parts = query.split()
        brand = parts[0] if parts else ""
        model = " ".join(parts[1:]) if len(parts) > 1 else ""
    
        filters = {
            "brand": brand,
            "model": model
        }
    
        # Aplicar los filtros según la selección del combo
        match self.filter_combo.currentText():
            case "Kilómetros":
                filters["kilometers_range"] = (self.min_km.value(), self.max_km.value())
            case "Consumo":
                filters["consume_range"] = (self.min_consume.value(), self.max_consume.value())
            case "Autonomía":
                filters["autonomy_range"] = (self.min_autonomy.value(), self.max_autonomy.value())
            case "Combustible":
                filters["fuel_type"] = self.fuel_type.currentText()
            case "Etiqueta Medioambiental":
                filters["environmental_label"] = self.env_label.currentText()
    
        # Realizar la consulta con los filtros aplicados
        results = self.business_object.get_filtered_cars(**filters)
    
        if not results:
            # Si no hay resultados, mostramos un mensaje de error
            item = QListWidgetItem("No hay coches disponibles con los filtros actuales.")
            item.setFlags(Qt.ItemFlag.NoItemFlags)
            self.car_list.addItem(item)
            return
    
        # Iterar sobre los resultados obtenidos y mostrarlos en la lista
        for car in results:
            widget = QWidget()
            
            # Asegurarnos de que el widget no tenga un layout asignado previamente
            layout = QHBoxLayout(widget)  # Usamos QHBoxLayout para la imagen a la izquierda y la descripción a la derecha
    
            # Imagen del coche
            image_label = QLabel()
            image_path = car.get('pimage')
            pixmap = QPixmap(image_path)
            if not pixmap.isNull():
                image_label.setPixmap(pixmap.scaled(200, 120, Qt.AspectRatioMode.KeepAspectRatio))
            else:
                image_label.setText("Sin imagen")
                image_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
    
            # Descripción del coche (recuperada de la columna 'description' de la base de datos)
            description_label = QLabel()
            description = car.get('pdescription', 'Sin descripción')
            description_label.setText(description)
            description_label.setAlignment(Qt.AlignmentFlag.AlignLeft)
            description_label.setStyleSheet("font-size: 14px; font-weight: bold; color: #555;")
    
            # Colocamos la descripción encima del modelo y los datos
            description_layout = QVBoxLayout()
            title = QLabel(f"{car['brand']} {car['model']}")
            title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
            title.setAlignment(Qt.AlignmentFlag.AlignLeft)
    
            desc = QLabel(f"{car['kilometers']} km | {car['enviormental_label']} | {car['price']}€")
            desc.setAlignment(Qt.AlignmentFlag.AlignLeft)
    
            description_layout.addWidget(description_label)  # Descripción del producto
            description_layout.addWidget(title)  # Marca y modelo
            description_layout.addWidget(desc)   # Kilómetros, etiqueta y precio
    
            # Añadir la imagen y la descripción al layout
            layout.addWidget(image_label)
            layout.addLayout(description_layout)  # Descripción al lado de la imagen
    
            widget.setLayout(layout)  # Asignamos el layout solo una vez
    
            # Añadir la tarjeta del coche a la lista
            item = QListWidgetItem()
            item.setSizeHint(widget.sizeHint())
            self.car_list.addItem(item)
            self.car_list.setItemWidget(item, widget)

    def reset_filters(self):
        self.search_bar.clear()
        self.filter_combo.setCurrentIndex(0)
        self.show_filter_fields("Filtrar")
        self.car_list.clear()
