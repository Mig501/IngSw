# src/interface/windows/main_gui/screens/adminManageWorkshop.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QFormLayout, QLineEdit, QPushButton, QLabel, QMessageBox
from PyQt6.QtCore import pyqtSignal

class AdminManageWorkshop(QWidget):
    save_workshop_signal = pyqtSignal(dict)

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Gestión de Taller")
        self.setGeometry(100, 100, 400, 300)

        main_layout = QVBoxLayout()
        form_layout = QFormLayout()

        self.input_ws_zip_code = QLineEdit()
        self.input_size_of = QLineEdit()
        self.input_phone_number = QLineEdit()
        self.input_inv_parking_slot = QLineEdit()
        self.input_inv_num_pieces = QLineEdit()
        self.input_add_street = QLineEdit()
        self.input_add_number = QLineEdit()
        self.input_add_city = QLineEdit()

        form_layout.addRow("Código Postal:", self.input_ws_zip_code)
        form_layout.addRow("Tamaño del Taller (m²):", self.input_size_of)
        form_layout.addRow("Teléfono:", self.input_phone_number)
        form_layout.addRow("Plaza de Estacionamiento:", self.input_inv_parking_slot)
        form_layout.addRow("Número de Piezas:", self.input_inv_num_pieces)
        form_layout.addRow("Calle:", self.input_add_street)
        form_layout.addRow("Número:", self.input_add_number)
        form_layout.addRow("Ciudad:", self.input_add_city)

        self.save_button = QPushButton("Guardar Taller")
        self.save_button.clicked.connect(self.emit_save_signal)

        main_layout.addLayout(form_layout)
        main_layout.addWidget(self.save_button)
        self.setLayout(main_layout)

    def emit_save_signal(self):
        data = {
            "ws_zip_code": self.input_ws_zip_code.text(),
            "size_of": self.input_size_of.text(),
            "phone_number": self.input_phone_number.text(),
            "inv_parking_slot": self.input_inv_parking_slot.text(),
            "inv_num_pieces": self.input_inv_num_pieces.text(),
            "add_street": self.input_add_street.text(),
            "add_number": self.input_add_number.text(),
            "add_city": self.input_add_city.text(),
        }
        self.save_workshop_signal.emit(data)

    def clear_form(self):
        self.input_ws_zip_code.clear()
        self.input_size_of.clear()
        self.input_phone_number.clear()
        self.input_inv_parking_slot.clear()
        self.input_inv_num_pieces.clear()
        self.input_add_street.clear()
        self.input_add_number.clear()
        self.input_add_city.clear()

    def show_message(self, title, message, is_error=False):
        if is_error:
            QMessageBox.critical(self, title, message)
        else:
            QMessageBox.information(self, title, message)
