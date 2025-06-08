# src/model/BusinessObject.py
from model.ProductBusinessObject import ProductBusinessObject
from model.UserBusinessObject import UserBusinessObject
from model.ServiceBusinessObject import ServiceBusinessObject
from model.WorkshopBusinessObject import WorkshopBusinessObject
from model.ReportBusinessObject import ReportBusinessObject

class BusinessObject:

    """Clase fachada que agrupa los diferentes Business Objects para facilitar su uso."""

    def __init__(self) -> None:
        self.product = ProductBusinessObject() # Lógica para los productos
        self.user = UserBusinessObject() # Lógica para los usuarios
        self.service = ServiceBusinessObject() # Lógica para los servicios
        self.workshop = WorkshopBusinessObject() # Lógica para los talleres
        self.report = ReportBusinessObject() # Lógica para los reportes
