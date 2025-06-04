# src/model/ServiceBusinessObject.py
from model.dao.ServiceDao import ServiceDao
from model.vo.ServiceVO import ServiceVO

class ServiceBusinessObject:

    """Clase que maneja la lógica de negocio relacionada con los servicios.

    Encapsula operaciones como el registro de un servicio, la obtención del ID del propietario del servicio,
    la contratación de un servicio, la obtención de los servicios de un empleado y la eliminación de un servicio."""

    def __init__(self, service_dao=None) -> None:
        self.service_dao = service_dao or ServiceDao()

    def register_service(self, service_vo:ServiceVO) -> bool:
        """Registra un nuevo servicio en la base de datos.
        Args:
            service_vo (ServiceVO): Objeto de valor que contiene la información del servicio a registrar.

        Returns:
            bool: True si el servicio se registró correctamente, False en caso contrario.
        """
        try:
            return self.service_dao.insert_service(service_vo)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.register_service: {e}")

    def get_service_owner_id(self, service_id:int) -> int:
        """Obtiene el ID del propietario del servicio dado su ID.
        Args:
            service_id (int): ID del servicio.
        
        Returns:
            int: ID del propietario del servicio.
        """
        try:
            return self.service_dao.get_employee_by_service_id(service_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.get_service_owner_id: {e}")

    def hire_service(self, client_id:int, service_id:int) -> bool:
        """Contrata un servicio para un cliente dado el ID del cliente y el ID del servicio.
        Args:
            client_id (int): ID del cliente que contrata el servicio.
            service_id (int): ID del servicio a contratar.

        Returns:
            bool: True si el servicio se contrató correctamente, False en caso contrario.
        """

        try:
            return self.service_dao.hire_service(client_id, service_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.hire_service: {e}")

    def get_employee_services(self, employee_id:int) -> list:
        """Obtiene los servicios asociados a un empleado dado su ID.
        Args:
            employee_id (int): ID del empleado.

        Returns:
            list: Lista de servicios asociados al empleado.
        """
        try:
            return self.service_dao.get_employee_services(employee_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.get_employee_services: {e}")

    def delete_service(self, service_id:int) -> bool:
        """Elimina un servicio dado su ID.
        Args:
            service_id (int): ID del servicio a eliminar.

        Returns:
            bool: True si el servicio se eliminó correctamente, False en caso contrario.
        """
        try:
            return self.service_dao.delete_service(service_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.delete_service: {e}")

    def delete_services_by_employee_id(self, employee_id:int) -> bool:
        """Elimina todos los servicios asociados a un empleado dado su ID.
        Args:
            employee_id (int): ID del empleado cuyos servicios se eliminarán.

        Returns:
            bool: True si se eliminaron los servicios correctamente, False en caso contrario.
        """
        try:
            return self.service_dao.delete_service_by_employee_id(employee_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.delete_services_by_employee_id: {e}")