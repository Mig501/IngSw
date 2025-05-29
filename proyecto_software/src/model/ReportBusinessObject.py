# src/model/ReportBusinessObject.py
from model.dao.ReportDao import ReportDao

class ReportBusinessObject:
    def __init__(self, report_dao=None):
        self.report_dao = report_dao or ReportDao()

    # hecho
    def get_top_buyer(self, start_date, end_date):
        try:
            return self.report_dao.get_top_buyer(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_top_buyer: {e}")

    # hecho
    def get_top_seller(self, start_date, end_date):
        try:
            return self.report_dao.get_top_seller(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_top_seller: {e}")

    # hecho
    def get_top_brand(self, start_date, end_date):
        try:
            return self.report_dao.get_top_brand(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_top_brand: {e}")

    # hecho
    def get_daily_sales(self, start_date, end_date):
        try:
            return self.report_dao.get_daily_sales(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_daily_sales: {e}")

    # hecho
    def get_totals(self, start_date, end_date):
        try:
            return self.report_dao.get_totals(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_totals: {e}")

    # hecho
    def get_purchase_date(self, start_date, end_date):
        try:
            return self.report_dao.get_purchase_date(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in ReportBusinessObject.get_purchase_date: {e}")
