from model.conexion.Conexion import Conexion
from model.vo.ArchVO import ArchVO

class ArchDao(Conexion):
    def insert(self, user_id: int, vo:ArchVO) -> bool:
        "Inserta un nuevo registro en la tabla archs"
        cursor = self.getCursor()
        sql = """
        INSERT INTO archs (UsrArchID, passport, ss_number, dwell_time,
                           age, first_name, second_name)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        """

        try:
            cursor.execute(sql, [user_id, vo.passport,
                                 vo.ss_number, vo.dwell_time,
                                 vo.age, vo.first_name, vo.second_name])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando arch: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        cursor = self.getCursor()
        try:
            cursor.execute("DELETE FROM archs WHERE UsrArchID = ?", [user_id])
            return cursor.rowcount > 0
        finally:
            cursor.close()
            self.closeConnection()
