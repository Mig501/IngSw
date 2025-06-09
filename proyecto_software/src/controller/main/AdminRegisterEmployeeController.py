# src/controller/main/AdminRegisterEmployeeController.py
from model.vo.RegisterUserVO import RegisterUserVO
from model.vo.EmployeeVO import EmployeeVO
from model.BusinessObject import BusinessObject
from model.loggerSingleton import LoggerSingleton

class AdminRegisterEmployeeController:
    def __init__(self, vista, user_id):
        self.vista = vista
        self.user_id = user_id
        self.bo = BusinessObject().user
        self.logger = LoggerSingleton()
        self.admin_id = self.bo.get_admin_id_by_user_id(user_id)

        self.vista.registrar_empleado_signal.connect(self.registrar_empleado)

    def registrar_empleado(self, datos):
        """
        Procesa el registro de un nuevo empleado a partir de los datos proporcionados por la vista.
        Args:
            datos (dict): Diccionario con los datos del formulario de la vista.
        """
        try:
            user_vo = RegisterUserVO(
                user_id=None,
                username=datos["username"],
                userpassword=datos["password"],
                email=datos["email"],
                phone=datos["phone"],
                rol="empleado"
            )

            employee_vo = EmployeeVO(
                passport=datos["passport"],
                ss_number=datos["ss"],
                dwell_time=int(datos["dwell"]),
                age=int(datos["age"]),
                specialization=datos["specialization"],
                first_name=datos["first_name"],
                second_name=datos["second_name"]
            )

            self.bo.registrar_empleado(user_vo, employee_vo, self.admin_id)
            self.logger.add_log_activity(f"Empleado registrado: {user_vo.username} por Admin {self.admin_id}")

            self.vista.mostrar_mensaje("Éxito", "Empleado registrado correctamente.")
            self.vista.limpiar_campos()

        except Exception as e:
            self.vista.mostrar_mensaje("Error", str(e), error=True)
