from PyQt6.QtWidgets import QWidget, QVBoxLayout, QPushButton, QFileDialog, QMessageBox
from utils.backup_util.backup_util import create_backup_mysql

class BackupScreen(QWidget):
    def __init__(self, db_name, db_user, db_password) -> None:
        super().__init__()
        self.db_name = db_name
        self.db_user = db_user
        self.db_password = db_password

        layout = QVBoxLayout()
        self.setLayout(layout)

        self.btn_backup = QPushButton("Realizar Backup")
        self.btn_backup.clicked.connect(self.realize_backup)
        layout.addWidget(self.btn_backup)

    def realize_backup(self):
        path = QFileDialog.getExistingDirectory(self, "Seleccionar carpeta de backup")

        if path:
            exit, result = create_backup_mysql(self.db_name, self.db_user, self.db_password, path)

            if exit:
                QMessageBox.information(self, "Backup Exitoso", f"Backup creado en: {result}")
            
            else:
                QMessageBox.critical(self, "Error", f"Error al crear el backup: {result}")