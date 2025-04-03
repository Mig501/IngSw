# src/model/dao/UserDao.py
from conexion.Conexion import Conexion
from vo.vo import UserVo
class UserDao(Conexion):
    sql_select = "SELECT * FROM user" #pones las columnas que quieras seleccionar
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