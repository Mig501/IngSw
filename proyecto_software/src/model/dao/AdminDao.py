#src/model/dao/AdminDao.py
from model.conexion.Conexion import Conexion
from model.vo.AdminVO import AdminVO

class AdminDao(Conexion):
    
    sql_insert = "INSERT INTO admins (UsrAdminID, ArchID, passport, ss_number, dwell_time, age, first_name, second_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
    sql_delete = "DELETE FROM admins WHERE UsrAdminID = ?"
    sql_select_by_user_id = "SELECT AdminID FROM admins WHERE UsrAdminID = ?"
    sql_check_passport_exists = "SELECT COUNT(*) FROM admins WHERE passport = ?"
    sql_check_ss_number_exists = "SELECT COUNT(*) FROM admins WHERE ss_number = ?"
    sql_get_usr_admin_id = "SELECT UsrAdminID FROM admins WHERE AdminID = ?"
    sql_get_all_admins_excluding_actual = """SELECT AdminID FROM admins WHERE AdminID != ?"""

    def reset_autoincrement_if_empty(self) -> None:
        """Función para reiniciar el autoincremento de la tabla admins si no hay registros.
        FUNCIÓN NO UTILIZADA EN LA APLICACIÓN, SÓLO DE TESTING"""
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
            # Validamos duplicados antes de insertar
            cursor.execute(self.sql_check_passport_exists, [vo.passport])
            
            if cursor.fetchone()[0] > 0:
                raise ValueError("Ya existe un admin con ese número de pasaporte.")
            
            cursor.execute(self.sql_check_ss_number_exists, [vo.ss_number])
            
            if cursor.fetchone()[0] > 0:
                raise ValueError("Ya existe un admin con ese número de seguro social.")
            
            # Insertamos el nuevo admin
            cursor.execute(self.sql_insert, [user_id, arch_id, vo.passport, vo.ss_number, 
                                            vo.dwell_time, vo.age, vo.first_name, vo.second_name])
            
            return cursor.rowcount > 0

        except ValueError as e:
            # Lanzamos excepciones de validación, para que el controlador las maneje
            raise e
        
        except Exception as e:
            # Lanzamos excepciones relacionadas con la base de datos, para que el controlador las maneje
            raise Exception(f"Error insertando admin: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        """Elimina un admin de la base de datos dado su ID de usuario"""
        cursor = self.getCursor()

        try:
            # Verificamos si el admin existe
            cursor.execute(self.sql_select_by_user_id, [user_id])

            if cursor.fetchone() is None:
                raise ValueError("No se encontró el admin con ese ID de usuario.")
            
            # Procedemos a eliminar el admin
            cursor.execute(self.sql_delete, [user_id])
            
            return cursor.rowcount > 0

        except ValueError as e:
            # Lanzamos excepciones de validación, para que el controlador las maneje
            raise e
        
        except Exception as e:
            # Lanzamos excepciones relacionadas con la base de datos, para que el controlador las maneje
            raise Exception(f"Error eliminando admin: {e}")

        finally:
            cursor.close()
            self.closeConnection()

    def get_admin_id(self, user_id:int) -> int:
        """Obtiene el ID de un admin dado su ID de usuario"""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_select_by_user_id, [user_id])
            admin_id = cursor.fetchone()
            
            if admin_id is None:
                raise ValueError("No se encontró el ID de admin asociado al usuario.")
            
            return admin_id[0]
        
        except ValueError as e:
            # Lanzamos excepciones de validación, para que el controlador las maneje
            raise e
        
        except Exception as e:
            # Lanzamos excepciones relacionadas con la base de datos, para que el controlador las maneje
            raise Exception(f"Error obteniendo ID de admin: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_usr_admin_id(self, admin_id:int) -> int:
        """Obtiene el ID de un usuario dado su ID de admin"""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_get_usr_admin_id, [admin_id])
            user_id = cursor.fetchone()

            if user_id is None:
                raise ValueError("No se encontró el ID de usuario asociado al admin.")
            
            return user_id[0]

        except ValueError as e:
            # Lanzamos excepciones de validación, para que el controlador las maneje
            raise e
        
        except Exception as e:
            # Lanzamos excepciones relacionadas con la base de datos, para que el controlador las maneje
            raise Exception(f"Error obteniendo ID de admin: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_all_admins_excluding_actual(self, actual_admin_id:int) -> list:
        """Obtiene todos los IDs de admins excepto el actual"""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_get_all_admins_excluding_actual, [actual_admin_id])
            rows = cursor.fetchall()

            return [row[0] for row in rows] if rows else []

        except Exception as e:
            raise Exception(f"Error obteniendo admins: {e}")

        finally:
            cursor.close()
            self.closeConnection()