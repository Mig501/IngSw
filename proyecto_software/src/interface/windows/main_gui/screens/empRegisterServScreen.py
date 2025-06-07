# Vista - empRegisterServScreen.py
from PyQt6.QtWidgets import QWidget, QVBoxLayout, QFormLayout, QLineEdit, QPushButton, QComboBox, QLabel
from PyQt6.QtCore import Qt, pyqtSignal

class ServiceRegisterScreen(QWidget):
    registrar_servicio_signal = pyqtSignal(dict)

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Registrar servicio")
        self.setGeometry(100, 100, 500, 400)

        self.main_layout = QVBoxLayout()
        self.setLayout(self.main_layout)

        title = QLabel("Registrar Nuevo Servicio")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.main_layout.addWidget(title)

        form = QFormLayout()
        self.input_name = QLineEdit()
        self.input_description = QLineEdit()
        self.input_price = QLineEdit()
        form.addRow("Nombre:", self.input_name)
        form.addRow("Descripción del servicio:", self.input_description)
        form.addRow("Precio:", self.input_price)
        self.main_layout.addLayout(form)

        self.service_type_selector = QComboBox()
        self.service_type_selector.addItems(['mecánico', 'electricista', 'informático'])
        self.main_layout.addWidget(self.service_type_selector)

        self.register_button = QPushButton("Registrar Servicio")
        self.register_button.clicked.connect(self.emit_registrar_signal)
        self.main_layout.addWidget(self.register_button)

    def emit_registrar_signal(self):
        datos = {
            "name": self.input_name.text().strip(),
            "description": self.input_description.text().strip(),
            "price": self.input_price.text().strip(),
            "type": self.service_type_selector.currentText()
        }
        self.registrar_servicio_signal.emit(datos)

    def clear_fields(self):
        self.input_name.clear()
        self.input_description.clear()
        self.input_price.clear()

    def show_message(self, title, message, is_error=False):
        from PyQt6.QtWidgets import QMessageBox
        if is_error:
            QMessageBox.critical(self, title, message)
        
        else:
            QMessageBox.information(self, title, message)
