# src/model/dao/UserDao.py
'''Debemos implementar un DAO por tabla, en este caso la tabla user'''
from model.conexion.Conexion import Conexion
from model.vo.RegisterUserVO import RegisterUserVO
from model.vo.LoginUserVO import LoginUserVO
import jaydebeapi
import bcrypt

class UserDao(Conexion):
    sql_select_users = "SELECT UserID, username, userpassword, email, phone_number FROM users"
    sql_search = "SELECT UserID, username, userpassword, email, phone_number FROM users WHERE username = ?"
    sql_insert = "INSERT INTO users (username, userpassword, email, phone_number) VALUES ( ?, ?, ?, ?)"
    sql_delete_users = "DELETE FROM users WHERE UserID = ?"

    def delete_user_by_id(self, user_id) -> int:
        """Método que elimina un usuario de la base de datos por su id"""
        cursor = self.getCursor() # Obtenemos el cursor de conexión con la base datos
        rows = 0 # Filas afectadas, en este caso los usuarios

        try:
            cursor.execute(self.sql_delete_users, [user_id]) # Ejecutamos las consultas
            rows = cursor.rowcount # Obtenemos el número de filas afectadas

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Delete error user with ID {user_id}: {e}")

        except Exception as e:
            raise Exception(f"Delete error user with ID {user_id}: {e}")

        finally:
            if cursor:
                cursor.close()
            self.closeConnection() # Cerramos conexión

        return rows

    def select(self) -> list:
        """Mëtodo que muestra los usuarios de la base de datos"""
        cursor = self.getCursor() # obtenemos cursor de econexion
        users = [] # Almacenamso todos los usuarios
        
        try:
            cursor.execute(self.sql_select_users) # ejecutamos la consulta
            rows = cursor.fetchall() # obtenemos todas las filas de la conusta

            for row in rows:
                print("Row:", row) # para ver qué devuelve la consulta
                row = list(row) # el fetchall devuelve una tupla, la convertimos a lista para poder acceder a los elementos
                user = RegisterUserVO(row[0], row[1], row[2], row[3], row[4]) #se pone un row por cada columna que se seleccionó
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
    
    def consultlogin(self, loginVO) -> RegisterUserVO:
        """Método para consultar el incio sesión"""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_search,[loginVO.username])
            row = cursor.fetchone() # usamos fetchone para obtener una sola fila, ya que el username es único
        
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
        
        row = list(row)
        db_password = row[2]
        
        # Comparamos hash con bcrypt
        if not bcrypt.checkpw(loginVO.userpassword.encode('utf-8'), db_password.encode('utf-8')):
            return None

        # validar contraseña
        #if db_password != loginVO.userpassword:
        #    return None # contraseña incorrecta
        
        return RegisterUserVO(row[0], row[1], row[2], row[3], row[4]) # devolvemos el objeto RegisterUserVO si la contraseña es correcta

    #def insert(self, userVO) -> int:
    #    """Método que inserta un usuario nuevo en la base de datos"""
    #    cursor = self.getCursor()
    #    rows = 0
    #    
    #    try:
    #        print("Ejecutando el insert")
    #        cursor.execute(self.sql_insert, [userVO.username, userVO.userpassword, 
    #                                         userVO.email, userVO.phone] )
    #        #self.conexion.commit()

    #        rows = cursor.rowcount # el rowcount devuelve el número de filas afectadas por la consulta

    #    except jaydebeapi.DatabaseError as e:
    #        print("Error en el insert dao", e)
    #        raise jaydebeapi.DatabaseError(f"Insert error: {e}")
    #    
    #    except Exception as e:
    #        print("Error en el insert dao", e)
    #        raise Exception(f"Insert error: {e}")
    #        
    #    finally:
    #        if cursor:
    #            cursor.close()

    #        self.closeConnection()
    #        return rows

    def insert(self, userVO) -> int:
        """Método que inserta un usuario nuevo en la base de datos"""
        cursor = self.getCursor()
        rows = 0
        
        try:
            # Encriptar la contraseña antes de insertarla en la base de datos
            hashed_password = bcrypt.hashpw(userVO.userpassword.encode('utf-8'), bcrypt.gensalt())
            hashed_password = hashed_password.decode('utf-8')  # Convertir de bytes a string
            
            print("Ejecutando el insert")
            cursor.execute(self.sql_insert, [userVO.username, hashed_password, 
                                             userVO.email, userVO.phone] )
            #self.conexion.commit()

            rows = cursor.rowcount # el rowcount devuelve el número de filas afectadas por la consulta

        except jaydebeapi.DatabaseError as e:
            print("Error en el insert dao", e)
            raise jaydebeapi.DatabaseError(f"Insert error: {e}")
        
        except Exception as e:
            print("Error en el insert dao", e)
            raise Exception(f"Insert error: {e}")
            
        finally:
            if cursor:
                cursor.close()

            self.closeConnection()
            return rows