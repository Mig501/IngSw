from PyQt6.QtWidgets import QWidget, QVBoxLayout, QFormLayout, QLineEdit, QPushButton, QComboBox, QFileDialog, QMessageBox, QLabel
from model.vo.AutomobileVO import AutomobileVO
from model.vo.OtherProdVO import OtherProductVO
from model.BusinessObject import BusinessObject
from PyQt6.QtCore import Qt

class ProductRegisterScreen(QWidget):
    def __init__(self, client_id):
        super().__init__()
        self.client_id = client_id  # El client_id se pasa al constructor
        self.setWindowTitle("Registrar Producto")
        self.setGeometry(100, 100, 500, 400)

        # Layout principal
        self.main_layout = QVBoxLayout()  # Asegúrate de que `main_layout` sea un QVBoxLayout
        self.setLayout(self.main_layout)

        # Título de la ventana
        title = QLabel("Registrar Nuevo Producto")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.main_layout.addWidget(title)

        # Formulario común
        form = QFormLayout()
        self.input_price = QLineEdit()
        self.input_brand = QLineEdit()
        self.input_model = QLineEdit()
        self.input_year = QLineEdit()
        self.input_plocation = QLineEdit()
        self.input_description = QLineEdit()

        form.addRow("Precio:", self.input_price)
        form.addRow("Marca:", self.input_brand)
        form.addRow("Modelo:", self.input_model)
        form.addRow("Año de Fabricación:", self.input_year)
        form.addRow("Ubicación:", self.input_plocation)
        form.addRow("Descripción:", self.input_description)

        self.main_layout.addLayout(form)

        # Selección del tipo de producto (automóviles u otros)
        self.product_type_selector = QComboBox()
        self.product_type_selector.addItems(["automóviles", "otros"])
        self.product_type_selector.currentTextChanged.connect(self.mostrar_campos_especificos)
        self.main_layout.addWidget(self.product_type_selector)

        # Contenedor de campos específicos (automóviles u otros)
        self.campos_especificos = QFormLayout()
        self.main_layout.addLayout(self.campos_especificos)

        self.mostrar_campos_especificos(self.product_type_selector.currentText())

        # Campo para la ruta de la imagen
        self.input_image_path = QLineEdit()
        self.input_image_path.setPlaceholderText("Selecciona una imagen")
        self.select_image_button = QPushButton("Seleccionar Imagen", self)
        self.select_image_button.clicked.connect(self.select_image)

        self.main_layout.addWidget(self.input_image_path)
        self.main_layout.addWidget(self.select_image_button)

        # Botón registrar
        self.register_button = QPushButton("Registrar Producto")
        self.register_button.clicked.connect(self.registrar_producto)
        self.main_layout.addWidget(self.register_button)

    def mostrar_campos_especificos(self, tipo_producto):
        """Muestra u oculta los campos según el tipo de producto seleccionado"""
        # Limpiar los campos específicos antes de añadir los nuevos
        while self.campos_especificos.count():
            self.campos_especificos.removeRow(0)

        if tipo_producto == "automóviles":
            # Campos específicos para productos de tipo 'automóvil'
            self.input_kilometers = QLineEdit()
            self.input_engine = QComboBox()
            self.input_engine.addItems(['Gasolina', 'Diesel', 'Electrico', 'Hibrido', 'Hibrido enchufable', 'Hidrogeno', 'Biocombustible'])
            self.input_consume = QLineEdit()
            self.input_autonomy = QLineEdit()
            self.environmental_label = QComboBox()
            self.environmental_label.addItems(["0", "B", "ECO", "C"])
            self.input_label = self.environmental_label
            self.input_label.setPlaceholderText("Etiqueta medioambiental")

            self.campos_especificos.addRow("Kilómetros:", self.input_kilometers)
            self.campos_especificos.addRow("Motor:", self.input_engine)
            self.campos_especificos.addRow("Consumo (L/100 km):", self.input_consume)
            self.campos_especificos.addRow("Autonomía (km):", self.input_autonomy)
            self.campos_especificos.addRow("Etiqueta medioambiental:", self.input_label)

        elif tipo_producto == "otros":
            # Campos específicos para productos de tipo 'otros'
            self.input_size_of = QLineEdit()
            self.input_used_for = QLineEdit()

            self.campos_especificos.addRow("Tamaño (cm):", self.input_size_of)
            self.campos_especificos.addRow("Usado para:", self.input_used_for)

    def select_image(self):
        """Método que abre un cuadro de diálogo para seleccionar una imagen"""
        image_path, _ = QFileDialog.getOpenFileName(self, "Seleccionar Imagen", "", "Imagenes (*.png *.jpg *.jpeg)")
        if image_path:
            self.input_image_path.setText(image_path)  # Mostrar la ruta seleccionada en un campo de texto

    def registrar_producto(self):
        """Método que recoge los datos del formulario y guarda el producto"""
        try:
            # Verificación de los campos
            price = float(self.input_price.text())
        except ValueError:
            QMessageBox.critical(self, "Error", "El precio debe ser un número válido.")
            return

        brand = self.input_brand.text().strip().lower()
        if not brand:
            QMessageBox.critical(self, "Error", "La marca es un campo obligatorio.")
            return

        model = self.input_model.text().strip().lower()
        if not model:
            QMessageBox.critical(self, "Error", "El modelo es un campo obligatorio.")
            return

        try:
            year_manufacture = int(self.input_year.text())
        except ValueError:
            QMessageBox.critical(self, "Error", "El año de fabricación debe ser un número válido.")
            return

        plocation = self.input_plocation.text().strip()
        pdescription = self.input_description.text().strip()
        ptype = self.product_type_selector.currentText()
        image_path = self.input_image_path.text().strip()
        #engine = self.input_engine.currentText()

        # Verificación para tipo de producto 'automóviles' o 'otros'
        if ptype == 'automóviles':
            try:
                kilometers = int(self.input_kilometers.text())
            except ValueError:
                QMessageBox.critical(self, "Error", "Los kilómetros deben ser un número válido.")
                return

            try:
                consume = float(self.input_consume.text())
            except ValueError:
                QMessageBox.critical(self, "Error", "El consumo debe ser un número válido.")
                return

            try:
                autonomy = int(self.input_autonomy.text())
            except ValueError:
                QMessageBox.critical(self, "Error", "La autonomía debe ser un número válido.")
                return
            
            try:
                engine = self.input_engine.currentText()
            except ValueError:
                QMessageBox.critical(self, "Error", "El motor debe ser un número válido.")
                return

            env_label = self.input_label.currentText()

            product_vo = AutomobileVO(
                None,  # El ProductID se asigna automáticamente
                self.client_id,  # El ID del cliente se pasa al VO
                price,
                brand,
                model,
                year_manufacture,
                plocation,
                ptype,
                pdescription,
                kilometers,
                engine,
                consume,
                autonomy,
                env_label,
                image_path  # Pasar la ruta de la imagen
            )
        elif ptype == 'otros':
            try:
                size_of = float(self.input_size_of.text())
            except ValueError:
                QMessageBox.critical(self, "Error", "El tamaño debe ser un número válido.")
                return

            used_for = self.input_used_for.text().strip()
            if not used_for:
                QMessageBox.critical(self, "Error", "El campo 'Usado para' es obligatorio.")
                return

            product_vo = OtherProductVO(
                None,  # El ProductID se asigna automáticamente
                self.client_id,  # El ID del cliente se pasa al VO
                price,
                brand,
                model,
                year_manufacture,
                plocation,
                ptype,
                pdescription,
                size_of,
                used_for,
                image_path
            )

        # Intentar registrar el producto
        try:
            business_object = BusinessObject()
       
            if business_object.register_product(product_vo):
                QMessageBox.information(self, "Éxito", "Producto añadido correctamente.")
                self.clear_fields()  # Limpiar los campos después de añadir el producto

            else:
                QMessageBox.critical(self, "Error", "No se pudo añadir el producto.")
       
        except Exception as e:
            QMessageBox.critical(self, "Error", str(e))

    def clear_fields(self):
        """Limpiar todos los campos del formulario"""
        self.input_price.clear()
        self.input_brand.clear()
        self.input_model.clear()
        self.input_year.clear()
        self.input_plocation.clear()
        self.input_description.clear()
        self.input_image_path.clear()

        # Limpiar campos específicos según el tipo de producto
        if self.product_type_selector.currentText() == "automóviles":
            self.input_kilometers.clear()
            self.input_engine.setCurrentIndex(0)
            self.input_consume.clear()
            self.input_autonomy.clear()
            self.environmental_label.setCurrentIndex(0)
        elif self.product_type_selector.currentText() == "otros":
            self.input_size_of.clear()
            self.input_used_for.clear()
