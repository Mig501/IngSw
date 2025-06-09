# src/interface/windows/main_gui/screens/adminMyEmployeesScreen.py

from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QLabel, QListWidget,
    QPushButton, QMessageBox
)
from PyQt6.QtCore import Qt, pyqtSignal


class MyEmployeesScreen(QWidget):
    eliminar_empleado_signal = pyqtSignal(int)
    actualizar_empleados_signal = pyqtSignal()

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Mis Empleados")
        self.setGeometry(100, 100, 600, 400)

        layout = QVBoxLayout()

        title = QLabel("Empleados Registrados")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.employee_list = QListWidget()
        layout.addWidget(self.employee_list)

        self.btn_delete = QPushButton("Eliminar empleado seleccionado")
        self.btn_delete.clicked.connect(self.on_delete_clicked)
        layout.addWidget(self.btn_delete)

        self.btn_refresh = QPushButton("Actualizar lista")
        self.btn_refresh.clicked.connect(lambda: self.actualizar_empleados_signal.emit())
        layout.addWidget(self.btn_refresh)

        self.setLayout(layout)

    def on_delete_clicked(self):
        selected = self.employee_list.currentItem()
        if not selected:
            QMessageBox.warning(self, "Advertencia", "Selecciona un empleado para eliminar.")
            return
        try:
            employee_id = int(selected.text().split(" - ")[0])
        except ValueError:
            QMessageBox.warning(self, "Advertencia", "Empleado inválido.")

        confirm = QMessageBox.question(
            self,
            "Confirmar eliminación",
            "¿Estás seguro de que quieres eliminar este empleado?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )

        if confirm == QMessageBox.StandardButton.Yes:
            self.eliminar_empleado_signal.emit(employee_id)
    
    def cargar_empleados(self, lista_empleados: list):
        self.employee_list.clear()
        for e in lista_empleados:
            item_text = f"{e['EmployeeID']} - {e['first_name']} {e['second_name']} {e['specialization']}"
            self.employee_list.addItem(item_text)

    def mostrar_mensaje(self, titulo, mensaje, error=False):
        if error:
            QMessageBox.critical(self, titulo, mensaje)
        else:
            QMessageBox.information(self, titulo, mensaje)
