# src/controller/main/OtherScreenController.py
from PyQt6.QtWidgets import QMessageBox
from model.BusinessObject import BusinessObject

class OtherScreenController:
    def __init__(self, vista, user_vo):
        self.vista = vista
        self.user_vo = user_vo
        self.bo = BusinessObject()

        self.vista.buscar_signal.connect(self.buscar)
        self.vista.comprar_signal.connect(self.comprar)

    def buscar(self, marca, modelo, filtros):
        """
        Realiza la búsqueda de productos del tipo 'otros' con filtros aplicados.

        Args:
            marca (str): Marca del producto.
            modelo (str): Modelo del producto.
            filtros (dict): Diccionario con los filtros adicionales seleccionados.
        """
        filtros["brand"] = marca
        filtros["model"] = modelo

        try:
            resultados = self.bo.product.get_filtered_others(**filtros)
            client_id = self.bo.user.get_client_id(self.user_vo.user_id)
            self.vista.mostrar_resultados(resultados, client_id, self.bo.product.get_owner_id)
        
        except Exception as e:
            self.vista.mostrar_mensaje("Error", f"Error al buscar productos:\n{e}", critico=True)

    def comprar(self, product_id):
        """
        Gestiona la lógica de compra de un producto por parte del cliente.

        Args:
            product_id (int): ID del producto seleccionado para compra.
        """
        confirm = QMessageBox.question(self.vista, "Confirmar compra", "¿Deseas comprar este producto?",
                                       QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No)
        if confirm != QMessageBox.StandardButton.Yes:
            return

        client_id = self.bo.user.get_client_id(self.user_vo.user_id)
        owner = self.bo.product.get_owner_id(product_id)

        if owner == client_id:
            self.vista.mostrar_mensaje("Error", "No puedes comprar tu propio producto.", critico=True)
            return

        try:
            success = self.bo.product.buy_product(product_id, client_id)
            if success:
                self.vista.mostrar_mensaje("Compra exitosa", "Has comprado el producto con éxito.")
                self.vista.emitir_busqueda()
            
            else:
                self.vista.mostrar_mensaje("Error", "No se pudo completar la compra.", critico=True)
        
        except Exception as e:
            if "Saldo insuficiente" in str(e):
                self.vista.mostrar_mensaje("Saldo insuficiente", "No tienes saldo suficiente.")
        
            else:
                self.vista.mostrar_mensaje("Error", f"Error inesperado:\n{e}", critico=True)
