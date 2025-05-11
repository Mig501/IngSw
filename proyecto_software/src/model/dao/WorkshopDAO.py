from model.conexion.Conexion import Conexion
from model.vo.WorkshopVO import WorkshopVO

class WorkshopDao(Conexion):
    
    sql_insert = """
            INSERT INTO workshop (WS_zip_code, size_of, phone_number, inv_parking_slot, 
                                  inv_num_pieces, add_street, add_number, add_city)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """

    def insert_workshop(self, workshop_vo: WorkshopVO) -> bool:
        """Inserta un nuevo taller (en caso de que no haya un taller registrado)."""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_insert, [
                workshop_vo.ws_zip_code, workshop_vo.size_of, workshop_vo.phone_number, 
                workshop_vo.inv_parking_slot, workshop_vo.inv_num_pieces, workshop_vo.add_street,
                workshop_vo.add_number, workshop_vo.add_city
            ])
            return cursor.rowcount > 0  # Si la fila fue insertada, el método retorna True
        except Exception as e:
            raise Exception(f"Error insertando el taller: {e}")
        finally:
            cursor.close()
            self.closeConnection()