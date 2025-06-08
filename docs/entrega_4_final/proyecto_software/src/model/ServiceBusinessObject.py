#src/model/ServiceBusinessObject.py
from model.dao.ServiceDao import ServiceDao
from model.vo.ServiceVO import ServiceVO

class ServiceBusinessObject:
    """
    Lógica de negocio para los servicios.
    Encapsula el acceso al DAO y controla la validación y propagación de errores.
    """

    def __init__(self, service_dao=None) -> None:
        self.service_dao = service_dao or ServiceDao()

    def register_service(self, service_vo: ServiceVO) -> bool:
        try:
            return self.service_dao.insert_service(service_vo)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.register_service: {e}")

    def get_service_owner_id(self, service_id: int) -> int:
        try:
            return self.service_dao.get_employee_by_service_id(service_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.get_service_owner_id: {e}")

    def hire_service(self, client_id: int, service_id: int) -> bool:
        try:
            return self.service_dao.hire_service(service_id, client_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.hire_service: {e}")

    def get_employee_services(self, employee_id: int) -> list:
        try:
            return self.service_dao.get_employee_services(employee_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.get_employee_services: {e}")

    def delete_service(self, service_id: int) -> bool:
        try:
            return self.service_dao.delete_service(service_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.delete_service: {e}")

    def delete_services_by_employee_id(self, employee_id: int) -> bool:
        try:
            return self.service_dao.delete_service_by_employee_id(employee_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.delete_services_by_employee_id: {e}")

    def get_filtered_services(self, **filters) -> list:
        """
        Obtiene una lista de servicios filtrados dinámicamente.

        Filtros admitidos:
            - name (str): texto parcial a buscar en el nombre del servicio
            - price_range (tuple): (min, max)

        Returns:
            list: lista de servicios filtrados
        """
        try:
            return self.service_dao.get_filtered_services(**filters)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.get_filtered_services: {e}")

    def get_service_owner_id(self, service_id: int) -> int:
        return self.service_dao.get_employee_by_service_id(service_id)
