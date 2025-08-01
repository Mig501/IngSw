# src/controller/ArchRegisterController.py
from model.vo.RegisterUserVO import RegisterUserVO
from model.vo.AdminVO import AdminVO
from model.BusinessObject import BusinessObject
from model.loggerSingleton import LoggerSingleton

class ArchRegisterController():
    def __init__(self, view):
        self.view = view
        self.view.registrar_admin_signal.connect(self.registrar_admin)
        self.bo = BusinessObject().user
        self.logger = LoggerSingleton()

    def registrar_admin(self, datos: dict):
        """
        Recibe los datos del formulario, crea los VO correspondientes, y llama al modelo
        para registrar al nuevo administrador.

        Args:
            datos (dict): Diccionario con los datos del formulario de la vista.
        """
        try:
            user_vo = RegisterUserVO(
                None,
                datos["username"],
                datos["password"],
                datos["email"],
                datos["phone"],
                "admin"
            )

            admin_vo = AdminVO(
                datos["passport"],
                datos["ss_number"],
                int(datos["dwell_time"]),
                int(datos["age"]),
                datos["first_name"],
                datos["second_name"]
            )

            self.bo.registrar_admin(user_vo, admin_vo)
            self.logger.add_log_activity(f"Administrador registrado: {datos['username']} correctamente.")
            self.view.mostrar_mensaje("Éxito", "Administrador registrado correctamente.")
            self.view.limpiar_campos()

        except Exception as e:
            self.view.mostrar_mensaje("Error", str(e), es_error=True)
