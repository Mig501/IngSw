# src/model/WorkshopBusinessObject.py
from model.dao.WorkshopDAO import WorkshopDao

class WorkshopBusinessObject:
    def __init__(self, workshop_dao=None):
        self.workshop_dao = workshop_dao or WorkshopDao()

    def register_workshop(self, workshop_vo):
        try:
            return self.workshop_dao.insert_workshop(workshop_vo)
        except Exception as e:
            raise Exception(f"Error in WorkshopBusinessObject.register_workshop: {e}")
