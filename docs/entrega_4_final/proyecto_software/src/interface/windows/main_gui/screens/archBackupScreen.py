# src/interface/windows/main_gui/screens/archBackupScreen.py

from PyQt6.QtWidgets import QWidget, QVBoxLayout, QPushButton, QFileDialog, QMessageBox
from PyQt6.QtCore import pyqtSignal

class BackupScreen(QWidget):
    backup_requested = pyqtSignal(str)
    restore_requested = pyqtSignal(str)

    def __init__(self):
        super().__init__()
        self.setWindowTitle("Copia de Seguridad")

        layout = QVBoxLayout()
        self.setLayout(layout)

        # Botón para realizar backup
        self.btn_backup = QPushButton("Realizar Backup")
        self.btn_backup.clicked.connect(self.realize_backup)
        layout.addWidget(self.btn_backup)

        # Botón para restaurar backup
        self.btn_restore = QPushButton("Restaurar Backup")
        self.btn_restore.clicked.connect(self.restore_backup)
        layout.addWidget(self.btn_restore)

    def realize_backup(self):
        path = QFileDialog.getExistingDirectory(self, "Seleccionar carpeta de backup")
        if path:
            self.backup_requested.emit(path)

    def restore_backup(self):
        path, _ = QFileDialog.getOpenFileName(
            self, "Seleccionar archivo de backup", "", "Archivos SQL (*.sql)"
        )
        if path:
            reply = QMessageBox.question(
                self,
                "Confirmar restauración",
                "¿Restaurar el backup seleccionado? Esta acción sobrescribirá la base de datos actual.",
                QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
            )
            if reply == QMessageBox.StandardButton.Yes:
                self.restore_requested.emit(path)

    def show_message(self, title, message, is_error=False):
        if is_error:
            QMessageBox.critical(self, title, message)
        else:
            QMessageBox.information(self, title, message)
