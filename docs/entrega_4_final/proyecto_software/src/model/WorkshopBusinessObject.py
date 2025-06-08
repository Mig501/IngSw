# src/model/WorkshopBusinessObject.py
from model.dao.WorkshopDAO import WorkshopDao
from model.vo.WorkshopVO import WorkshopVO

class WorkshopBusinessObject:

    """Clase que maneja la lógica de negocio relacionada con los talleres,
    realizando la operación de inserción de un taller a través de la DAO correspondiente."""

    def __init__(self, workshop_dao=None) -> None:
        self.workshop_dao = workshop_dao or WorkshopDao()

    def register_workshop(self, workshop_vo:WorkshopVO) -> bool:
        """Registra un nuevo taller en la base de datos.
        Args:
            workshop_vo (WorkshopVO): Objeto de valor que contiene la información del taller a registrar.
            
        Returns:
            bool: True si el taller se registró correctamente, False en caso contrario."""
        try:
            return self.workshop_dao.insert_workshop(workshop_vo)
        except Exception as e:
            raise Exception(f"Error in WorkshopBusinessObject.register_workshop: {e}")
