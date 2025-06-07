# src/controller/main/AdminManageWorkshopController.py

from PyQt6.QtCore import QObject
from model.vo.WorkshopVO import WorkshopVO
from model.BusinessObject import BusinessObject

class AdminManageWorkshopController(QObject):
    def __init__(self, vista):
        super().__init__()
        self.vista = vista
        self.business_object = BusinessObject().workshop

        self.vista.save_workshop_signal.connect(self.registrar_taller)

    def registrar_taller(self, data: dict):
        try:
            workshop_vo = WorkshopVO(
                data["ws_zip_code"],
                float(data["size_of"]),
                data["phone_number"],
                data["inv_parking_slot"],
                int(data["inv_num_pieces"]),
                data["add_street"],
                int(data["add_number"]),
                data["add_city"]
            )

            if self.business_object.register_workshop(workshop_vo):
                self.vista.show_message("Éxito", "Taller registrado correctamente.")
                self.vista.clear_form()
            else:
                self.vista.show_message("Error", "No se pudo registrar el taller.", is_error=True)

        except Exception as e:
            self.vista.show_message("Error", f"Error al registrar taller:\n{str(e)}", is_error=True)
