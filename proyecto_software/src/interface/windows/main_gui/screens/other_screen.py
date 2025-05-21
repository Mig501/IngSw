from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit, QPushButton, QListWidget, QListWidgetItem, QLabel, QFormLayout, QSpinBox, QMessageBox
from PyQt6.QtCore import Qt, QSize
from PyQt6.QtGui import QPixmap, QFont
from model.BusinessObject import BusinessObject

class OtherScreen(QWidget):
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
        self.search_bar.setPlaceholderText("Buscar por marca o modelo")

        self.search_button = QPushButton("Buscar", self)
        self.search_button.clicked.connect(self.search_other)

        self.filter_combo = QComboBox(self)
        self.filter_combo.addItem("Filtrar")
        self.filter_combo.addItem("Precio")
        self.filter_combo.addItem("Tamaño")
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
        self.min_price = QSpinBox()
        self.min_price.setRange(0,100000000)
        self.max_price = QSpinBox()
        self.max_price.setRange(0, 100000000)

        # Widgets de tamaño
        self.min_size = QSpinBox()
        self.min_size.setRange(0, 2000)
        self.max_size = QSpinBox()
        self.max_size.setRange(0, 2000)

        # Lista de resultados
        self.other_list = QListWidget()
        self.other_list.setSpacing(8)
        layout.addWidget(self.other_list)

        return layout

    def show_filter_fields(self, text):
        for i in reversed(range(self.filter_fields_layout.count())):
            self.filter_fields_layout.itemAt(i).widget().setParent(None)


        if text == "Tamaño":
            self.filter_fields_layout.addRow("Mín. tamaño:", self.min_size)
            self.filter_fields_layout.addRow("Máx. tamaño:", self.max_size)

        elif text == "Precio":
            self.filter_fields_layout.addRow("Mín. precio:", self.min_price)
            self.filter_fields_layout.addRow("Máx. precio:", self.max_price)

    def search_other(self):
        self.other_list.clear()  # Limpiar la lista de otros al realizar una nueva búsqueda
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
        if self.min_size.value() != 0 or self.max_size.value() != 0:
            filters["size_range"] = (self.min_size.value(), self.max_size.value())

        if self.min_price.value() != 0 or self.max_price.value() != 0:
            filters["price_range"] = (self.min_price.value(), self.max_price.value())

        # Print para depuración
        print(filters)
        
        results = self.business_object.get_filtered_others(**filters)

        if not results:
            # Si no hay resultados, mostramos un mensaje de error
            item = QListWidgetItem("No hay productos disponibles con los filtros actuales.")
            item.setFlags(Qt.ItemFlag.NoItemFlags)
            self.other_list.addItem(item)
            return

        for other in results:
            widget = QWidget()
            layout = QVBoxLayout(widget)

            image_label = QLabel()
            image_path = other.get('pimage')
            pixmap = QPixmap(image_path)
            if not pixmap.isNull():
                image_label.setPixmap(pixmap.scaled(200, 120, Qt.AspectRatioMode.KeepAspectRatio))
            else:
                image_label.setText("Sin imagen")
                image_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

            title = QLabel(f"{other['brand']} {other['model']}")
            title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
            title.setAlignment(Qt.AlignmentFlag.AlignCenter)

            desc = QLabel(f"{other['size_of']} cm | {other['price']}€")
            desc.setAlignment(Qt.AlignmentFlag.AlignCenter)

            layout.addWidget(image_label)
            layout.addWidget(title)
            layout.addWidget(desc)

            # Botón de compra
            owner_id = self.business_object.get_owner_id(other['ProductID'])
            client_id = self.business_object.get_client_id(self.user_vo.user_id)


            if owner_id != client_id:
                buy_button = QPushButton("Comprar")
                buy_button.clicked.connect(lambda _, product_id=other['ProductID']: self.buy_product(product_id))
                layout.addWidget(buy_button)

            layout.setContentsMargins(8, 8, 8, 8)
            layout.setSpacing(4)

            item = QListWidgetItem()
            item.setSizeHint(widget.sizeHint())
            self.other_list.addItem(item)
            self.other_list.setItemWidget(item, widget)

    def reset_filters(self):
        # Limpiar el combo de filtros
        self.filter_combo.setCurrentIndex(0)
        self.show_filter_fields("Filtrar")

        # Limpiar la barra de búsqueda
        self.search_bar.clear()

        # Limpiar la lista de otros
        self.other_list.clear()

        # Restablecer los filtros a los valores predeterminados
        self.min_size.setValue(0)
        self.max_size.setValue(2000)
        self.min_price.setValue(0)
        self.max_price.setValue(100000000)

    def buy_product(self, product_id:int):
        confirm = QMessageBox.question(self,"Confirmar compra",
            "¿Estás seguro de que quieres comprar este producto?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
            )
        
        if confirm == QMessageBox.StandardButton.Yes:
            client_id = self.business_object.get_client_id(self.user_vo.user_id)

            # Evitar que compre su propio producto
            owner = self.business_object.get_owner_id(product_id)
            
            if client_id is None or owner is None:
                QMessageBox.critical(self, "Error", "Error interno al validar la compra.")
                return

            if owner == client_id:
                QMessageBox.critical(self, "Error", "No puedes comprar tu propio producto.")
                return

            try:
                success = self.business_object.buy_product(product_id, client_id)
                
                if success:
                    QMessageBox.information(self, "Compra exitosa", "Has comprado el producto con éxito.")
                    self.other_list.clear()
                    self.search_other()
                else:
                    QMessageBox.critical(self, "Error", "No se ha podido completar la compra.")
            
            except Exception as e:
                if "Saldo insuficiente" in str(e):
                    QMessageBox.warning(self, "Saldo insuficiente", "No tienes suficiente saldo para comprar este producto.")

                else:
                    QMessageBox.critical(self, "Error", f"Error inesperado:\n{e}")
