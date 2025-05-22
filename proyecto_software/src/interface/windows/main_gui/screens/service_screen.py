from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit, QPushButton, QListWidget, QListWidgetItem, QLabel, QFormLayout, QSpinBox, QMessageBox
from PyQt6.QtCore import Qt, QSize
from PyQt6.QtGui import QPixmap, QFont
from model.BusinessObject import BusinessObject
class ServiceScreen(QWidget):
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
        self.search_bar.setPlaceholderText("Buscar por nombre del servicio")

        self.search_button = QPushButton("Buscar", self)
        self.search_button.clicked.connect(self.search_services)

        self.filter_combo = QComboBox(self)
        self.filter_combo.addItem("Filtrar")
        self.filter_combo.addItem("Precio")
        self.filter_combo.currentTextChanged.connect(self.show_filter_fields)

        self.reset_button = QPushButton("Eliminar filtros", self)
        self.reset_button.clicked.connect(self.reset_filters)

        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)
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
        
        # Lista de resultados
        self.service_list = QListWidget()
        self.service_list.setSpacing(8)
        layout.addWidget(self.service_list)

        return layout
    def show_filter_fields(self, text):
        for i in reversed(range(self.filter_fields_layout.count())):
            self.filter_fields_layout.itemAt(i).widget().setParent(None)

        if text == "Precio":
            self.filter_fields_layout.addRow("Mín. precio:", self.min_price)
            self.filter_fields_layout.addRow("Máx. precio:", self.max_price)

    def search_services(self):
        self.service_list.clear()
        query = self.search_bar.text().strip()
        if not query:
            return
        
        filters = {}
        if 'name' not in filters.keys():
            filters["name"] = query
        
        # Añadir filtros según el tipo de filtro seleccionado
        if self.min_price.value() != 0 or self.max_price.value() != 0:
            filters["price_range"] = (self.min_price.value(), self.max_price.value())
        
        # Print para depuración
        print(filters)

        results = self.business_object.get_filtered_services(**filters)

        if not results:
            # Si no hay resultados, mostramos un mensaje de error
            item = QListWidgetItem("No hay servicios disponibles con los filtros actuales.")
            item.setFlags(Qt.ItemFlag.NoItemFlags)
            self.service_list.addItem(item)
            return
        
        for service in results:
            widget = QWidget()
            layout = QVBoxLayout(widget)

            title = QLabel(f"{service['name']}")
            title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
            title.setAlignment(Qt.AlignmentFlag.AlignCenter)

            desc = QLabel(f"Descripción: {service['description']} | Precio: {service['price']}€")
            desc.setAlignment(Qt.AlignmentFlag.AlignCenter)

            layout.addWidget(title)
            layout.addWidget(desc)

            # Botón de compra
            employee_id = self.business_object.get_service_owner_id(service['ServiceID'])
            client_id = self.business_object.get_client_id(self.user_vo.user_id)

            if employee_id != client_id:
                buy_button = QPushButton("Comprar")
                buy_button.clicked.connect(lambda _, service_id=service['ServiceID']: self.hire_service(service_id))
                layout.addWidget(buy_button)

            layout.setContentsMargins(8, 8, 8, 8)
            layout.setSpacing(4)

            item = QListWidgetItem()
            item.setSizeHint(widget.sizeHint())
            self.service_list.addItem(item)
            self.service_list.setItemWidget(item, widget)

    def reset_filters(self):
        self.search_bar.clear()
        self.min_price.setValue(0)
        self.max_price.setValue(0)

        for i in reversed(range(self.filter_fields_layout.count())):
            self.filter_fields_layout.itemAt(i).widget().setParent(None)

        self.service_list.clear()

    def hire_service(self, service_id:int):
        confirm = QMessageBox.question(self,"Confirmar compra",
            "¿Estás seguro de que quieres comprar este vehículo?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
            )
        client_id = self.business_object.get_client_id(self.user_vo.user_id)
    
        try:
            success = self.business_object.hire_service(client_id, service_id)
            if success:
                QMessageBox.information(self, "Éxito", "Servicio contratado con éxito.")
                self.service_list.clear()
                self.search_services()
            else:
                QMessageBox.warning(self, "Error", "No se pudo contratar el servicio.")
        
        except Exception as e:
            if "saldo insuficiente" in str(e):
                QMessageBox.warning(self, "Error", "No tienes suficiente saldo para contratar este servicio.")
            else:
                QMessageBox.critical(self, "Error", f"Error inesperado: {e}")

