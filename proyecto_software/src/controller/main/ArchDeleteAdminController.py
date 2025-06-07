# src/controller/main/ArchDeleteAdminController.py

from model.BusinessObject import BusinessObject
from model.loggerSingleton import LoggerSingleton

class ArchDeleteAdminController:
    def __init__(self, vista):
        self.vista = vista
        self.user_bo = BusinessObject().user
        self.logger = LoggerSingleton()

        # Conexión de señales
        self.vista.eliminar_reasignar_clicked.connect(self.eliminar_y_reasignar)
        self.vista.admin_to_delete_changed.connect(self.actualizar_reasignables)

        # Inicializar datos
        self.cargar_admins()

    def cargar_admins(self):
        try:
            admins = self.user_bo.get_admins_excluding_actual(-1)
            self.vista.cargar_admins_para_eliminar(admins)
            if admins:
                self.actualizar_reasignables(admins[0])
        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"Error cargando admins: {e}", True)

    def actualizar_reasignables(self, admin_id):
        try:
            admins_reasignar = self.user_bo.get_admins_excluding_actual(admin_id)
            self.vista.cargar_admins_para_reasignar(admins_reasignar)
        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"Error cargando admins para reasignar: {e}", True)

    def eliminar_y_reasignar(self, admin_a_eliminar, admin_para_reasignar):
        try:
            exito = self.user_bo.delete_admin(admin_a_eliminar, admin_para_reasignar)
            if exito:
                self.logger.add_log_activity(
                    f"Admin {admin_a_eliminar} eliminado y empleados reasignados a {admin_para_reasignar}")
                self.vista.mostrar_mensaje("Éxito", "Admin eliminado y empleados reasignados correctamente.")
                self.cargar_admins()
            else:
                self.vista.mostrar_mensaje("Error", "No se pudo completar la operación.", True)
        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"Error en operación: {e}", True)
