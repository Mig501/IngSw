from model.BusinessObject import BusinessObject
from model.vo.ServiceVO import ServiceVO
from model.loggerSingleton import LoggerSingleton

class ServiceRegisterController:
    def __init__(self, vista, user_id):
        self.vista = vista
        self.user_id = user_id
        self.bo = BusinessObject().service
        self.user_bo = BusinessObject().user
        self.logger = LoggerSingleton()

        self.employee_id = self.user_bo.get_employee_id_from_user_id(user_id)
        self.vista.registrar_servicio_signal.connect(self.registrar_servicio)

    def registrar_servicio(self, datos):
        try:
            price = float(datos["price"])
            name = datos["name"].lower()
            description = datos["description"]
            tipo = datos["type"]

            if not name:
                self.vista.show_message("Error", "El nombre es obligatorio.", is_error=True)
                return

            service_vo = ServiceVO(
                None,
                self.employee_id,
                price,
                name,
                description
            )

            if self.bo.register_service(service_vo):
                self.logger.add_log_activity(f"Servicio '{name}' registrado por empleado {self.employee_id}.")
                self.vista.show_message("Éxito", "Servicio registrado correctamente.")
                self.vista.clear_fields()
            else:
                self.vista.show_message("Error", "No se pudo registrar el servicio.", is_error=True)

        except ValueError:
            self.vista.show_message("Error", "El precio debe ser un número válido.", is_error=True)
        except Exception as e:
            self.vista.show_message("Error", str(e), is_error=True)
