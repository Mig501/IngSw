#src/interface/windows/main_gui/screens/clientMyProductsScreen.py
from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QLabel, QListWidget,
    QPushButton, QMessageBox
)
from PyQt6.QtCore import Qt
from model.BusinessObject import BusinessObject

class MyEmployeesScreen(QWidget):
    def __init__(self, user_id: int):
        super().__init__()
        self.user_id = user_id # A la ventana le llega el id de usuario, no el id del admin
        self.admin_id = BusinessObject().user.get_admin_id_by_user_id(user_id)

        self.setWindowTitle("Mis Empleados")
        self.setGeometry(100, 100, 600, 400)

        layout = QVBoxLayout()

        title = QLabel("Empleados Registrados")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.employee_list = QListWidget()
        layout.addWidget(self.employee_list)

        self.btn_delete = QPushButton("Eliminar empleado seleccionado")
        self.btn_delete.clicked.connect(self.eliminar_empleado)
        layout.addWidget(self.btn_delete)

        self.btn_refresh = QPushButton("Actualizar lista")
        self.btn_refresh.clicked.connect(self.cargar_empleados)
        layout.addWidget(self.btn_refresh)

        self.setLayout(layout) 
        self.cargar_empleados()

    def cargar_empleados(self):
        self.employee_list.clear() 
        empleados = BusinessObject().user.get_employees_by_admin_id(self.admin_id)
        for e in empleados: 
            item_text = f"{e['EmployeeID']} - {e['first_name']} {e['second_name']} {e['specialization']}"
            self.employee_list.addItem(item_text)

    def eliminar_empleado(self):
        selected = self.employee_list.currentItem()
        if not selected:
            QMessageBox.warning(self, "Advertencia", "Selecciona un empleado para eliminar.")
            return

        employee_id = int(selected.text().split(" - ")[0])

        if not employee_id:
            QMessageBox.warning(self, "Advertencia", "Selecciona un empleado válido.")
            return

        confirm = QMessageBox.question(
            self,
            "Confirmar eliminación",
            "¿Estás seguro de que quieres eliminar este empleado?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )

        if confirm == QMessageBox.StandardButton.Yes:
            try:
                success = BusinessObject().service.delete_services_by_employee_id(employee_id)
                if success:
                    success = BusinessObject().user.delete_employee(employee_id)
                    if success:
                        QMessageBox.information(self, "Éxito",  "Empleado eliminado correctamente.")
                        self.cargar_empleados()
                    else:
                        QMessageBox.critical(self, "Error", "No se pudo eliminar el empleado.")
            
            except Exception as e:
                QMessageBox.critical(self, "Error", f"Error al eliminar el empleado: {e}")