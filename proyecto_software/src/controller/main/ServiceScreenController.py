# src/controller/main/ServiceScreenController.py
from model.BusinessObject import BusinessObject

class ServiceScreenController:
    def __init__(self, vista, user_vo):
        self.vista = vista
        self.user_vo = user_vo

        self.bo = BusinessObject().service
        self.bo_user = BusinessObject().user

        # Conectar señales
        self.vista.buscar_servicios_signal.connect(self.buscar_servicios)
        self.vista.eliminar_filtros_signal.connect(self.vista.resetear_vista)
        self.vista.contratar_servicio_signal.connect(self.contratar_servicio)

        # Inicializar filtros si hace falta
        self.init_filtros()

    def init_filtros(self):
        """Carga los widgets de filtro al seleccionar un tipo de filtro."""
        self.vista.filter_combo.currentTextChanged.connect(self.cargar_filtros)
        self.cargar_filtros(self.vista.filter_combo.currentText())

    def cargar_filtros(self, filtro):
        if filtro == "Precio":
            self.vista.mostrar_filtros([
                ("Mín. precio:", self.vista.min_price),
                ("Máx. precio:", self.vista.max_price),
            ])
        else:
            self.vista.limpiar_filtros()

    def buscar_servicios(self):
        """Obtiene los servicios filtrados por nombre y/o precio."""
        query = self.vista.search_bar.text().strip()
        min_price = self.vista.min_price.value()
        max_price = self.vista.max_price.value()

        filtros = {}

        if query:
            filtros["name"] = query

        if min_price != 0 or max_price != 0:
            filtros["price_range"] = (min_price, max_price)

        try:
            resultados = self.bo.get_filtered_services(**filtros)
            client_id = self.bo_user.get_client_id(self.user_vo.user_id)

            if resultados:
                self.vista.mostrar_servicios(resultados, self.bo.get_service_owner_id, client_id)
            else:
                self.vista.mostrar_resultado_vacio()

        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"Error al buscar servicios:\n{str(e)}", error=True)
    
    def contratar_servicio(self, service_id):
        """Contrata un servicio para el cliente actual."""
        try:
            client_id = self.bo_user.get_client_id(self.user_vo.user_id)
            success = self.bo.hire_service(client_id, service_id)

            if success:
                self.vista.mostrar_mensaje("Éxito", "Servicio contratado con éxito.")
                self.buscar_servicios()
            
            else:
                self.vista.mostrar_mensaje("Error", "No se pudo contratar el servicio.", error=True)

        except Exception as e:
            if "saldo insuficiente" in str(e).lower():
                self.vista.mostrar_mensaje("Saldo insuficiente", "No tienes suficiente saldo para contratar este servicio.")
            else:
                self.vista.mostrar_mensaje("Error", f"Error inesperado:\n{str(e)}", error=True)
