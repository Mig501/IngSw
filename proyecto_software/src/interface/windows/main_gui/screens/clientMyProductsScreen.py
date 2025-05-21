#src/interface/windows/main_gui/screens/clientMyProductsScreen.py
from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QLabel, QListWidget,
    QPushButton, QMessageBox
)
from PyQt6.QtCore import Qt
from model.BusinessObject import BusinessObject

class MyProductsScreen(QWidget):
    def __init__(self, client_id):
        super().__init__()
        self.client_id = client_id
        self.setWindowTitle("Mis Productos")
        self.setGeometry(100, 100, 600, 400)

        layout = QVBoxLayout()

        title = QLabel("Productos Registrados")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.product_list = QListWidget()
        layout.addWidget(self.product_list)

        self.btn_delete = QPushButton("Eliminar producto seleccionado")
        self.btn_delete.clicked.connect(self.eliminar_producto)
        layout.addWidget(self.btn_delete)

        self.btn_refresh = QPushButton("Actualizar lista")
        self.btn_refresh.clicked.connect(self.cargar_productos)
        layout.addWidget(self.btn_refresh)

        self.setLayout(layout)
        self.cargar_productos()

    def cargar_productos(self):
        self.product_list.clear()
        productos = BusinessObject().get_client_products(self.client_id)
        for p in productos:
            item_text = f"{p['ProductID']} - {p['brand']} {p['model']} ({p['ptype']})"
            self.product_list.addItem(item_text)

    def eliminar_producto(self):
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
            success = BusinessObject().delete_product(product_id)
            if success:
                QMessageBox.information(self, "Éxito", "Producto eliminado correctamente.")
                self.cargar_productos()
            else:
                QMessageBox.critical(self, "Error", "No se pudo eliminar el producto.")