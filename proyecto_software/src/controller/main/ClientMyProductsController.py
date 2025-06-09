# src/controller/main/ClientMyProductsController.py
from model.BusinessObject import BusinessObject

class ClientMyProductsController:
    def __init__(self, vista, user_id):
        self.vista = vista
        self.user_id = user_id
        self.bo = BusinessObject().product
        self.client_id = BusinessObject().user.get_client_id(user_id)

        # Conectar señales
        self.vista.refresh_products_signal.connect(self.load_products)
        self.vista.delete_product_signal.connect(self.delete_product)

        # Cargar productos al iniciar
        self.load_products()

    def load_products(self):
        """
        Carga todos los productos del cliente actual y se los pasa a la vista.
        """
        try:
            productos = self.bo.get_client_products(self.client_id)
            self.vista.populate_products(productos)
        
        except Exception as e:
            self.vista.show_message("Error", f"No se pudieron cargar los productos:\n{e}", error=True)

    def delete_product(self, product_id):
        """
        Elimina un producto del cliente y recarga la lista.

        Args:
            product_id (int): ID del producto a eliminar.
        """
        try:
            success = self.bo.delete_product(product_id)
            if success:
                self.vista.show_message("Éxito", "Producto eliminado correctamente.")
                self.load_products()
        
            else:
                self.vista.show_message("Error", "No se pudo eliminar el producto.", error=True)
        
        except Exception as e:
            self.vista.show_message("Error", f"Error inesperado al eliminar:\n{e}", error=True)
