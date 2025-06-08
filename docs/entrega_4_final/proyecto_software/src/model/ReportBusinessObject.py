# src/model/ReportBusinessObject.py
from model.dao.ReportDao import ReportDao

class ReportBusinessObject:

    """Clase que maneja la lógica de negocio relacionada con los reportes,
    a través de la consulta a la base de datos de los valores necesarios"""

    def __init__(self, report_dao=None) -> None:

        self.report_dao = report_dao or ReportDao()

    def get_top_buyer(self, start_date:str, end_date:str) -> tuple:
        """Obtiene el cliente que más productos ha comprado en el rango de fechas especificado.
        Args:
            start_date (str): Fecha de inicio en formato 'YYYY-MM-DD'.
            end_date (str): Fecha de fin en formato 'YYYY-MM-DD'.
            
        Returns:
            tuple: Tupla que contiene el ID del cliente y la cantidad total de productos comprados.
        """
        try:
            return self.report_dao.get_top_buyer(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_top_buyer: {e}")

    def get_top_seller(self, start_date:str, end_date:str) -> tuple:
        """Obtiene el cliente que más productos ha vendido en el rango de fechas especificado.
        Args:
            start_date (str): Fecha de inicio en formato 'YYYY-MM-DD'.
            end_date (str): Fecha de fin en formato 'YYYY-MM-DD'.
        
        Returns:
            tuple: Tupla que contiene el ID del vendedor y la cantidad total de productos vendidos.
        """
        try:
            return self.report_dao.get_top_seller(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_top_seller: {e}")

    def get_top_brand(self, start_date:str, end_date:str) -> tuple:
        """Obtiene la marca más vendida en el rango de fechas especificado.
        Args:
            start_date (str): Fecha de inicio en formato 'YYYY-MM-DD'.
            end_date (str): Fecha de fin en formato 'YYYY-MM-DD'.
        
        Returns:
            tuple: Tupla que contiene la marca y la cantidad total de productos vendidos.
        """
        try:
            return self.report_dao.get_top_brand(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_top_brand: {e}")

    def get_daily_sales(self, start_date:str, end_date:str) -> list:
        """Obtiene las ventas diarias en el rango de fechas especificado.
        Args:
            start_date (str): Fecha de inicio en formato 'YYYY-MM-DD'.
            end_date (str): Fecha de fin en formato 'YYYY-MM-DD'.

        Returns:
            list: Lista con las ventas diarias.
        """
        try:
            return self.report_dao.get_daily_sales(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_daily_sales: {e}")

    def get_totals(self, start_date:str, end_date:str) -> int:
        """Obtiene los totales de ventas en el rango de fechas especificado.
        Args:
            start_date (str): Fecha de inicio en formato 'YYYY-MM-DD'.
            end_date (str): Fecha de fin en formato 'YYYY-MM-DD'.

        Returns:
            int: Total de ventas.
        """
        try:
            return self.report_dao.get_totals(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_totals: {e}")

    def get_purchase_date(self, start_date:str, end_date:str) -> list:
        """Obtiene las fechas de compra en el rango de fechas especificado.
        Args:
            start_date (str): Fecha de inicio en formato 'YYYY-MM-DD'.
            end_date (str): Fecha de fin en formato 'YYYY-MM-DD'.

        Returns:
            list: Lista de fechas de compra.
        """
        try:
            return self.report_dao.get_purchase_date(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_purchase_date: {e}")
