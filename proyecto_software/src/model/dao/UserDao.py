# src/model/dao/UserDao.py
'''Debemos implementar un DAO por tabla, en este caso la tabla user'''
from src.model.conexion import conexion
from src.model.vo import UserVo
import jaydebeapi

class UserDao(conexion):
    sql_select_users = "SELECT UserID, Username, UserPassword, Email FROM users"
    sql_search = "SELECT UserID, Username, UserPassword, Email FROM users WHERE username = ?"
    sql_insert = "INSERT INTO users (UserID, Username, UserPassword, Email) VALUES (?, ?, ?, ?)" # Habría que añadir más ? y columnas, pero de momento se deja así por si hay cambios en la base de datos

    def select(self) -> list[UserVo]:
        try:
            cursor = self.getCursor() # obtenemos cursor de econexion
            cursor.execute(self.sql_select_users) # ejecutamos la consulta
            users = [] 
            rows = cursor.fetchall() # obtenemos todas las filas de la conusta

            for row in rows:
                row = list(row) # el fetchall devuelve una tupla, la convertimos a lista para poder acceder a los elementos
                user = UserVo(row[0], row[1], row[2], row[3]) #se pone un row por cada columna que se seleccionó
                users.append(user)

            return users

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Error in SELECT query: {e}")


        except Exception as e:
            raise Exception(f"Error in SELECT query: {e}")
    
    def consultlogin(self, loginVO):
        try:
            cursor = self.getCursor()
            cursor.execute(self.sql_search,[loginVO.username])
            row = cursor.fetchone() # usamos fetchone para obtener una sola fila, ya que el username es único
            if not row:
                return None
                #raise Exception("Results not found")

            else:
                row = list(row)
                return UserVo(row[0], row[1], row[2], row[3])
    
        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Consultlogin error: {e}")
        
        except Exception as e:
            raise Exception(f"Consultlogin error: {e}")
    
    def insert(self, userVO) -> int:
        try:
            cursor = self.getCursor()
            cursor.execute(self.sql_insert, [userVO.UserID, userVO.Username,
                                             userVO.UserPassword, userVO.Email] )
            self.conexion.commit()
            return userVO.UserID

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Insert error: {e}")
        
        except Exception as e:
            raise Exception(f"Insert error: {e}")