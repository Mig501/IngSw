from model.conexion.Conexion import Conexion
from model.vo.AdminVO import AdminVO

class AdminDao(Conexion):
    
    sql_insert = "INSERT INTO admins (UsrAdminID, ArchID, passport, ss_number, dwell_time, age, first_name, second_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
    sql_delete = "DELETE FROM admins WHERE UsrAdminID = ?"
    sql_select_admin_id = "SELECT ArchID FROM admins WHERE UsrAdminID = ?"
<<<<<<< HEAD
=======
    
>>>>>>> 7ef000121dd7a6e1149c09df020b5ce1a5d8c3c2
    sql_select_by_user_id = "SELECT AdminID FROM admins WHERE UsrAdminID = ?"

    def reset_autoincrement_if_empty(self):
        """Esta función es solo para hacer pruebas nosotros"""
        cursor = self.getCursor()

        try:
            cursor.execute("SELECT COUNT(*) FROM admins")
            count = cursor.fetchone()[0]

            if count == 0:  # Si no hay registros en la tabla, reiniciamos el autoincremento
                cursor.execute("ALTER TABLE admins AUTO_INCREMENT = 1")
 
        finally:
            cursor.close()
            self.closeConnection()


    def insert(self, user_id:int, vo: AdminVO, arch_id:int=1) -> bool:
        """Inserta un nuevo admin en la base de datos usando los datos del AdminVO."""
        cursor = self.getCursor()
        
        try:
            
            cursor.execute(self.sql_insert, [user_id, arch_id, vo.passport, vo.ss_number, 
                                            vo.dwell_time, vo.age, vo.first_name, vo.second_name])
            
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando admin: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        """Elimina un admin de la base de datos dado su ID de usuario"""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_delete, [user_id])
            return cursor.rowcount > 0

        finally:
            cursor.close()
            self.closeConnection()

    def get_admin_id_from_user_id(self, user_id: int) -> int:
        """Devuelve el ID del admin dado su ID de usuario"""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_select_admin_id, [user_id])
            result = cursor.fetchone()
            return result[0] if result else None
        
        finally:
            cursor.close()
            self.closeConnection()

<<<<<<< HEAD
        finally:
            cursor.close()
            self.closeConnection()


=======
>>>>>>> 7ef000121dd7a6e1149c09df020b5ce1a5d8c3c2
    def get_admin_id(self, user_id:int) -> int:
        """Obtiene el ID de un admin dado su ID de usuario"""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_select_by_user_id, [user_id])
            admin_id = cursor.fetchone()
            
            if admin_id is None:
                raise Exception("No se encontró el ID de admin asociado al usuario.")
            
            return admin_id[0]
        
        finally:
            cursor.close()
            self.closeConnection()