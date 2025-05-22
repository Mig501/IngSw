from model.conexion.Conexion import Conexion
from model.vo.EmployeeVO import EmployeeVO

class EmployeeDao(Conexion):

    sql_delete_by_emp_Id = "DELETE FROM employees WHERE EmployeeID = ?"
    sql_insert = """INSERT INTO employees (UsrEmpID, employee_passport, ss_number, dwell_time, age, specialization, first_name, second_name, AdminID, WS_zip_code) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"""
    sql_insert_without_admin = """INSERT INTO employees (UsrEmpID, employee_passport, ss_number, dwell_time, age, specialization, first_name, second_name, WS_zip_code) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"""
    sql_consult_workshop = "SELECT WS_zip_code FROM workshop LIMIT 1"
    sql_employee_id = "SELECT EmployeeID FROM employees WHERE UsrEmpID = ?"
    sql_select_user_id = "SELECT UsrEmpID FROM employees WHERE EmployeeID = ?"
    sql_delete_user = "DELETE FROM users WHERE UserID = ?"
    sql_select_by_admin_Id = "SELECT * FROM employees WHERE AdminID = ?"

    def insert(self, user_id: int, vo: EmployeeVO, admin_id:int=None) -> bool:
        """Inserta un nuevo empleado en la base de datos."""
        cursor = self.getCursor()
        try:
            cursor.execute(self.sql_consult_workshop)   
            ws_zip_code = cursor.fetchone() # Me devuelve el único zip code de la tabla workshop

            if ws_zip_code is None:
                raise Exception("No se encontró el código postal del taller.")

            if admin_id is None:
                # Si no se proporciona un ID de administrador, se inserta sin él
                cursor.execute(self.sql_insert_without_admin, [user_id, vo.passport, vo.ss_number, vo.dwell_time,
                    vo.age, vo.specialization, vo.first_name, vo.second_name, ws_zip_code[0]])
            
            else:
                cursor.execute(self.sql_insert, [user_id, vo.passport, vo.ss_number, vo.dwell_time,
                    vo.age, vo.specialization, vo.first_name, vo.second_name, admin_id, ws_zip_code[0]])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando empleado: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_employee_id(self, employee_id: int) -> bool:
        """Elimina un empleado de la tabla employees` por su ID de empleado."""
        cursor = self.getCursor()
        
        try:
            # Obtenemos el ID del usuario asociado al empleado
            cursor.execute(self.sql_select_user_id, [employee_id])
            user_id = cursor.fetchone()

            if user_id is None:
                raise Exception("No se encontró el ID de usuario asociado al empleado.")

            # Primero eliminamos al empleado de la tabla employees
            cursor.execute(self.sql_delete_by_emp_Id, [employee_id])

            # Luego eliminamos al usuario de la tabla users
            cursor.execute(self.sql_delete_user, [user_id[0]])


            return cursor.rowcount > 0

        finally:
            cursor.close()
            self.closeConnection()
    
    def get_employee_id_from_user_id(self, user_id: int) -> int:
        """Devuelve el ID del admin dado su ID de usuario"""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_employee_id, [user_id])
            result = cursor.fetchone()
            return result[0] if result else None

        finally:
            cursor.close()
            self.closeConnection()
        cursor.execute("SELECT EmployeeID FROM employees WHERE UsrEmpID = ?", (user_id,))
        row = cursor.fetchone()
        cursor.close()
        return row[0] if row else None

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
