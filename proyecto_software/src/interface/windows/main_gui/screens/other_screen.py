# src/interface/windows/main_gui/screens/other_screen.py
from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QHBoxLayout, QComboBox, QLineEdit,
    QPushButton, QListWidget, QLabel, QFormLayout, QSpinBox, QListWidgetItem, QMessageBox
)
from PyQt6.QtCore import Qt, pyqtSignal

class OtherScreen(QWidget):
    buscar_signal = pyqtSignal(str, str, dict)
    comprar_signal = pyqtSignal(int)

    def __init__(self):
        super().__init__()
        self.init_ui()

    def init_ui(self):
        layout = QVBoxLayout()
        self.setLayout(layout)

        # Layout búsqueda
        search_layout = QHBoxLayout()
        self.search_bar = QLineEdit()
        self.search_bar.setPlaceholderText("Buscar por marca o modelo")

        self.search_button = QPushButton("Buscar")
        self.filter_combo = QComboBox()
        self.filter_combo.addItems(["Filtrar", "Precio", "Tamaño"])
        self.reset_button = QPushButton("Eliminar filtros")

        search_layout.addWidget(self.search_bar)
        search_layout.addWidget(self.search_button)
        search_layout.addWidget(self.filter_combo)
        search_layout.addWidget(self.reset_button)
        layout.addLayout(search_layout)

        # Campos dinámicos
        self.filter_fields_layout = QFormLayout()
        self.filter_fields_widget = QWidget()
        self.filter_fields_widget.setLayout(self.filter_fields_layout)
        layout.addWidget(self.filter_fields_widget)

        # Campos de filtro
        self.min_price = QSpinBox(); self.min_price.setRange(0, 100000000)
        self.max_price = QSpinBox(); self.max_price.setRange(0, 100000000)
        self.min_size = QSpinBox(); self.min_size.setRange(0, 2000)
        self.max_size = QSpinBox(); self.max_size.setRange(0, 2000)

        self.other_list = QListWidget()
        self.other_list.setSpacing(8)
        layout.addWidget(self.other_list)

        self.filter_combo.currentTextChanged.connect(self.mostrar_campos)
        self.search_button.clicked.connect(self.emitir_busqueda)
        self.reset_button.clicked.connect(self.limpiar)

    def mostrar_campos(self, filtro):
        while self.filter_fields_layout.count():
            self.filter_fields_layout.itemAt(0).widget().deleteLater()

        if filtro == "Precio":
            self.filter_fields_layout.addRow("Mín. precio:", self.min_price)
            self.filter_fields_layout.addRow("Máx. precio:", self.max_price)
        
        elif filtro == "Tamaño":
            self.filter_fields_layout.addRow("Mín. tamaño:", self.min_size)
            self.filter_fields_layout.addRow("Máx. tamaño:", self.max_size)

    def emitir_busqueda(self):
        texto = self.search_bar.text().strip()
        partes = texto.split()
        marca = partes[0] if partes else ""
        modelo = " ".join(partes[1:]) if len(partes) > 1 else ""

        filtros = {}
        
        if self.min_price.value() != 0 or self.max_price.value() != 0:
            filtros["price_range"] = (self.min_price.value(), self.max_price.value())
        
        if self.min_size.value() != 0 or self.max_size.value() != 0:
            filtros["size_range"] = (self.min_size.value(), self.max_size.value())

        self.buscar_signal.emit(marca, modelo, filtros)

    def limpiar(self):
        self.search_bar.clear()
        self.other_list.clear()
        self.min_price.setValue(0)
        self.max_price.setValue(0)
        self.min_size.setValue(0)
        self.max_size.setValue(0)
        self.filter_combo.setCurrentIndex(0)
        self.mostrar_campos("Filtrar")

    def mostrar_resultados(self, resultados, client_id, obtener_owner_fn):
        self.other_list.clear()
        
        if not resultados:
            item = QListWidgetItem("No hay productos disponibles con los filtros actuales.")
            item.setFlags(Qt.ItemFlag.NoItemFlags)
            self.other_list.addItem(item)
            return

        from PyQt6.QtGui import QPixmap, QFont

        for r in resultados:
            widget = QWidget()
            layout = QVBoxLayout(widget)

            img = QLabel()
            pixmap = QPixmap(r["pimage"])
            
            if pixmap.isNull():
                img.setText("Sin imagen")
                img.setAlignment(Qt.AlignmentFlag.AlignCenter)
            
            else:
                img.setPixmap(pixmap.scaled(200, 120, Qt.AspectRatioMode.KeepAspectRatio))

            title = QLabel(f"{r['brand']} {r['model']}")
            title.setFont(QFont("Arial", 10, QFont.Weight.Bold))
            title.setAlignment(Qt.AlignmentFlag.AlignCenter)

            desc = QLabel(f"{r['size_of']} cm | {r['price']}€")
            desc.setAlignment(Qt.AlignmentFlag.AlignCenter)

            layout.addWidget(img)
            layout.addWidget(title)
            layout.addWidget(desc)

            if obtener_owner_fn(r["ProductID"]) != client_id:
                boton = QPushButton("Comprar")
                boton.clicked.connect(lambda _, pid=r["ProductID"]: self.comprar_signal.emit(pid))
                layout.addWidget(boton)

            item = QListWidgetItem()
            item.setSizeHint(widget.sizeHint())
            self.other_list.addItem(item)
            self.other_list.setItemWidget(item, widget)

    def mostrar_mensaje(self, titulo, mensaje, critico=False):
        if critico:
            QMessageBox.critical(self, titulo, mensaje)
        
        else:
            QMessageBox.information(self, titulo, mensaje)
