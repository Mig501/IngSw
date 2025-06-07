# src/interface/windows/main_gui/screens/archDeleteAdminScreen.py

from PyQt6.QtWidgets import (
    QWidget, QVBoxLayout, QFormLayout, QLabel, QComboBox,
    QPushButton, QMessageBox
)
from PyQt6.QtCore import Qt, pyqtSignal


class ArchDeleteAdminScreen(QWidget):
    eliminar_reasignar_clicked = pyqtSignal(int, int)
    admin_to_delete_changed = pyqtSignal(int)

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Eliminar administrador y reasignar empleados")

        self.layout = QVBoxLayout()
        self.setLayout(self.layout)

        title = QLabel("Eliminar admin y reasignar empleados")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.layout.addWidget(title)

        form = QFormLayout()
        self.combo_admin_to_delete = QComboBox()
        self.combo_admin_reassign = QComboBox()

        form.addRow("Admin a eliminar:", self.combo_admin_to_delete)
        form.addRow("Admin para reasignar empleados:", self.combo_admin_reassign)

        self.layout.addLayout(form)

        self.btn_delete_reassign = QPushButton("Eliminar y reasignar")
        self.layout.addWidget(self.btn_delete_reassign)

        # Señales
        self.btn_delete_reassign.clicked.connect(self.emitir_senal_eliminar)
        self.combo_admin_to_delete.currentIndexChanged.connect(self.emitir_senal_cambio_admin)

    def emitir_senal_eliminar(self):
        admin_a_eliminar = self.combo_admin_to_delete.currentData()
        admin_para_reasignar = self.combo_admin_reassign.currentData()

        if admin_a_eliminar is None or admin_para_reasignar is None:
            self.mostrar_mensaje("Atención", "Debes seleccionar ambos admins.", True)
            return

        if admin_a_eliminar == admin_para_reasignar:
            self.mostrar_mensaje("Atención", "No puedes reasignar empleados al mismo admin que vas a eliminar.", True)
            return

        confirm = QMessageBox.question(
            self, "Confirmar acción",
            f"¿Eliminar admin {admin_a_eliminar} y reasignar empleados a admin {admin_para_reasignar}?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )

        if confirm == QMessageBox.StandardButton.Yes:
            self.eliminar_reasignar_clicked.emit(admin_a_eliminar, admin_para_reasignar)

    def emitir_senal_cambio_admin(self, index):
        admin_id = self.combo_admin_to_delete.itemData(index)
        if admin_id is not None:
            self.admin_to_delete_changed.emit(admin_id)

    def cargar_admins_para_eliminar(self, admin_list):
        self.combo_admin_to_delete.clear()
        for admin_id in admin_list:
            self.combo_admin_to_delete.addItem(str(admin_id), admin_id)

    def cargar_admins_para_reasignar(self, admin_list):
        self.combo_admin_reassign.clear()
        for admin_id in admin_list:
            self.combo_admin_reassign.addItem(str(admin_id), admin_id)

    def mostrar_mensaje(self, titulo, mensaje, error=False):
        if error:
            QMessageBox.critical(self, titulo, mensaje)
        else:
            QMessageBox.information(self, titulo, mensaje)
