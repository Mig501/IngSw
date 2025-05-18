from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit, QPushButton, QListWidget, QListWidgetItem, QLabel, QFormLayout, QSpinBox, QMessageBox
from PyQt6.QtCore import Qt, QSize
from PyQt6.QtGui import QPixmap, QFont
from model.BusinessObject import BusinessObject

class VehicleScreen(QWidget):
    def __init__(self, user_vo):
        super().__init__()

        self.business_object = BusinessObject()
        self.user_vo = user_vo

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
        self.filter_combo.addItem("Precio")
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

        self.min_price = QSpinBox()
        self.min_price.setRange(0,100000000)
        self.max_price = QSpinBox()
        self.max_price.setRange(0, 100000000)

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

        elif text == "Precio":
            self.filter_fields_layout.addRow("Mín. precio:", self.min_price)
            self.filter_fields_layout.addRow("Máx. precio:", self.max_price)

    def search_cars(self):
        self.car_list.clear()  # Limpiar la lista de coches al realizar una nueva búsqueda
        query = self.search_bar.text().strip()

        if not query:
            return

        # Dividir el término de búsqueda en marca y modelo
        parts = query.split()
        brand = parts[0] if parts else ""
        model = " ".join(parts[1:]) if len(parts) > 1 else ""

        filters = {}

        if 'brand' not in filters.keys():
            filters["brand"] = brand

        if 'model' not in filters.keys():
            filters["model"] = model

        # Añadir filtros según el tipo de filtro seleccionado
        if self.min_km.value() != 0 or self.max_km.value() != 0:
            filters["kilometers_range"] = (self.min_km.value(), self.max_km.value())

        if self.min_consume.value() != 0 or self.max_consume.value() != 0:
            filters["consume_range"] = (self.min_consume.value(), self.max_consume.value())

        if self.min_autonomy.value() != 0 or self.max_autonomy.value() != 0:
            filters["autonomy_range"] = (self.min_autonomy.value(), self.max_autonomy.value())

        if self.fuel_type.currentText() != "":
            filters["fuel_type"] = self.fuel_type.currentText()

        if self.env_label.currentText() != "":
            filters["environmental_label"] = self.env_label.currentText()

        if self.min_price.value() != 0 or self.max_price.value() != 0:
            filters["price_range"] = (self.min_price.value(), self.max_price.value())

        # Print para depuración
        print(filters)
        
        results = self.business_object.get_filtered_cars(**filters)

        if not results:
            # Si no hay resultados, mostramos un mensaje de error
            item = QListWidgetItem("No hay coches disponibles con los filtros actuales.")
            item.setFlags(Qt.ItemFlag.NoItemFlags)
            self.car_list.addItem(item)
            return

        for car in results:
            widget = QWidget()
            layout = QVBoxLayout(widget)

            image_label = QLabel()
            image_path = car.get('pimage')
            pixmap = QPixmap(image_path)
            if not pixmap.isNull():
                image_label.setPixmap(pixmap.scaled(200, 120, Qt.AspectRatioMode.KeepAspectRatio))
            else:
                image_label.setText("Sin imagen")
                image_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

            title = QLabel(f"{car['brand']} {car['model']}")
            title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
            title.setAlignment(Qt.AlignmentFlag.AlignCenter)

            desc = QLabel(f"{car['kilometers']} km | {car['enviormental_label']} | {car['price']}€ | {car['consume']} L/100km | Autonomy: {car['autonomy']} km")
            desc.setAlignment(Qt.AlignmentFlag.AlignCenter)

            layout.addWidget(image_label)
            layout.addWidget(title)
            layout.addWidget(desc)

            # Botón de compra
            owner_id = self.business_object.get_owner_id(car['ProductID'])
            client_id = self.business_object.get_client_id(self.user_vo.user_id)


            if owner_id != client_id:
                buy_button = QPushButton("Comprar")
                buy_button.clicked.connect(lambda _, product_id=car['ProductID']: self.buy_product(product_id))
                layout.addWidget(buy_button)

            layout.setContentsMargins(8, 8, 8, 8)
            layout.setSpacing(4)

            item = QListWidgetItem()
            item.setSizeHint(widget.sizeHint())
            self.car_list.addItem(item)
            self.car_list.setItemWidget(item, widget)

    def reset_filters(self):
        # Limpiar el combo de filtros
        self.filter_combo.setCurrentIndex(0)
        self.show_filter_fields("Filtrar")

        # Limpiar la barra de búsqueda
        self.search_bar.clear()

        # Limpiar la lista de coches
        self.car_list.clear()

        # Restablecer los filtros a los valores predeterminados
        self.min_km.setValue(0)
        self.max_km.setValue(1000000)   
        self.min_consume.setValue(0)
        self.max_consume.setValue(100)
        self.min_autonomy.setValue(0)
        self.max_autonomy.setValue(2000)
        self.fuel_type.setCurrentText("")
        self.env_label.setCurrentText("")
        self.min_price.setValue(0)
        self.max_price.setValue(100000000)

    def buy_product(self, product_id:int):
        confirm = QMessageBox.question(self,"Confirmar compra",
            "¿Estás seguro de que quieres comprar este vehículo?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
            )
        
        if confirm == QMessageBox.StandardButton.Yes:
            client_id = self.business_object.get_client_id(self.user_vo.user_id)
        
            # Evitar que compre su propio coche
            owner = self.business_object.get_owner_id(product_id)
            
            if client_id is None or owner is None:
                QMessageBox.critical(self, "Error", "Error interno al validar la compra.")
                return

            
            if owner == client_id:
                QMessageBox.critical(self, "Error", "No puedes comprar tu propio coche.")
                return

            try:
                success = self.business_object.buy_product(product_id, client_id)
                
                if success:
                    QMessageBox.information(self, "Compra exitosa", "Has comprado el vehículo con éxito.")
                    self.car_list.clear()
                    self.search_cars()
                else:
                    QMessageBox.critical(self, "Error", "No se ha podido completar la compra.")
            
            except Exception as e:
                if "Saldo insuficiente" in str(e):
                    QMessageBox.warning(self, "Saldo insuficiente", "No tienes suficiente saldo para comprar este vehículo.")
            
                else:
                    QMessageBox.critical(self, "Error", f"Error inesperado:\n{e}")
