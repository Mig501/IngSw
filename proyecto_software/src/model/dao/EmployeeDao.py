from model.conexion.Conexion import Conexion
from model.vo.EmployeeVO import EmployeeVO

class EmployeeDao(Conexion):

    sql_delete = "DELETE FROM employees WHERE UsrEmpID = ?"
    sql_insert = """INSERT INTO employees (UsrEmpID, employee_passport, ss_number, dwell_time, age, specialization, first_name, second_name, AdminID, WS_zip_code) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"""
    sql_consult_workshop = "SELECT WS_zip_code FROM workshop LIMIT 1"


    def insert(self, user_id: int, admin_id:int, vo: EmployeeVO) -> bool:
        """Inserta un nuevo empleado en la base de datos."""
        cursor = self.getCursor()
        try:

            cursor.execute(self.sql_consult_workshop)   
            ws_zip_code = cursor.fetchone() # Me devuelve el único zip code de la tabla workshop

            if ws_zip_code is None:
                raise Exception("No se encontró el código postal del taller.")

            cursor.execute(self.sql_insert, [user_id, vo.passport, vo.ss_number, vo.dwell_time,
                vo.age, vo.specialization, vo.first_name, vo.second_name, admin_id, ws_zip_code[0]])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando empleado: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        """Elimina un empleado de la tabla employees` por su ID de usuario."""
        cursor = self.getCursor()
        try:
            cursor.execute(self.sql_delete, [user_id])
        
            return cursor.rowcount > 0
        
        finally:
            cursor.close()
            self.closeConnection()
