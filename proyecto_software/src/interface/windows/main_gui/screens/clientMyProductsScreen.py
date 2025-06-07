# src/interface/windows/main_gui/screens/clientMyProductsScreen.py

from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QLabel, QListWidget,
    QPushButton, QMessageBox
)
from PyQt6.QtCore import Qt, pyqtSignal

class MyProductsScreen(QWidget):
    delete_product_signal = pyqtSignal(int)
    refresh_products_signal = pyqtSignal()

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Mis Productos")
        self.setGeometry(100, 100, 600, 400)

        layout = QVBoxLayout()

        title = QLabel("Productos Registrados")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.product_list = QListWidget()
        layout.addWidget(self.product_list)

        self.btn_delete = QPushButton("Eliminar producto seleccionado")
        self.btn_delete.clicked.connect(self.on_delete_clicked)
        layout.addWidget(self.btn_delete)

        self.btn_refresh = QPushButton("Actualizar lista")
        self.btn_refresh.clicked.connect(self.refresh_products_signal.emit)
        layout.addWidget(self.btn_refresh)

        self.setLayout(layout)

    def on_delete_clicked(self):
        selected = self.product_list.currentItem()
        if not selected:
            QMessageBox.warning(self, "Advertencia", "Selecciona un producto para eliminar.")
            return

        product_id = int(selected.text().split(" - ")[0])
        confirm = QMessageBox.question(
            self,
            "Confirmar eliminación",
            "¿Estás seguro de que quieres eliminar este producto?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )
        if confirm == QMessageBox.StandardButton.Yes:
            self.delete_product_signal.emit(product_id)

    def populate_products(self, productos: list):
        self.product_list.clear()
        for p in productos:
            item_text = f"{p['ProductID']} - {p['brand']} {p['model']} ({p['ptype']})"
            self.product_list.addItem(item_text)

    def show_message(self, title, text, error=False):
        if error:
            QMessageBox.critical(self, title, text)
        else:
            QMessageBox.information(self, title, text)
