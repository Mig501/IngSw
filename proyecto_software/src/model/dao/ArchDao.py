from model.conexion.Conexion import Conexion
from model.vo.ArchVO import ArchVO

class ArchDao(Conexion):
    
    sql_insert = "INSERT INTO archs (UsrArchID, passport, ss_number, dwell_time, age, first_name, second_name) VALUES (?, ?, ?, ?, ?, ?, ?)"
    sql_delete = "DELETE FROM archs WHERE UsrArchID = ?"

    def insert(self, user_id: int, vo:ArchVO) -> bool:
        "Inserta un nuevo usuari en la tabla archs"
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_insert, [user_id, vo.passport,
                                 vo.ss_number, vo.dwell_time,
                                 vo.age, vo.first_name, vo.second_name])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando arch: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        """Elimina el arch de la tabla archs por su ID de usuario."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_delete, [user_id])
            return cursor.rowcount > 0
        
        finally:
            cursor.close()
            self.closeConnection()
