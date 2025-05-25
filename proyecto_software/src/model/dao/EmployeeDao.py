from model.conexion.Conexion import Conexion
from model.vo.EmployeeVO import EmployeeVO

class EmployeeDao(Conexion):

    sql_delete_by_emp_Id = "DELETE FROM employees WHERE EmployeeID = ?"
    sql_insert = """INSERT INTO employees (UsrEmpID, employee_passport, ss_number, dwell_time, age, specialization, first_name, second_name, AdminID, WS_zip_code) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"""
    sql_insert_without_admin = """INSERT INTO employees (UsrEmpID, employee_passport, ss_number, dwell_time, age, specialization, first_name, second_name, WS_zip_code) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"""
    sql_employee_id = "SELECT EmployeeID FROM employees WHERE UsrEmpID = ?"
    sql_select_user_id = "SELECT UsrEmpID FROM employees WHERE EmployeeID = ?"
    sql_select_by_admin_Id = "SELECT * FROM employees WHERE AdminID = ?"
    sql_check_passport_exists = "SELECT COUNT(*) FROM employees WHERE employee_passport = ?"
    sql_check_ss_number_exists = "SELECT COUNT(*) FROM employees WHERE ss_number = ?"

    # Cambiar función
    def insert(self, user_id: int, vo: EmployeeVO, ws_zip_code:int, admin_id:int=None) -> bool:
        """Inserta un nuevo empleado en la base de datos."""
        cursor = self.getCursor()
        try:
            # Validamos si existe el pasaporte y el número de seguro social
            cursor.execute(self.sql_check_passport_exists, [vo.passport])
            
            if cursor.fetchone()[0] > 0:
                raise ValueError("Ya existe un empleado con el mismo pasaporte.")
            
            cursor.execute(self.sql_check_ss_number_exists, [vo.ss_number])
            
            if cursor.fetchone()[0] > 0:
                raise ValueError("Ya existe un empleado con el mismo número de seguro social.")

            if admin_id is None:
                # Si no se proporciona un ID de administrador, se inserta sin él
                cursor.execute(self.sql_insert_without_admin, [user_id, vo.passport, vo.ss_number, vo.dwell_time,
                    vo.age, vo.specialization, vo.first_name, vo.second_name, ws_zip_code])
            
            else:
                cursor.execute(self.sql_insert, [user_id, vo.passport, vo.ss_number, vo.dwell_time,
                    vo.age, vo.specialization, vo.first_name, vo.second_name, admin_id, ws_zip_code])
        
            return cursor.rowcount > 0
        
        except ValueError as e:
            # Lanzamos excepciones específicas para errores de validación
            raise e

        except Exception as e:
            # Lanzamos una excepción genérica para otros errores
            raise Exception(f"Error insertando empleado: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_employee_id(self, employee_id: int) -> int:
        """Elimina un empleado de la tabla employees por su ID de empleado.
        Devuelve el id del usuario para eliminarlo de la tabla users."""
        cursor = self.getCursor()
        
        try:
            # Obtenemos el ID del usuario asociado al empleado
            cursor.execute(self.sql_select_user_id, [employee_id])
            user_id = cursor.fetchone()

            if user_id is None:
                raise ValueError("No se encontró el ID de usuario asociado al empleado.")

            # Eliminamos al empleado de la tabla employees
            cursor.execute(self.sql_delete_by_emp_Id, [employee_id])

            return user_id[0]

        except ValueError as e:
            # Lanzamos excepciones específicas para errores de validación
            raise e
        
        except Exception as e:
            # Lanzamos una excepción genérica para otros errores
            raise Exception(f"Error eliminando empleado: {e}")

        finally:
            cursor.close()
            self.closeConnection()
    
    def get_employee_id_from_user_id(self, user_id: int) -> int:
        """Devuelve el ID del empleado dado su ID de usuario"""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_employee_id, [user_id])
            result = cursor.fetchone()
            
            if result is None:
                raise ValueError("No se encontró el ID de empleado para el usuario proporcionado.")
        
            return result[0] if result else None
        
        except ValueError as e:
            # Lanzamos excepciones específicas para errores de validación
            raise e
        
        except Exception as e:
            # Lanzamos una excepción genérica para otros errores
            raise Exception(f"Error obteniendo el ID de empleado: {e}")

        finally:
            cursor.close()
            self.closeConnection()
            
    def get_employees_by_admin_id(self, admin_id:int) -> list:
        """Obtiene los empleados de la base de datos por su ID de administrador."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_select_by_admin_Id, [admin_id])
            columns = [col[0] for col in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()] # Obtenemos una lista clave-valor
        
            return results
        
        except Exception as e:
            return []

        finally:
            cursor.close()
            self.closeConnection()        
