# src/interface/windows/main_gui/screens/clientMyServicesScreen.py
from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QListWidget, QPushButton, QMessageBox
from PyQt6.QtCore import Qt, pyqtSignal

class MyServicesScreen(QWidget):
    eliminar_servicio_signal = pyqtSignal(int)
    actualizar_lista_signal = pyqtSignal()

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Mis Servicios")
        self.setGeometry(100, 100, 600, 400)

        layout = QVBoxLayout()
        title = QLabel("Servicios Registrados")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.service_list = QListWidget()
        layout.addWidget(self.service_list)

        self.btn_delete = QPushButton("Eliminar servicio seleccionado")
        self.btn_delete.clicked.connect(self.eliminar_servicio)
        layout.addWidget(self.btn_delete)

        self.btn_refresh = QPushButton("Actualizar lista")
        self.btn_refresh.clicked.connect(self.actualizar_lista_signal.emit)
        layout.addWidget(self.btn_refresh)

        self.setLayout(layout)

    def eliminar_servicio(self):
        selected = self.service_list.currentItem()
        
        if not selected:
            self.advertencia("Por favor, seleccione un servicio para eliminar.")
            return

        try:
            service_id = int(selected.text().split(" - ")[0])
        
        except ValueError:
            self.advertencia("ID de servicio no válido.")
            return
        
        confirm = QMessageBox.question(
            self,
            "Confirmar eliminación",
            "¿Estás seguro de que quieres eliminar este servicio?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )

        if confirm == QMessageBox.StandardButton.Yes:
            self.eliminar_servicio_signal.emit(service_id)

    def actualizar_lista(self, servicios: list[dict]):
        self.service_list.clear()
        
        for s in servicios:
            texto = f"{s['ServiceID']} - {s['ser_name']} {s['ser_description']}"
            self.service_list.addItem(texto)

    def mostrar_mensaje(self, titulo, mensaje, error=False):
        from PyQt6.QtWidgets import QMessageBox
        if error:
            QMessageBox.critical(self, titulo, mensaje)
        
        else:
            QMessageBox.information(self, titulo, mensaje)

    def advertencia(self, mensaje):
        from PyQt6.QtWidgets import QMessageBox
        QMessageBox.warning(self, "Advertencia", mensaje)
