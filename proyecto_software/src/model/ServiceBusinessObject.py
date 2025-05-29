# src/model/ServiceBusinessObject.py
from model.dao.ServiceDao import ServiceDao

class ServiceBusinessObject:
    def __init__(self, service_dao=None):
        self.service_dao = service_dao or ServiceDao()

    # hecho
    def register_service(self, service_vo):
        try:
            return self.service_dao.insert_service(service_vo)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.register_service: {e}")

    # hecho
    def get_service_owner_id(self, service_id):
        try:
            return self.service_dao.get_employee_by_service_id(service_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.get_service_owner_id: {e}")

    # hecho
    def hire_service(self, client_id, service_id):
        try:
            return self.service_dao.hire_service(client_id, service_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.hire_service: {e}")

    # hecho
    def get_employee_services(self, employee_id):
        try:
            return self.service_dao.get_employee_services(employee_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.get_employee_services: {e}")

    # hecho
    def delete_service(self, service_id):
        try:
            return self.service_dao.delete_service(service_id)
        except Exception as e:
            raise Exception(f"Error in ServiceBusinessObject.delete_service: {e}")
