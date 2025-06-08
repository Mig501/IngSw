# src/controller/main/ArchManageWorkshopController.py
from PyQt6.QtWidgets import QMessageBox
from model.vo.WorkshopVO import WorkshopVO

class ArchManageWorkshopController:
    def __init__(self, vista, modelo):
        self.vista = vista
        self.modelo = modelo.workshop  # acceso al submodelo del BusinessObject

        # Conectar la acción del botón con el método del controlador
        self.vista.save_button.clicked.disconnect()  # desconectamos el anterior
        self.vista.save_button.clicked.connect(self.guardar_taller)

    def guardar_taller(self):
        """
        Recoge los datos del formulario, los valida, crea el objeto de taller,
        y lo guarda usando el modelo. Notifica a la vista el resultado.
        """
        try:
            # Recoger datos desde la vista
            ws_zip_code = self.vista.input_ws_zip_code.text()
            size_of = float(self.vista.input_size_of.text())
            phone_number = self.vista.input_phone_number.text()
            inv_parking_slot = self.vista.input_inv_parking_slot.text()
            inv_num_pieces = int(self.vista.input_inv_num_pieces.text())
            add_street = self.vista.input_add_street.text()
            add_number = int(self.vista.input_add_number.text())
            add_city = self.vista.input_add_city.text()

            workshop_vo = WorkshopVO(
                ws_zip_code, size_of, phone_number,
                inv_parking_slot, inv_num_pieces,
                add_street, add_number, add_city
            )

            if self.modelo.register_workshop(workshop_vo):
                QMessageBox.information(self.vista, "Éxito", "Taller registrado correctamente.")
                self.vista.clear_fields()
            
            else:
                raise Exception("No se pudo registrar el taller.")

        except Exception as e:
            QMessageBox.critical(self.vista, "Error", str(e))
