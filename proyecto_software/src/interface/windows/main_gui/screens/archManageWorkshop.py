from PyQt6.QtWidgets import QWidget, QVBoxLayout, QFormLayout, QLineEdit, QPushButton, QLabel, QMessageBox
from model.vo.WorkshopVO import WorkshopVO
from model.BusinessObject import BusinessObject

class AdminManageWorkshop(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Gestión de Taller")
        self.setGeometry(100, 100, 400, 300)

        # Layouts
        main_layout = QVBoxLayout()
        form_layout = QFormLayout()

        # Campos del formulario
        self.input_ws_zip_code = QLineEdit(self)
        self.input_size_of = QLineEdit(self)
        self.input_phone_number = QLineEdit(self)
        self.input_inv_parking_slot = QLineEdit(self)
        self.input_inv_num_pieces = QLineEdit(self)
        self.input_add_street = QLineEdit(self)
        self.input_add_number = QLineEdit(self)
        self.input_add_city = QLineEdit(self)

        # Añadir los campos al formulario
        form_layout.addRow("Código Postal:", self.input_ws_zip_code)
        form_layout.addRow("Tamaño del Taller (m²):", self.input_size_of)
        form_layout.addRow("Teléfono:", self.input_phone_number)
        form_layout.addRow("Plaza de Estacionamiento:", self.input_inv_parking_slot)
        form_layout.addRow("Número de Piezas:", self.input_inv_num_pieces)
        form_layout.addRow("Calle:", self.input_add_street)
        form_layout.addRow("Número:", self.input_add_number)
        form_layout.addRow("Ciudad:", self.input_add_city)

        # Botón de guardar
        self.save_button = QPushButton("Guardar Taller", self)
        self.save_button.clicked.connect(self.save_workshop)

        # Añadir los layouts
        main_layout.addLayout(form_layout)
        main_layout.addWidget(self.save_button)
        self.setLayout(main_layout)

    def save_workshop(self):
        """Método que recoge los datos del formulario y guarda el taller"""
        # Recoger datos del formulario
        ws_zip_code = self.input_ws_zip_code.text()
        size_of = float(self.input_size_of.text())
        phone_number = self.input_phone_number.text()
        inv_parking_slot = self.input_inv_parking_slot.text()
        inv_num_pieces = int(self.input_inv_num_pieces.text())
        add_street = self.input_add_street.text()
        add_number = int(self.input_add_number.text())
        add_city = self.input_add_city.text()

        # Crear el objeto WorkshopVO con los datos obtenidos del formulario
        workshop_vo = WorkshopVO(
            ws_zip_code, size_of, phone_number, inv_parking_slot,
            inv_num_pieces, add_street, add_number, add_city
        )

        try:
            business_object = BusinessObject()
            
            if business_object.register_workshop(workshop_vo):
                QMessageBox.information(self, "Éxito", "Taller registrado correctamente.")
                self.input_ws_zip_code.clear()
                self.input_size_of.clear()
                self.input_phone_number.clear()
                self.input_inv_parking_slot.clear()
                self.input_inv_num_pieces.clear()
                self.input_add_street.clear()
                self.input_add_number.clear()
                self.input_add_city.clear()
            
            else:
                raise Exception("No se pudo registrar el taller.")
        
        except Exception as e:
            QMessageBox.critical(self, "Error", str(e))
