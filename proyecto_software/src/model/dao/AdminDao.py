from model.conexion.Conexion import Conexion
from model.vo.AdminVO import AdminVO

class AdminDao(Conexion):
    
    sql_insert = "INSERT INTO admins (UsrAdminID, passport, ss_number, dwell_time, age, first_name, second_name) VALUES (?, ?, ?, ?, ?, ?, ?)"
    sql_delete = "DELETE FROM admins WHERE UsrAdminID = ?"

    def insert(self, user_id: int, vo:AdminVO) -> bool:
        "Inserta un nuevo admin en la base de datos"
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_insert, [user_id, vo.passport, 
                                 vo.ss_number, vo.dwell_time, 
                                 vo.age, vo.first_name, vo.second_name])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando admin: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        """Elimina un admin de la base de datos dado su ID de usuario."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_delete, [user_id])
            return cursor.rowcount > 0
        
        finally:
            cursor.close()
            self.closeConnection()
