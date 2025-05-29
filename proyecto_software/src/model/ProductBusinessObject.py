# src/model/ProductBusinessObject.py
from model.dao.ProductDao import ProductDao
from model.dao.ClientDao import ClientDao
from model.vo.ProductVO import ProductVO
from datetime import datetime

class ProductBusinessObject:
    def __init__(self, product_dao=None, client_dao=None):
        self.product_dao = product_dao or ProductDao()
        self.client_dao = client_dao or ClientDao()

    # hecho
    def register_product(self, product_vo:ProductVO):
        ws_zip_code = self.product_dao.get_workshop_zip_code()
        return self.product_dao.insert_product(product_vo, ws_zip_code)

    # hecho
    def delete_product(self, product_id):
        return self.product_dao.delete_product(product_id)

    # hecho
    def get_filtered_cars(self, price_range=None, kilometers_range=None, fuel_type=None,
                          consume_range=None, autonomy_range=None, environmental_label=None,
                          brand=None, model=None, search_text=None):
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

    # hecho
    def get_filtered_others(self, price_range=None, size_range=None, brand=None, model=None):
        return self.product_dao.get_filtered_others(
            price_range=price_range,
            size_range=size_range,
            brand=brand,
            model=model
        )

    # hecho
    def get_client_products(self, client_id):
        return self.product_dao.get_client_products(client_id)

    # hecho
    def get_owner_id(self, product_id):
        return self.product_dao.get_owner_id(product_id)

    # hecho
    def buy_product(self, product_id, client_id):
        owner_id = self.product_dao.get_owner_id(product_id)
        if owner_id is None:
            raise Exception("Product not found or does not have an owner.")
        if owner_id == client_id:
            raise Exception("Cannot buy your own product.")

        price = self.product_dao.get_product_price(product_id)
        buyer_balance = self.client_dao.get_saldo(client_id)
        buyer_num_boughts = self.client_dao.get_num_boughts(client_id)
        if buyer_balance < price:
            raise Exception("Insufficient balance to buy the product.")

        seller_balance = self.client_dao.get_saldo(owner_id)
        seller_num_sold = self.client_dao.get_num_sales(owner_id)

        new_buyer_balance = buyer_balance - price
        new_boughts = buyer_num_boughts + 1
        new_seller_balance = seller_balance + price
        new_sold = seller_num_sold + 1

        self.client_dao.update_client_stats(client_id, 0, new_boughts, new_buyer_balance)
        self.client_dao.update_client_stats(owner_id, new_sold, 0, new_seller_balance)

        date = datetime.now().date().strftime("%Y-%m-%d")
        time = datetime.now().time().strftime("%H:%M:%S")
        return self.product_dao.buy_product(client_id, product_id, date, time)
