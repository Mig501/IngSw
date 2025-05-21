#src/interface/windows/main_gui/screens/clientMyProductsScreen.py
from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QLabel, QListWidget,
    QPushButton, QMessageBox
)
from PyQt6.QtCore import Qt
from model.BusinessObject import BusinessObject

class MyServicesScreen(QWidget):
    def __init__(self, client_id):
        super().__init__()
        self.client_id = client_id
        self.setWindowTitle("Mis Servicios")
        self.setGeometry(100, 100, 600, 400)

        layout = QVBoxLayout()

        title = QLabel("Servicios Registrados")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.product_list = QListWidget()
        layout.addWidget(self.product_list)

        self.btn_delete = QPushButton("Eliminar servicio seleccionado")
        self.btn_delete.clicked.connect(self.eliminar_servicio)
        layout.addWidget(self.btn_delete)

        self.btn_refresh = QPushButton("Actualizar lista")
        self.btn_refresh.clicked.connect(self.cargar_servicios)
        layout.addWidget(self.btn_refresh)

        self.setLayout(layout)
        self.cargar_servicios()

    def cargar_servicios(self):
        self.product_list.clear() 
        servicios = BusinessObject().get_employee_services(self.client_id)
        for s in servicios: 
            item_text = f"{s['ServiceID']} - {s['ser_name']} {s['ser_description']}"
            self.product_list.addItem(item_text)

    def eliminar_servicio(self):
        selected = self.product_list.currentItem()
        if not selected:
            QMessageBox.warning(self, "Advertencia", "Selecciona un servicio para eliminar.")
            return

        service_id = int(selected.text().split(" - ")[0])

        confirm = QMessageBox.question(
            self,
            "Confirmar eliminación",
            "¿Estás seguro de que quieres eliminar este servicio?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )

        if confirm == QMessageBox.StandardButton.Yes:
            success = BusinessObject().delete_service(service_id)
            if success:
                QMessageBox.information(self, "Éxito", "Servicio eliminado correctamente.")
                self.cargar_servicios()
            else:
                QMessageBox.critical(self, "Error", "No se pudo eliminar el servicio.")