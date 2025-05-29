#src/model/dao/AdminDao.py
from model.conexion.Conexion import Conexion
from model.vo.ArchVO import ArchVO

class ArchDao(Conexion):
    
    sql_insert = "INSERT INTO archs (UsrArchID, passport, ss_number, dwell_time, age, first_name, second_name) VALUES (?, ?, ?, ?, ?, ?, ?)"
    sql_delete = "DELETE FROM archs WHERE UsrArchID = ?"
    sql_check_passport_exists = "SELECT COUNT(*) FROM archs WHERE passport = ?"
    sql_check_ss_number_exists = "SELECT COUNT(*) FROM archs WHERE ss_number = ?"

    def insert(self, user_id: int, vo:ArchVO) -> bool:
        "Inserta un nuevo usuario en la tabla archs"
        cursor = self.getCursor()

        try:
            # Verificar si el pasaporte ya existe
            cursor.execute(self.sql_check_passport_exists, [vo.passport])

            if cursor.fetchone()[0] > 0:
                raise ValueError("El pasaporte ya existe en la base de datos.")
            
            # Verificar si el número de seguro social ya existe
            cursor.execute(self.sql_check_ss_number_exists, [vo.ss_number])
            if cursor.fetchone()[0] > 0:
                raise ValueError("El número de seguro social ya existe en la base de datos.")

            # Insertar el nuevo arch
            cursor.execute(self.sql_insert, [user_id, vo.passport,
                                 vo.ss_number, vo.dwell_time,
                                 vo.age, vo.first_name, vo.second_name])
        
            return cursor.rowcount > 0
    
        except ValueError as e:
            # Lanzamos excecpciones de validación, para que el controlador las maneje
            raise e
        
        except Exception as e:
            # Lanzamos excepciones generales, para que el controlador las maneje
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
