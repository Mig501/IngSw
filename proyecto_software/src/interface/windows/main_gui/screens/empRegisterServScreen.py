from PyQt6.QtWidgets import QWidget, QVBoxLayout, QFormLayout, QLineEdit, QPushButton, QComboBox, QFileDialog, QMessageBox, QLabel
from model.vo.ServiceVO import ServiceVO
from model.BusinessObject import BusinessObject
from PyQt6.QtCore import Qt

class ServiceRegisterScreen(QWidget):
    def __init__(self, employee_id):
        super().__init__()
        self.employee_id = employee_id  # Guardar el ID del empleado
        self.setWindowTitle("Registrar servicio")
        self.setGeometry(100, 100, 500, 400)
 
        # Layout principal
        self.main_layout = QVBoxLayout()  # Asegúrate de que `main_layout` sea un QVBoxLayout
        self.setLayout(self.main_layout)

        # Título de la ventana
        title = QLabel("Registrar Nuevo Servicio")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.main_layout.addWidget(title)

        # Formulario común 
        form = QFormLayout()
        self.input_name = QLineEdit()
        self.input_description = QLineEdit()
        self.input_price = QLineEdit()
        form.addRow("nombre:", self.input_name)
        form.addRow("Descripcion del servicio:", self.input_description)
        form.addRow("precio:", self.input_price)

        self.main_layout.addLayout(form)

        # Selección del tipo de empleado
        self.service_type_selector = QComboBox()
        self.service_type_selector.addItems(['mecáncio', 'electricista', 'informático'])
        self.main_layout.addWidget(self.service_type_selector)

        # Botón registrar
        self.register_button = QPushButton("Registrar Servicio")
        self.register_button.clicked.connect(self.registrar_servicio)
        self.main_layout.addWidget(self.register_button)

    def registrar_servicio(self):
        """Método que recoge los datos del formulario y guarda el producto"""
        try:
            # Verificación de los campos
            price = float(self.input_price.text())
        except ValueError:
            QMessageBox.critical(self, "Error", "El precio debe ser un número válido.")
            return

        name = self.input_name.text().strip().lower()
        if not name:
            QMessageBox.critical(self, "Error", "El nombre es un campo obligatorio.")
            return

        pdescription = self.input_description.text().strip()
        ptype = self.service_type_selector.currentText()

        # Verificación para tipo de producto 'automóviles' o 'otros'
        if ptype == 'mecáncio':

            service_vo = ServiceVO(
                None,  # El ProductID se asigna automáticamente
                self.employee_id,  # El ID del empleado se pasa al VO
                price,
                name,
                pdescription,
            )
        elif ptype == 'electricista':

            service_vo = ServiceVO(
                None,  # El ProductID se asigna automáticamente
                self.employee_id,  # El ID del empleado se pasa al VO
                price,
                name,
                pdescription,
            )
        elif ptype == 'informático':

            service_vo = ServiceVO(
                None,  # El ProductID se asigna automáticamente
                self.employee_id,  # El ID del empleado se pasa al VO
                price,
                name,
                pdescription,
            )

        # Intentar registrar el producto
        try:
            business_object = BusinessObject()
       
            if business_object.register_service(service_vo):
                QMessageBox.information(self, "Éxito", "Servicio añadido correctamente.")
                self.clear_fields()  # Limpiar los campos después de añadir el producto

            else:
                QMessageBox.critical(self, "Error", "No se pudo añadir el servicio.")
       
        except Exception as e:
            QMessageBox.critical(self, "Error", str(e))

    def clear_fields(self):
        """Limpiar todos los campos del formulario"""
        self.input_price.clear()
        self.input_name.clear()
        self.input_description.clear()

