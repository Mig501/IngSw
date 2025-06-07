# src/controller/main/ServiceScreenController.py

from PyQt6.QtWidgets import QMessageBox
from model.BusinessObject import BusinessObject

class ServiceScreenController:
    def __init__(self, vista, user_vo):
        self.vista = vista
        self.user_vo = user_vo
        self.bo = BusinessObject().service
        self.bo_user = BusinessObject().user

        self.vista.buscar_servicios_signal.connect(self.buscar_servicios)
        self.vista.eliminar_filtros_signal.connect(self.vista.resetear_vista)
        self.vista.contratar_servicio_signal.connect(self.contratar_servicio)

    def buscar_servicios(self, query, min_price, max_price):
        """
        Realiza una búsqueda de servicios filtrando por nombre y rango de precios.

        Args:
            query (str): Texto de búsqueda.
            min_price (int): Precio mínimo.
            max_price (int): Precio máximo.
        """
                
        filtros = {}

        if query:
            filtros["name"] = query

        if min_price != 0 or max_price != 0:
            filtros["price_range"] = (min_price, max_price)

        try:
            resultados = self.bo.get_filtered_services(**filtros)
            client_id = self.bo_user.get_client_id(self.user_vo.user_id)
            self.vista.mostrar_resultados(resultados, client_id, self.bo.get_service_owner_id)
        
        except Exception as e:
            QMessageBox.critical(self.vista, "Error", f"Error al buscar servicios:\n{str(e)}")

    def contratar_servicio(self, service_id):
        """
        Realiza la contratación de un servicio.

        Args:
            service_id (int): ID del servicio a contratar.
        """

        confirm = QMessageBox.question(self.vista, "Confirmar compra",
            "¿Estás seguro de que quieres contratar este servicio?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No
        )
        if confirm != QMessageBox.StandardButton.Yes:
            return

        try:
            client_id = self.bo_user.get_client_id(self.user_vo.user_id)
            success = self.bo.hire_service(client_id, service_id)
            
            if success:
                QMessageBox.information(self.vista, "Éxito", "Servicio contratado con éxito.")
                self.buscar_servicios(self.vista.search_bar.text().strip(), self.vista.min_price.value(), self.vista.max_price.value())
            
            else:
                QMessageBox.warning(self.vista, "Error", "No se pudo contratar el servicio.")
        
        except Exception as e:
            if "saldo insuficiente" in str(e):
                QMessageBox.warning(self.vista, "Error", "No tienes suficiente saldo para contratar este servicio.")
            else:
                QMessageBox.critical(self.vista, "Error", f"Error inesperado:\n{e}")
