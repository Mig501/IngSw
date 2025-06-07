# src/controller/main/BackupController.py

from utils.backup_util.backup_util import create_backup_mysql, restore_backup_mysql

class BackupController:
    """
    Controlador para la pantalla de copia de seguridad.
    Se encarga de ejecutar las operaciones de backup y restauración.
    """

    def __init__(self, view, db_name: str, db_user: str, db_password: str):
        self.view = view
        self.db_name = db_name
        self.db_user = db_user
        self.db_password = db_password

        # Conectar señales de la vista
        self.view.backup_requested.connect(self.handle_backup)
        self.view.restore_requested.connect(self.handle_restore)

    def handle_backup(self, path: str):
        """Realiza un backup de la base de datos en la ruta dada."""
        success, result = create_backup_mysql(
            self.db_name, self.db_user, self.db_password, path
        )
        if success:
            self.view.show_message("Backup Exitoso", f"Backup creado en: {result}")
        else:
            self.view.show_message("Error", f"Error al crear el backup: {result}", is_error=True)

    def handle_restore(self, path: str):
        """Restaura la base de datos desde el archivo SQL seleccionado."""
        success, message = restore_backup_mysql(
            self.db_name, self.db_user, self.db_password, path
        )
        if success:
            self.view.show_message("Restauración Exitosa", message)
        else:
            self.view.show_message("Error", f"Error al restaurar el backup: {message}", is_error=True)
