# src/model/dao/UserDao.py
'''Debemos implementar un DAO por tabla, en este caso la tabla user'''
from model.conexion.Conexion import Conexion
from model.vo.UserVO import UserVO
import jaydebeapi

class UserDao(Conexion):
    sql_select_users = "SELECT UserID, username, userpassword, email FROM users"
    sql_search = "SELECT UserID,username, userpassword, email FROM users WHERE username = ?"
    sql_insert = "INSERT INTO users (UserID, username, userpassword, email) VALUES (?, ?, ?, ?)" # Habría que añadir más ? y columnas, pero de momento se deja así por si hay cambios en la base de datos

    def select(self) -> list:
        
        cursor = self.getCursor() # obtenemos cursor de econexion
        users = [] 
        
        try:
            cursor.execute(self.sql_select_users) # ejecutamos la consulta
            rows = cursor.fetchall() # obtenemos todas las filas de la conusta

            for row in rows:
                print("Row:", row) # para ver qué devuelve la consulta
                row = list(row) # el fetchall devuelve una tupla, la convertimos a lista para poder acceder a los elementos
                user = UserVO(row[0], row[1], row[2], row[3]) #se pone un row por cada columna que se seleccionó
                users.append(user)

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Error in SELECT query: {e}")


        except Exception as e:
            raise Exception(f"Error in SELECT query: {e}")
        
        finally:
            if cursor:
                cursor.close()
            self.closeConnection()

        return users
    
    def consultlogin(self, loginVO):
        cursor = self.getCursor()
        row = cursor.fetchone() # usamos fetchone para obtener una sola fila, ya que el username es único
        
        try:
            cursor.execute(self.sql_search,[loginVO.username])
    
        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Consultlogin error: {e}")
        
        except Exception as e:
            raise Exception(f"Consultlogin error: {e}")
    
        finally:
            if cursor:
                cursor.close()
            self.closeConnection()

        if not row:
            return None
            #raise Exception("Results not found")
        
        else:
            row = list(row)
            return UserVO(row[0], row[1], row[2], row[3])

    #def insert(self, userVO) -> int:
    #    cursor = self.getCursor()
    #    rows = 0
#
    #    try:
    #        print("Intentando insertar usuario:", userVO.user_id, userVO.username, userVO.userpassword, userVO.email)
    #        cursor.execute(self.sql_insert, [userVO.user_id, userVO.username,
    #                                         userVO.userpassword, userVO.email])
    #        print("INSERT ejecutado")  # Esto es clave
    #        self.conexion.commit()
    #        print("Commit realizado")
    #        rows = cursor.rowcount
    #        print("Filas afectadas según rowcount:", rows)
#
    #    except jaydebeapi.DatabaseError as e:
    #        print(f"[❌ DatabaseError en INSERT] {type(e).__name__}: {e}")
    #        raise
    #    except Exception as e:
    #        print(f"[❌ Error general en INSERT] {type(e).__name__}: {e}")
    #        raise
    #    finally:
    #        if cursor:
    #            cursor.close()
    #        self.closeConnection()
    #        return rows

    def insert(self, userVO) -> int:
        cursor = self.getCursor()
        rows = 0
        
        try:
            cursor.execute(self.sql_insert, [userVO.user_id, userVO.username,
                                             userVO.userpassword, userVO.email] )
            self.conexion.commit()
            (print("Insertado correctamente"))
            rows = cursor.rowcount # el rowcount devuelve el número de filas afectadas por la consulta

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Insert error: {e}")
        
        except Exception as e:
            raise Exception(f"Insert error: {e}")
            
        finally:
            if cursor:
                cursor.close()

            self.closeConnection()
            return rows
