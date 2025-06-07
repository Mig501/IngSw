#src/interface/windows/main_gui/screens/vehicle_screen.py
from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit, QPushButton,
    QListWidget, QListWidgetItem, QLabel, QFormLayout, QSpinBox
)
from PyQt6.QtCore import Qt, pyqtSignal
from PyQt6.QtGui import QPixmap, QFont

class VehicleScreen(QWidget):
    buscar_vehiculos_signal = pyqtSignal()
    comprar_vehiculo_signal = pyqtSignal(int)

    def __init__(self):
        super().__init__()
        self.setup_ui()

    def setup_ui(self):
        self.layout = QVBoxLayout(self)

        search_layout = QHBoxLayout()
        self.search_bar = QLineEdit()
        self.search_bar.setPlaceholderText("Buscar por marca modelo")

        self.search_button = QPushButton("Buscar")
        self.reset_button = QPushButton("Eliminar filtros")

        self.filter_combo = QComboBox()
        self.filter_combo.addItems([
            "Filtrar", "Kilómetros", "Consumo", "Autonomía",
            "Combustible", "Etiqueta Medioambiental", "Precio"
        ])

        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)
        search_layout.addWidget(self.filter_combo)
        search_layout.addWidget(self.reset_button)
        self.layout.addLayout(search_layout)

        self.filter_fields_layout = QFormLayout()
        self.filter_fields_widget = QWidget()
        self.filter_fields_widget.setLayout(self.filter_fields_layout)
        self.layout.addWidget(self.filter_fields_widget)

        self.car_list = QListWidget()
        self.car_list.setSpacing(8)
        self.layout.addWidget(self.car_list)

    def mostrar_filtros(self, widgets):
        for i in reversed(range(self.filter_fields_layout.count())):
            self.filter_fields_layout.itemAt(i).widget().setParent(None)
        
        for label, widget in widgets:
            self.filter_fields_layout.addRow(label, widget)

    def limpiar_filtros(self):
        self.filter_combo.setCurrentIndex(0)
        self.mostrar_filtros([])

    def mostrar_resultado_vacio(self):
        item = QListWidgetItem("No hay coches disponibles con los filtros actuales.")
        item.setFlags(Qt.ItemFlag.NoItemFlags)
        self.car_list.addItem(item)

    def mostrar_vehiculos(self, lista_vehiculos, get_owner_id_fn, client_id):
        self.car_list.clear()
        
        for car in lista_vehiculos:
            widget = QWidget()
            layout = QVBoxLayout(widget)

            image_label = QLabel()
            pixmap = QPixmap(car.get("pimage"))
        
            if not pixmap.isNull():
                image_label.setPixmap(pixmap.scaled(200, 120, Qt.AspectRatioMode.KeepAspectRatio))
        
            else:
                image_label.setText("Sin imagen")
                image_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

            title = QLabel(f"{car['brand']} {car['model']}")
            title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
            title.setAlignment(Qt.AlignmentFlag.AlignCenter)

            desc = QLabel(f"{car['kilometers']} km | {car['enviormental_label']} | "
                          f"{car['price']}€ | {car['consume']} L/100km | Autonomía: {car['autonomy']} km")
            desc.setAlignment(Qt.AlignmentFlag.AlignCenter)

            layout.addWidget(image_label)
            layout.addWidget(title)
            layout.addWidget(desc)

            if get_owner_id_fn(car["ProductID"]) != client_id:
                buy_button = QPushButton("Comprar")
                buy_button.clicked.connect(lambda _, pid=car["ProductID"]: self.comprar_vehiculo_signal.emit(pid))
                layout.addWidget(buy_button)

            layout.setContentsMargins(8, 8, 8, 8)
            layout.setSpacing(4)

            item = QListWidgetItem()
            item.setSizeHint(widget.sizeHint())
            self.car_list.addItem(item)
            self.car_list.setItemWidget(item, widget)
