# src/controller/main/VehicleController.py
from model.BusinessObject import BusinessObject

class VehicleController:
    def __init__(self, vista, user_vo):
        self.vista = vista
        self.user_vo = user_vo
        self.bo = BusinessObject()

        self.vista.search_button.clicked.connect(self.buscar)
        self.vista.reset_button.clicked.connect(self.vista.limpiar_filtros)
        self.vista.filter_combo.currentTextChanged.connect(self.cargar_filtros)
        self.vista.comprar_vehiculo_signal.connect(self.comprar_vehiculo)

    def cargar_filtros(self, filtro):
        """
        Muestra dinámicamente los filtros según la opción seleccionada en el combo.
        """
        if filtro == "Kilómetros":
            self.vista.mostrar_filtros([("Mín. km:", self.vista.min_km), ("Máx. km:", self.vista.max_km)])
        elif filtro == "Consumo":
            self.vista.mostrar_filtros([("Mín. consumo:", self.vista.min_consume), ("Máx. consumo:", self.vista.max_consume)])
        elif filtro == "Autonomía":
            self.vista.mostrar_filtros([("Mín. autonomía:", self.vista.min_autonomy), ("Máx. autonomía:", self.vista.max_autonomy)])
        elif filtro == "Combustible":
            self.vista.mostrar_filtros([("Tipo de combustible:", self.vista.fuel_type)])
        elif filtro == "Etiqueta Medioambiental":
            self.vista.mostrar_filtros([("Etiqueta:", self.vista.env_label)])
        elif filtro == "Precio":
            self.vista.mostrar_filtros([("Mín. precio:", self.vista.min_price), ("Máx. precio:", self.vista.max_price)])
        else:
            self.vista.mostrar_filtros([])

    def buscar(self):
        query = self.vista.search_bar.text().strip()
        brand, model = "", ""

        if query:
            parts = query.split()
            brand = parts[0]
            model = " ".join(parts[1:]) if len(parts) > 1 else ""

        filters = {"brand": brand, "model": model}

        if self.vista.min_km.value() or self.vista.max_km.value():
            filters["kilometers_range"] = (self.vista.min_km.value(), self.vista.max_km.value())
        if self.vista.min_consume.value() or self.vista.max_consume.value():
            filters["consume_range"] = (self.vista.min_consume.value(), self.vista.max_consume.value())
        if self.vista.min_autonomy.value() or self.vista.max_autonomy.value():
            filters["autonomy_range"] = (self.vista.min_autonomy.value(), self.vista.max_autonomy.value())
        if self.vista.fuel_type.currentText():
            filters["fuel_type"] = self.vista.fuel_type.currentText()
        if self.vista.env_label.currentText():
            filters["environmental_label"] = self.vista.env_label.currentText()
        if self.vista.min_price.value() or self.vista.max_price.value():
            filters["price_range"] = (self.vista.min_price.value(), self.vista.max_price.value())

        vehiculos = self.bo.product.get_filtered_cars(**filters)
        client_id = self.bo.user.get_client_id(self.user_vo.user_id)

        if not vehiculos:
            self.vista.car_list.clear()
            self.vista.mostrar_resultado_vacio()
            return

        self.vista.mostrar_vehiculos(vehiculos, self.bo.product.get_owner_id, client_id)

    def comprar_vehiculo(self, product_id: int):
        if not self.vista.confirmar_accion("Confirmar compra", "¿Estás seguro de que quieres comprar este vehículo?"):
            return

        client_id = self.bo.user.get_client_id(self.user_vo.user_id)
        owner = self.bo.product.get_owner_id(product_id)

        if client_id is None or owner is None:
            self.vista.mostrar_mensaje("Error", "Error interno al validar la compra.", es_error=True)
            return

        if client_id == owner:
            self.vista.mostrar_mensaje("Error", "No puedes comprar tu propio coche.", es_error=True)
            return

        try:
            success = self.bo.product.buy_product(product_id, client_id)
            if success:
                self.vista.mostrar_mensaje("Compra exitosa", "Has comprado el vehículo con éxito.")
                self.buscar()
            else:
                self.vista.mostrar_mensaje("Error", "No se ha podido completar la compra.", es_error=True)
        except Exception as e:
            if "Saldo insuficiente" in str(e):
                self.vista.mostrar_mensaje("Saldo insuficiente", "No tienes suficiente saldo para comprar este vehículo.")
            else:
                self.vista.mostrar_mensaje("Error", f"Error inesperado:\n{e}", es_error=True)
