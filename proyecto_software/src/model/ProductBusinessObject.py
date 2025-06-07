# src/model/ProductBusinessObject.py
from model.dao.ProductDao import ProductDao
from model.dao.ClientDao import ClientDao
from model.vo.ProductVO import ProductVO
from datetime import datetime

class ProductBusinessObject:

    """Clase que gestiona la lógica de negocio relacionada con los productos,
    incluyendo operaciones como registro, filtrado, compra y eliminación."""

    def __init__(self, product_dao=None, client_dao=None) -> None:
        self.product_dao = product_dao or ProductDao()
        self.client_dao = client_dao or ClientDao()

    def register_product(self, product_vo:ProductVO) -> bool:
        """Registra un nuevo producto en la base de datos.
        Args:
            product_vo (ProductVO): Objeto que contiene la información del producto a registrar.
        
        Returns:
            bool: True si el producto se registra correctamente, False en caso contrario.
            """
        ws_zip_code = self.product_dao.get_workshop_zip_code()
        return self.product_dao.insert_product(product_vo, ws_zip_code)

    def delete_product(self, product_id:int) -> bool:
        """Elimina un producto de la base de datos.
        Args:
            product_id (int): ID del producto a eliminar.
        
        Returns:
            bool: True si el producto se elimina correctamente, False en caso contrario.
        """
        return self.product_dao.delete_product(product_id)

    def get_filtered_cars(self, price_range=None, kilometers_range=None, fuel_type=None,
                          consume_range=None, autonomy_range=None, environmental_label=None,
                          brand=None, model=None, search_text=None) -> list:

        """Obtiene una lista de automóviles filtrados según los criterios especificados.
        Args:
            Variables de filtrado opcionales:
                - price_range (tuple): Rango de precios (min, max).
                - kilometers_range (tuple): Rango de kilómetros (min, max).
                - fuel_type (str): Tipo de combustible (e.g., "Gasolina", "Diésel", "Eléctrico").
                - consume_range (tuple): Rango de consumo (min, max).
                - autonomy_range (tuple): Rango de autonomía (min, max).
                - environmental_label (str): Etiqueta ambiental (e.g., "Cero", "Eco").
                - brand (str): Marca del automóvil.
                - model (str): Modelo del automóvil.
                - search_text (str): Texto de búsqueda para filtrar por nombre o descripción.

        Returns:
            list: Lista de automóviles que cumplen con los criterios de filtrado.
        """
        return self.product_dao.get_filtered_cars(
            price_range=price_range,
            kilometers_range=kilometers_range,
            fuel_type=fuel_type,
            consume_range=consume_range,
            autonomy_range=autonomy_range,
            environmental_label=environmental_label,
            brand=brand,
            model=model,
            search_text=search_text
        )

    def get_filtered_others(self, price_range=None, size_range=None, brand=None, model=None) -> list:
        """Obtiene una lista de otros productos filtrados según los criterios especificados.
        Args:
            Variables de filtrado opcionales:
                - price_range (tuple): Rango de precios (min, max).
                - size_range (tuple): Rango de tamaños (min, max).
                - brand (str): Marca del producto.
                - model (str): Modelo del producto.

        Returns:
            list: Lista de otros productos que cumplen con los criterios de filtrado.
        """
        return self.product_dao.get_filtered_others(
            price_range=price_range,
            size_range=size_range,
            brand=brand,
            model=model
        )

    def get_client_products(self, client_id:int) -> list:
        """Obtiene tpodos los productos asociados a un cliente
        Args:
            client_id (int): ID del cliente cuyos productos se desean obtener.
            
        Returns:
            list: Lista de productos asociados al cliente.
        """
        return self.product_dao.get_client_products(client_id)

    def get_owner_id(self, product_id:int) -> int:
        """Obtiene el ID del propietario de un producto.
        Args:
            product_id (int): ID del producto.
            
        Returns:
            int: ID del propietario del producto, o None si el producto no tiene propietario.
        """
        return self.product_dao.get_owner_id(product_id)

    def buy_product(self, product_id:int, client_id:int) -> bool:
        """Permite a un cliente comprar un producto, actualizando los saldos y estadísticas de compra/venta
        del comprador y vendedor.
        Args:
            product_id (int): ID del producto a comprar.
            client_id (int): ID del cliente que desea comprar el producto.

        Returns:
            bool: True si la compra se realiza correctamente, False en caso contrario.
        """
        owner_id = self.product_dao.get_owner_id(product_id)
        if owner_id is None:
            raise Exception("Product not found or does not have an owner.")
        
        if owner_id == client_id:
            raise Exception("Cannot buy your own product.")

        price = self.product_dao.get_product_price(product_id)
        buyer_balance = self.client_dao.get_saldo(client_id)
        buyer_num_boughts = self.client_dao.get_num_boughts(client_id)
        seller_num_boughts = self.client_dao.get_num_boughts(owner_id)
        buyer_num_sells = self.client_dao.get_num_sales(client_id)

        if buyer_balance < price:
            raise Exception("Insufficient balance to buy the product.")

        seller_balance = self.client_dao.get_saldo(owner_id)
        seller_num_sold = self.client_dao.get_num_sales(owner_id)

        new_buyer_balance = buyer_balance - price
        new_boughts = buyer_num_boughts + 1
        new_seller_balance = seller_balance + price
        new_sold = seller_num_sold + 1


        self.client_dao.update_client_stats(client_id, buyer_num_sells, new_boughts, new_buyer_balance)
        self.client_dao.update_client_stats(owner_id, new_sold, seller_num_boughts, new_seller_balance)

        date = datetime.now().date().strftime("%Y-%m-%d")
        time = datetime.now().time().strftime("%H:%M:%S")
        return self.product_dao.buy_product(client_id, product_id, date, time)
