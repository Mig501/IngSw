#src/controller/main/VehicleController.py
from PyQt6.QtWidgets import QMessageBox
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

        self.init_widgets_filtros()

    def init_widgets_filtros(self):
        """
        Inicializa los widgets de filtro utilizados dinámicamente por la vista.
        """
        from PyQt6.QtWidgets import QSpinBox, QComboBox

        self.min_km, self.max_km = QSpinBox(), QSpinBox()
        self.min_km.setRange(0, 1_000_000)
        self.max_km.setRange(0, 1_000_000)

        self.min_consume, self.max_consume = QSpinBox(), QSpinBox()
        self.min_consume.setRange(0, 100)
        self.max_consume.setRange(0, 100)

        self.min_autonomy, self.max_autonomy = QSpinBox(), QSpinBox()
        self.min_autonomy.setRange(0, 2000)
        self.max_autonomy.setRange(0, 2000)

        self.fuel_type = QComboBox()
        self.fuel_type.addItems(["", "Gasolina", "Diésel", "Eléctrico", "Híbrido"])

        self.env_label = QComboBox()
        self.env_label.addItems(["", "0", "ECO", "B", "C"])

        self.min_price, self.max_price = QSpinBox(), QSpinBox()
        self.min_price.setRange(0, 1_000_000_000)
        self.max_price.setRange(0, 1_000_000_000)

    def cargar_filtros(self, filtro):
        """
        Muestra dinámicamente los filtros según la opción seleccionada en el combo.

        Args:
            filtro (str): Opción seleccionada ("Kilómetros", "Consumo", etc.)
        """
        if filtro == "Kilómetros":
            self.vista.mostrar_filtros([("Mín. km:", self.min_km), ("Máx. km:", self.max_km)])
        
        elif filtro == "Consumo":
            self.vista.mostrar_filtros([("Mín. consumo:", self.min_consume), ("Máx. consumo:", self.max_consume)])
        
        elif filtro == "Autonomía":
            self.vista.mostrar_filtros([("Mín. autonomía:", self.min_autonomy), ("Máx. autonomía:", self.max_autonomy)])
        
        elif filtro == "Combustible":
            self.vista.mostrar_filtros([("Tipo de combustible:", self.fuel_type)])
        
        elif filtro == "Etiqueta Medioambiental":
            self.vista.mostrar_filtros([("Etiqueta:", self.env_label)])
        
        elif filtro == "Precio":
            self.vista.mostrar_filtros([("Mín. precio:", self.min_price), ("Máx. precio:", self.max_price)])
        
        else:
            self.vista.mostrar_filtros([])

    def buscar(self):
        """
        Realiza una búsqueda de vehículos aplicando marca, modelo y los filtros seleccionados.
        """
        query = self.vista.search_bar.text().strip()
        brand, model = "", ""
        
        if query:
            parts = query.split()
            brand = parts[0]
            model = " ".join(parts[1:]) if len(parts) > 1 else ""

        filters = {"brand": brand, "model": model}

        if self.min_km.value() or self.max_km.value(): filters["kilometers_range"] = (self.min_km.value(), self.max_km.value())
        if self.min_consume.value() or self.max_consume.value(): filters["consume_range"] = (self.min_consume.value(), self.max_consume.value())
        if self.min_autonomy.value() or self.max_autonomy.value(): filters["autonomy_range"] = (self.min_autonomy.value(), self.max_autonomy.value())
        if self.fuel_type.currentText(): filters["fuel_type"] = self.fuel_type.currentText()
        if self.env_label.currentText(): filters["environmental_label"] = self.env_label.currentText()
        if self.min_price.value() or self.max_price.value(): filters["price_range"] = (self.min_price.value(), self.max_price.value())

        vehiculos = self.bo.product.get_filtered_cars(**filters)
        client_id = self.bo.user.get_client_id(self.user_vo.user_id)

        if not vehiculos:
            self.vista.car_list.clear()
            self.vista.mostrar_resultado_vacio()
            return

        self.vista.mostrar_vehiculos(vehiculos, self.bo.product.get_owner_id, client_id)

    def comprar_vehiculo(self, product_id: int):
        """
        Gestiona el proceso de compra de un vehículo por parte del cliente.

        Args:
            product_id (int): ID del producto seleccionado.
        """
        confirm = QMessageBox.question(self.vista, "Confirmar compra", "¿Estás seguro de que quieres comprar este vehículo?",
                                       QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No)

        if confirm != QMessageBox.StandardButton.Yes:
            return

        client_id = self.bo.user.get_client_id(self.user_vo.user_id)
        owner = self.bo.product.get_owner_id(product_id)

        if client_id is None or owner is None:
            QMessageBox.critical(self.vista, "Error", "Error interno al validar la compra.")
            return

        if client_id == owner:
            QMessageBox.critical(self.vista, "Error", "No puedes comprar tu propio coche.")
            return

        try:
            success = self.bo.product.buy_product(product_id, client_id)
            
            if success:
                QMessageBox.information(self.vista, "Compra exitosa", "Has comprado el vehículo con éxito.")
                self.buscar()
            else:
                QMessageBox.critical(self.vista, "Error", "No se ha podido completar la compra.")
        except Exception as e:
            if "Saldo insuficiente" in str(e):
                QMessageBox.warning(self.vista, "Saldo insuficiente", "No tienes suficiente saldo para comprar este vehículo.")
            
            else:
                QMessageBox.critical(self.vista, "Error", f"Error inesperado:\n{e}")
