# src/model/dao/UserDao.py
from model.conexion.Conexion import Conexion
from model.vo.RegisterUserVO import RegisterUserVO
from model.vo.LoginUserVO import LoginUserVO
import jaydebeapi
import bcrypt

class UserDao(Conexion):
    sql_select_users = "SELECT UserID, username, userpassword, email, phone_number, rol FROM users"
    sql_search = "SELECT UserID, username, userpassword, email, phone_number, rol FROM users WHERE username = ?"
    sql_insert = "INSERT INTO users (username, userpassword, email, phone_number, rol) VALUES ( ?, ?, ?, ?, ?)"
    sql_delete_users = "DELETE FROM users WHERE UserID = ?"
    sql_count_users = "SELECT COUNT(*) FROM users"
    sql_get_last_id = "SELECT MAX(UserID) FROM users"
    sql_update_profile = "UPDATE users SET username = ?, email = ?, phone_number = ? WHERE UserID = ?"
    sql_get_psw = "SELECT userpassword FROM users WHERE username = %s"
    sql_get_zip_code = """
        SELECT WS_zip_code FROM workshop LIMIT 1
    """

    def reset_autoincrement_if_empty(self):
        """Está función es sólo para hacer pruebas nosostros"""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_count_users)
            count = cursor.fetchone()[0]
            
            if count == 0: # Si hay usuarios en la tabla, modificamos el autoincremento a 1
                cursor.execute("ALTER TABLE users AUTO_INCREMENT = 1")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_user_by_id(self, user_id) -> int:
        """Método que elimina un usuario de la base de datos por su id de usuario"""
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
                user = RegisterUserVO(row[0], row[1], row[2], row[3], row[4], row[5]) #se pone un row por cada columna que se seleccionó
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
        """Método para comprobar si el usuario existe en la base de datos, comparando la contraseña con bcrypt
        y el username. Si existe, devuelve el objeto RegisterUserVO con los datos del usuario."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_search, [loginVO.username])
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
        
        row = list(row)
        db_password = row[2]
        
        # Comparamos hash con bcrypt
        if not bcrypt.checkpw(loginVO.userpassword.encode('utf-8'), db_password.encode('utf-8')):
            return None
        
        return RegisterUserVO(row[0], row[1], row[2], row[3], row[4], row[5]) # devolvemos el objeto RegisterUserVO si la contraseña es correcta

    def insert(self, userVO) -> int:
        """Método que inserta un usuario nuevo en la base de datos"""
        cursor = self.getCursor()
        rows = 0 # filas afectadas, en este caso los usuarios
        
        try:
            cursor.execute(self.sql_count_users) # contamos los usuarios en la tabla
            count = cursor.fetchone()[0] # obtenemos el número de usuarios en la tabla

            if count == 0:
                userVO.rol = "arch"  # Asignar rol "arch" si no hay usuarios en la tabla

            # Encriptar la contraseña antes de insertarla en la base de datos
            hashed_password = bcrypt.hashpw(userVO.userpassword.encode('utf-8'), bcrypt.gensalt())
            hashed_password = hashed_password.decode('utf-8')  # Convertir de bytes a string
            
            cursor.execute(self.sql_insert, [userVO.username, hashed_password, 
                                             userVO.email, userVO.phone, userVO.rol] )

            rows = cursor.rowcount # el rowcount devuelve el número de filas afectadas por la consulta

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Insert error: {e}")
        
        except Exception as e:
            raise Exception(f"Insert error: {e}")
            
        finally:
            if cursor:
                cursor.close() # cerramos el cursor

            self.closeConnection() # cerramos la conexión a la base de datos
            return rows
        
    def get_last_inserted_user_id(self) -> int:
        """Obtiene el último ID de usuario insertado en la tabla users, que es el autoincremental"""
        cursor = self.getCursor()
       
        try:
            cursor.execute("SELECT MAX(UserID) FROM users")
            row = cursor.fetchone()
       
            return row[0] if row else None
       
        except Exception as e:
            raise Exception(f"Error al obtener el último ID de usuario: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_user_rol(self, user_id: int) -> str:
        """Obtiene el rol de un usuario a partir de su ID"""
        if user_id == 1:
            return "arch"

        cursor = self.getCursor()
        
        try:
            cursor.execute("SELECT rol FROM users WHERE UserID = ?", [user_id])
            row = cursor.fetchone()
            
            return row[0] if row else "cliente"
        
        finally: 
            cursor.close()
            self.closeConnection()

    def update_user_profile(self, user_id:int, username:str, email:str, phone:str):
        """Actualiza el perfil de un usuario en la base de datos"""

        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_update_profile, [username, email, phone, user_id])
            rows = cursor.rowcount

            return rows > 0, "Actualizado"

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Error al actualizar el perfil: {e}")
        
        except Exception as e:
            raise Exception(f"Error al actualizar el perfil: {e}")
        
    def get_user_password_by_username(self, username):
        try:
            self.cursor.execute(self.sql_get_psw, (username,))
            result = self.cursor.fetchone()
            return result[0] if result else None
        except Exception as e:
            raise Exception(f"Error al obtener contraseña por username: {e}")
        
    def username_exists(self, username:str) -> bool:
        """Comprueba si un nombre de usuario ya existe en la base de datos"""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_search, [username])
            row = cursor.fetchone()
            return row is not None  # Si hay una fila, el usuario existe
        
        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Error al comprobar si el usuario existe: {e}")
        
        except Exception as e:
            raise Exception(f"Error al comprobar si el usuario existe: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_workshop_zip_code(self) -> str:
        """Obtiene el código postal del taller."""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_get_zip_code)
            row = cursor.fetchone()
            
            return row[0] if row else None
        
        except Exception as e:
            cursor.rollback()
            raise Exception(f"Error obteniendo el código postal del taller: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()
