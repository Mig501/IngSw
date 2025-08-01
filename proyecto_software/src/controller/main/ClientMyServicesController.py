# src/controller/main/ClientMyServicesController.py
from model.BusinessObject import BusinessObject

class ClientMyServicesController:
    def __init__(self, vista, user_id):
        self.vista = vista
        self.user_id = user_id
        self.bo = BusinessObject().service
        self.employee_id = BusinessObject().user.get_employee_id_from_user_id(user_id)

        # Conectar señales
        self.vista.eliminar_servicio_signal.connect(self.eliminar_servicio)
        self.vista.actualizar_lista_signal.connect(self.cargar_servicios)

        # Cargar al inicio
        self.cargar_servicios()

    def cargar_servicios(self):
        """
        Carga los servicios registrados por el empleado y los envía a la vista.
        """
        try:
            servicios = self.bo.get_employee_services(self.employee_id)
            self.vista.actualizar_lista(servicios)
        
        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"No se pudieron cargar los servicios.\n{str(e)}", error=True)

    def eliminar_servicio(self, service_id):
        """
        Elimina un servicio después de confirmar la acción con el usuario.

        Args:
            service_id (int): ID del servicio a eliminar.
        """
        try:
            success = self.bo.delete_service(service_id)
            if success:
                self.vista.mostrar_mensaje("Éxito", "Servicio eliminado correctamente.")
                self.cargar_servicios()
            
            else:
                self.vista.mostrar_mensaje("Error", "No se pudo eliminar el servicio.", error=True)
        
        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"Error al eliminar: {str(e)}", error=True)
