from model.conexion.Conexion import Conexion
from model.vo.AdminVO import AdminVO

class AdminDao(Conexion):
    def insert(self, user_id: int, vo:AdminVO) -> bool:
        "Inserta un nuevo admin en la base de datos"
        
        sql = """ INSERT INTO admins (UsrAdminID, passport, ss_number, dwell_time, age, first_name, second_name)
                VALUES (?, ?, ?, ?, ?, ?, ?)"""
        
        cursor = self.getCursor()
        
        try:
            cursor.execute(sql, [user_id, vo.passport, 
                                 vo.ss_number, vo.dwell_time, 
                                 vo.age, vo.first_name, vo.second_name])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando admin: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        cursor = self.getCursor()
        try:
            cursor.execute("DELETE FROM admins WHERE UsrAdminID = ?", [user_id])
            return cursor.rowcount > 0
        finally:
            cursor.close()
            self.closeConnection()
