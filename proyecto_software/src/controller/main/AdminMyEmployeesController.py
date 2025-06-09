# src/controller/main/AdminMyEmployeesController.py
from model.BusinessObject import BusinessObject
from model.loggerSingleton import LoggerSingleton


class AdminMyEmployeesController:
    def __init__(self, vista, user_id):
        self.vista = vista
        self.user_id = user_id
        self.logger = LoggerSingleton()
        self.bo_user = BusinessObject().user
        self.bo_service = BusinessObject().service

        self.admin_id = self.bo_user.get_admin_id_by_user_id(user_id)

        self.vista.eliminar_empleado_signal.connect(self.eliminar_empleado)
        self.vista.actualizar_empleados_signal.connect(self.cargar_empleados)

        self.cargar_empleados()

    def cargar_empleados(self):
        """
        Obtiene los empleados asociados al administrador y los envía a la vista.
        """
        
        try:
            empleados = self.bo_user.get_employees_by_admin_id(self.admin_id)
            self.vista.cargar_empleados(empleados)
        
        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"No se pudieron cargar los empleados: {e}", error=True)

    def eliminar_empleado(self, employee_id: int):
        """
        Elimina un empleado tras confirmar la acción con el usuario.
        Primero elimina sus servicios asociados, luego elimina al empleado.
        """
        try:
            success = self.bo_service.delete_services_by_employee_id(employee_id)

            if success or success is None:  # permitir continuar si no había servicios
                success = self.bo_user.delete_employee(employee_id)

                if success:
                    self.logger.add_log_activity(f"Empleado {employee_id} eliminado correctamente.")
                    self.vista.mostrar_mensaje("Éxito", "Empleado eliminado correctamente.")
                    self.cargar_empleados()
                    return

            self.vista.mostrar_mensaje("Error", "No se pudo eliminar el empleado.", error=True)

        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"Error al eliminar el empleado: {e}", error=True)
