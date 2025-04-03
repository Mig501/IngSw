from src.model.conexion import conexion
from src.model.vo import UserVo
class UserDao(conexion):
    sql_select = "SELECT * FROM user" #pones las columnas que quieras seleccionar
    SQL_CONSULTA = "SELECT * FROM user WHERE username = ?"

    def select(self) -> list[UserVo]:
        cursor = self.getCursor()
        cursor.execute(self.sql_select)
        users = []
        rows = cursor.fetchall()
        for row in cursor.fetchall():
            row = list(row)
            user = UserVo(row[0], row[1], row[2], row[3]) #se pone un row por cada columna que se selecciono
            users.append(user)
        return users
    
    def consultlogin(self, loginVO):
        cursor = self.getCursor()
        cursor.execute(self.SQL_CONSULTA,[loginVO.username])
        rows = cursor.fetchall()
        return rows
    
