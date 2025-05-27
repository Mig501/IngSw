from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QFormLayout, QLabel, QComboBox,
    QPushButton, QMessageBox
)
from PyQt6.QtCore import Qt
from model.BusinessObject import BusinessObject
from model.loggerSingleton import LoggerSingleton

class ArchDeleteAdminScreen(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Eliminar administrador y reasignar empleados")

        self.layout = QVBoxLayout()
        self.setLayout(self.layout)
        self.logger = LoggerSingleton()

        title = QLabel("Eliminar admin y reasignar empleados")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.layout.addWidget(title)

        form = QFormLayout()

        # Combo para seleccionar admin a eliminar
        self.combo_admin_to_delete = QComboBox()
        form.addRow("Admin a eliminar:", self.combo_admin_to_delete)

        # Combo para seleccionar admin para reasignar empleados
        self.combo_admin_reassign = QComboBox()
        form.addRow("Admin para reasignar empleados:", self.combo_admin_reassign)

        self.layout.addLayout(form)

        # Botón eliminar y reasignar
        self.btn_delete_reassign = QPushButton("Eliminar y reasignar")
        self.btn_delete_reassign.clicked.connect(self.eliminar_y_reasignar)
        self.layout.addWidget(self.btn_delete_reassign)

        # Business Object para lógica
        self.bo = BusinessObject()

        # Cargar admins en combos al iniciar
        self.cargar_admins()

        # Actualizar combo de reasignar al cambiar admin a eliminar
        self.combo_admin_to_delete.currentIndexChanged.connect(self.on_admin_to_delete_changed)

    def cargar_admins(self):
        try:
            # Obtener todos los admins para eliminar (pasar -1 para todos)
            admins = self.bo.get_admins_excluding_actual(-1)
            self.combo_admin_to_delete.clear()
            for admin_id in admins:
                self.combo_admin_to_delete.addItem(str(admin_id), admin_id)
            if admins:
                self.on_admin_to_delete_changed(0)
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error cargando admins: {e}")

    def on_admin_to_delete_changed(self, index):
        admin_id = self.combo_admin_to_delete.currentData()
        if admin_id is None:
            return
        try:
            # Obtener admins excluyendo el que se va a eliminar
            admins_reassign = self.bo.get_admins_excluding_actual(admin_id)
            self.combo_admin_reassign.clear()
            for admin_id_reassign in admins_reassign:
                self.combo_admin_reassign.addItem(str(admin_id_reassign), admin_id_reassign)
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error cargando admins para reasignar: {e}")

    def eliminar_y_reasignar(self):
        admin_a_eliminar = self.combo_admin_to_delete.currentData()
        admin_para_reasignar = self.combo_admin_reassign.currentData()

        if admin_a_eliminar is None or admin_para_reasignar is None:
            QMessageBox.warning(self, "Atención", "Debes seleccionar ambos admins.")
            return
        if admin_a_eliminar == admin_para_reasignar:
            QMessageBox.warning(self, "Atención", "No puedes reasignar empleados al mismo admin que vas a eliminar.")
            return

        confirm = QMessageBox.question(
            self, "Confirmar acción",
            f"¿Eliminar admin {admin_a_eliminar} y reasignar empleados a admin {admin_para_reasignar}?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )
        if confirm != QMessageBox.StandardButton.Yes:
            return

        try:
            exito = self.bo.delete_admin(admin_a_eliminar, admin_para_reasignar)
            if exito:
                self.logger.add_log_activity(f"Admin {admin_a_eliminar} eliminado y empleados reasignados a {admin_para_reasignar}")
                QMessageBox.information(self, "Éxito", "Admin eliminado y empleados reasignados correctamente.")
                self.cargar_admins()
            else:
                QMessageBox.warning(self, "Error", "No se pudo completar la operación.")
        except Exception as e:
            QMessageBox.critical(self, "Error", f"Error en operación: {e}")
