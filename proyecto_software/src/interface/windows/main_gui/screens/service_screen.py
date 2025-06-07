# src/interface/windows/main_gui/screens/service_screen.py
from PyQt6.QtWidgets import QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit, QPushButton, QListWidget, QListWidgetItem, QLabel, QFormLayout, QSpinBox, QMessageBox
from PyQt6.QtCore import Qt, pyqtSignal
from PyQt6.QtGui import QFont

class ServiceScreen(QWidget):
    buscar_servicios_signal = pyqtSignal(str, int, int)
    contratar_servicio_signal = pyqtSignal(int)
    eliminar_filtros_signal = pyqtSignal()

    def __init__(self, user_vo):
        super().__init__()
        self.user_vo = user_vo
        self.setLayout(self.setup_ui())

    def setup_ui(self):
        layout = QVBoxLayout()

        # Barra de búsqueda y botones
        search_layout = QHBoxLayout()
        self.search_bar = QLineEdit(self)
        self.search_bar.setPlaceholderText("Buscar por nombre del servicio")

        self.search_button = QPushButton("Buscar", self)
        self.search_button.clicked.connect(self.emitir_busqueda)

        self.filter_combo = QComboBox(self)
        self.filter_combo.addItem("Filtrar")
        self.filter_combo.addItem("Precio")
        self.filter_combo.currentTextChanged.connect(self.mostrar_filtros)

        self.reset_button = QPushButton("Eliminar filtros", self)
        self.reset_button.clicked.connect(lambda: self.eliminar_filtros_signal.emit())

        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)
        search_layout.addWidget(self.reset_button)

        layout.addLayout(search_layout)

        # Zona dinámica para filtros
        self.filter_fields_layout = QFormLayout()
        self.filter_fields_widget = QWidget()
        self.filter_fields_widget.setLayout(self.filter_fields_layout)
        layout.addWidget(self.filter_fields_widget)

        # Spinners de precio
        self.min_price = QSpinBox()
        self.min_price.setRange(0, 100000000)
        self.max_price = QSpinBox()
        self.max_price.setRange(0, 100000000)

        # Lista de servicios
        self.service_list = QListWidget()
        self.service_list.setSpacing(8)
        layout.addWidget(self.service_list)

        return layout

    def emitir_busqueda(self):
        query = self.search_bar.text().strip()
        min_price = self.min_price.value()
        max_price = self.max_price.value()
        self.buscar_servicios_signal.emit(query, min_price, max_price)

    def mostrar_filtros(self, texto):
        for i in reversed(range(self.filter_fields_layout.count())):
            self.filter_fields_layout.itemAt(i).widget().setParent(None)

        if texto == "Precio":
            self.filter_fields_layout.addRow("Mín. precio:", self.min_price)
            self.filter_fields_layout.addRow("Máx. precio:", self.max_price)

    def mostrar_resultados(self, resultados, client_id, service_owner_fn):
        self.service_list.clear()

        if not resultados:
            item = QListWidgetItem("No hay servicios disponibles con los filtros actuales.")
            item.setFlags(Qt.ItemFlag.NoItemFlags)
            self.service_list.addItem(item)
            return

        for service in resultados:
            widget = QWidget()
            layout = QVBoxLayout(widget)

            title = QLabel(f"{service['name']}")
            title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
            title.setAlignment(Qt.AlignmentFlag.AlignCenter)

            desc = QLabel(f"Descripción: {service['description']} | Precio: {service['price']}€")
            desc.setAlignment(Qt.AlignmentFlag.AlignCenter)

            layout.addWidget(title)
            layout.addWidget(desc)

            # Mostrar botón si el servicio no es del propio cliente
            employee_id = service_owner_fn(service['ServiceID'])
            
            if employee_id != client_id:
                buy_button = QPushButton("Comprar")
                buy_button.clicked.connect(lambda _, s_id=service['ServiceID']: self.contratar_servicio_signal.emit(s_id))
                layout.addWidget(buy_button)

            layout.setContentsMargins(8, 8, 8, 8)
            layout.setSpacing(4)

            item = QListWidgetItem()
            item.setSizeHint(widget.sizeHint())
            self.service_list.addItem(item)
            self.service_list.setItemWidget(item, widget)

    def resetear_vista(self):
        self.search_bar.clear()
        self.min_price.setValue(0)
        self.max_price.setValue(0)
        
        for i in reversed(range(self.filter_fields_layout.count())):
            self.filter_fields_layout.itemAt(i).widget().setParent(None)
        
        self.service_list.clear()
