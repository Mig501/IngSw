from model.conexion.Conexion import Conexion
from model.vo.EmployeeVO import EmployeeVO

class EmployeeDao(Conexion):
    def insert(self, user_id: int, vo: EmployeeVO) -> bool:
        """Inserta un nuevo empleado en la base de datos."""
        sql = """
            INSERT INTO employees (
                UsrEmpID, employee_passport, ss_number, dwell_time,
                age, specialization, first_name, second_name
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """

        cursor = self.getCursor()
        try:
            cursor.execute(sql, [
                user_id,
                vo.passport,
                vo.ss_number,
                vo.dwell_time,
                vo.age,
                vo.specialization,
                vo.first_name,
                vo.second_name
            ])
            return cursor.rowcount > 0
        except Exception as e:
            raise Exception(f"Error insertando empleado: {e}")
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        cursor = self.getCursor()
        try:
            cursor.execute("DELETE FROM employees WHERE UsrEmpID = ?", [user_id])
            return cursor.rowcount > 0
        finally:
            cursor.close()
            self.closeConnection()
