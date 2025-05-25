from model.conexion.Conexion import Conexion

class ReportDao(Conexion):

    sql_get_purchases = """
                SELECT pp.Purchase_date, pp.ClientID, up.ProductID, up.brand
                FROM product_purchase pp
                JOIN user_products up ON pp.ProductID = up.ProductID
                WHERE pp.Purchase_date BETWEEN ? AND ?
            """
    sql_top_buyer = """
                SELECT ClientID, COUNT(*) AS total
                FROM product_purchase
                WHERE Purchase_date BETWEEN ? AND ?
                GROUP BY ClientID
                ORDER BY total DESC
                LIMIT 1
            """
    sql_top_seller = """
                SELECT up.ClientID, COUNT(*) AS total
                FROM user_products up
                JOIN product_purchase pp ON up.ProductID = pp.ProductID
                WHERE pp.Purchase_date BETWEEN ? AND ?
                GROUP BY up.ClientID
                ORDER BY total DESC
                LIMIT 1
            """
    sql_top_brand = """
                SELECT up.brand, COUNT(*) AS total
                FROM product_purchase pp
                JOIN user_products up ON pp.ProductID = up.ProductID
                WHERE pp.Purchase_date BETWEEN ? AND ?
                GROUP BY up.brand
                ORDER BY total DESC
                LIMIT 1
            """
    sql_get_daily_sales = """
                SELECT Purchase_date, COUNT(*) AS total
                FROM product_purchase
                WHERE Purchase_date BETWEEN ? AND ?
                GROUP BY Purchase_date
                ORDER BY Purchase_date
            """
    sql_get_total_buy_sales = """
                SELECT COUNT(*) AS total_ventas
                FROM user_products up
                JOIN product_purchase pp ON up.ProductID = pp.ProductID
                WHERE pp.Purchase_date BETWEEN ? AND ?
            """

    def get_purchase_date(self, start_date:str, end_date:str):
        """
        Obtiene las compras realizadas entre dos fechas.
        :param start_date: Fecha de inicio en formato 'YYYY-MM-DD'.
        :param end_date: Fecha de fin en formato 'YYYY-MM-DD'.
        :return: Lista de compras realizadas entre las fechas especificadas.
        """
        try:
            cursor = self.getCursor()
            cursor.execute(self.sql_get_purchases, (start_date, end_date))
            purchases = cursor.fetchall()
            
            if not purchases:
                raise ValueError("No se encontraron compras entre las fechas especificadas.")

            return purchases
        
        except ValueError as e:
            raise e

        except Exception as e:
            raise e
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_top_buyer(self, start_date:str, end_date:str):
        """
        Obtiene el cliente que más ha comprado entre dos fechas.
        :param start_date: Fecha de inicio en formato 'YYYY-MM-DD'.
        :param end_date: Fecha de fin en formato 'YYYY-MM-DD'.
        :return: Cliente que más ha comprado entre las fechas especificadas.
        """
        try:
            cursor = self.getCursor()
            cursor.execute(self.sql_top_buyer, (start_date, end_date))
            top_buyer = cursor.fetchone()
            
            if not top_buyer:
                raise ValueError("No se encontró ningún cliente que haya comprado entre las fechas especificadas.")
            
            return top_buyer
        
        except ValueError as e:
            raise e

        except Exception as e:
            raise e
        
        finally:
            cursor.close()
            self.closeConnection()
    
    def get_top_seller(self, start_date:str, end_date:str):
        """
        Obtiene el vendedor que más ha vendido entre dos fechas.
        :param start_date: Fecha de inicio en formato 'YYYY-MM-DD'.
        :param end_date: Fecha de fin en formato 'YYYY-MM-DD'.
        :return: Vendedor que más ha vendido entre las fechas especificadas.
        """
        try:
            cursor = self.getCursor()
            cursor.execute(self.sql_top_seller, (start_date, end_date))
            top_seller = cursor.fetchone()

            if not top_seller:
                raise ValueError("No se encontró ningún vendedor que haya vendido entre las fechas especificadas.")
            
            return top_seller
        
        except ValueError as e:
            raise e

        except Exception as e:
            raise e
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_top_brand(self, start_date:str, end_date:str):
        """
        Obtiene la marca más vendida entre dos fechas.
        :param start_date: Fecha de inicio en formato 'YYYY-MM-DD'.
        :param end_date: Fecha de fin en formato 'YYYY-MM-DD'.
        :return: Marca más vendida entre las fechas especificadas.
        """
        try:
            cursor = self.getCursor()
            cursor.execute(self.sql_top_brand, (start_date, end_date))
            top_brand = cursor.fetchone()
            
            if not top_brand:
                raise ValueError("No se encontró ninguna marca vendida entre las fechas especificadas.")

            return top_brand
        
        except ValueError as e:
            raise e

        except Exception as e:
            raise e

        finally:
            cursor.close()
            self.closeConnection()

    def get_daily_sales(self, start_date:str, end_date:str):
        """
        Obtiene las ventas diarias entre dos fechas.
        :param start_date: Fecha de inicio en formato 'YYYY-MM-DD'.
        :param end_date: Fecha de fin en formato 'YYYY-MM-DD'.
        :return: Ventas diarias entre las fechas especificadas.
        """
        try:
            cursor = self.getCursor()
            cursor.execute(self.sql_get_daily_sales, (start_date, end_date))
            daily_sales = cursor.fetchall()
            
            if not daily_sales:
                raise ValueError("No se encontraron ventas diarias entre las fechas especificadas.")

            return daily_sales
        
        except ValueError as e:
            raise e
        
        except Exception as e:
            raise e

        finally:
            cursor.close()
            self.closeConnection()

    def get_totals(self, start_date:str, end_date:str):
        """
        Obtiene el total de compra-ventas entre dos fechas.
        :param start_date: Fecha de inicio en formato 'YYYY-MM-DD'.
        :param end_date: Fecha de fin en formato 'YYYY-MM-DD'.
        :return: Total de compra-ventas entre las fechas especificadas.
        """
        try:
            cursor = self.getCursor()
            cursor.execute(self.sql_get_total_buy_sales, (start_date, end_date))
            total_buys_sales = cursor.fetchone()[0]
            
            if not total_buys_sales:
                raise ValueError("No se encontraron compras-ventas entre las fechas especificadas.")

            return total_buys_sales

        except ValueError as e:
            raise e

        except Exception as e:
            raise e

        finally:
            cursor.close()
            self.closeConnection()