from PyQt6.QtWidgets import QWidget, QVBoxLayout, QFormLayout, QLineEdit, QPushButton, QComboBox, QFileDialog, QLabel
from PyQt6.QtCore import Qt, pyqtSignal

class ProductRegisterScreen(QWidget):
    registrar_producto_signal = pyqtSignal(dict)

    def __init__(self, client_id):
        super().__init__()
        self.client_id = client_id
        self.setWindowTitle("Registrar Producto")
        self.setGeometry(100, 100, 500, 400)

        self.main_layout = QVBoxLayout()
        self.setLayout(self.main_layout)

        title = QLabel("Registrar Nuevo Producto")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.main_layout.addWidget(title)

        self.form = QFormLayout()
        self.input_price = QLineEdit()
        self.input_brand = QLineEdit()
        self.input_model = QLineEdit()
        self.input_year = QLineEdit()
        self.input_plocation = QLineEdit()
        self.input_description = QLineEdit()

        self.form.addRow("Precio:", self.input_price)
        self.form.addRow("Marca:", self.input_brand)
        self.form.addRow("Modelo:", self.input_model)
        self.form.addRow("Año de Fabricación:", self.input_year)
        self.form.addRow("Ubicación:", self.input_plocation)
        self.form.addRow("Descripción:", self.input_description)

        self.main_layout.addLayout(self.form)

        self.product_type_selector = QComboBox()
        self.product_type_selector.addItems(["automóviles", "otros"])
        self.product_type_selector.currentTextChanged.connect(self.mostrar_campos_especificos)
        self.main_layout.addWidget(self.product_type_selector)

        self.campos_especificos = QFormLayout()
        self.main_layout.addLayout(self.campos_especificos)

        self.input_image_path = QLineEdit()
        self.input_image_path.setPlaceholderText("Selecciona una imagen")
        self.select_image_button = QPushButton("Seleccionar Imagen")
        self.select_image_button.clicked.connect(self.select_image)
        self.main_layout.addWidget(self.input_image_path)
        self.main_layout.addWidget(self.select_image_button)

        self.register_button = QPushButton("Registrar Producto")
        self.register_button.clicked.connect(self.emitir_senal_registro)
        self.main_layout.addWidget(self.register_button)

        self.mostrar_campos_especificos(self.product_type_selector.currentText())

    def mostrar_campos_especificos(self, tipo_producto):
        while self.campos_especificos.count():
            self.campos_especificos.removeRow(0)

        if tipo_producto == "automóviles":
            self.input_kilometers = QLineEdit()
            self.input_engine = QComboBox()
            self.input_engine.addItems(['Gasolina', 'Diesel', 'Electrico', 'Hibrido', 'Hibrido enchufable', 'Hidrogeno', 'Biocombustible'])
            self.input_consume = QLineEdit()
            self.input_autonomy = QLineEdit()
            self.environmental_label = QComboBox()
            self.environmental_label.addItems(["0", "B", "ECO", "C"])

            self.campos_especificos.addRow("Kilómetros:", self.input_kilometers)
            self.campos_especificos.addRow("Motor:", self.input_engine)
            self.campos_especificos.addRow("Consumo (L/100 km):", self.input_consume)
            self.campos_especificos.addRow("Autonomía (km):", self.input_autonomy)
            self.campos_especificos.addRow("Etiqueta medioambiental:", self.environmental_label)

        elif tipo_producto == "otros":
            self.input_size_of = QLineEdit()
            self.input_used_for = QLineEdit()

            self.campos_especificos.addRow("Tamaño (cm):", self.input_size_of)
            self.campos_especificos.addRow("Usado para:", self.input_used_for)

    def select_image(self):
        image_path, _ = QFileDialog.getOpenFileName(self, "Seleccionar Imagen", "", "Imagenes (*.png *.jpg *.jpeg)")
        if image_path:
            self.input_image_path.setText(image_path)

    def emitir_senal_registro(self):
        data = {
            "client_id": self.client_id,
            "price": self.input_price.text(),
            "brand": self.input_brand.text(),
            "model": self.input_model.text(),
            "year": self.input_year.text(),
            "location": self.input_plocation.text(),
            "description": self.input_description.text(),
            "ptype": self.product_type_selector.currentText(),
            "image": self.input_image_path.text(),
            "especificos": {}
        }

        if data["ptype"] == "automóviles":
            data["especificos"] = {
                "kilometers": self.input_kilometers.text(),
                "engine": self.input_engine.currentText(),
                "consume": self.input_consume.text(),
                "autonomy": self.input_autonomy.text(),
                "env_label": self.environmental_label.currentText()
            }
        elif data["ptype"] == "otros":
            data["especificos"] = {
                "size_of": self.input_size_of.text(),
                "used_for": self.input_used_for.text()
            }

        self.registrar_producto_signal.emit(data)

    def clear_fields(self):
        self.input_price.clear()
        self.input_brand.clear()
        self.input_model.clear()
        self.input_year.clear()
        self.input_plocation.clear()
        self.input_description.clear()
        self.input_image_path.clear()

        if self.product_type_selector.currentText() == "automóviles":
            self.input_kilometers.clear()
            self.input_engine.setCurrentIndex(0)
            self.input_consume.clear()
            self.input_autonomy.clear()
            self.environmental_label.setCurrentIndex(0)
        elif self.product_type_selector.currentText() == "otros":
            self.input_size_of.clear()
            self.input_used_for.clear()

    def show_message(self, title, message, is_error=False):
        from PyQt6.QtWidgets import QMessageBox
        if is_error:
            QMessageBox.critical(self, title, message)
        else:
            QMessageBox.information(self, title, message)
