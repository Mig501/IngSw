# src/model/BusinessObject.py
import random
from model.conexion.Conexion import Conexion
from model.vo.RegisterUserVO import RegisterUserVO
from model.dao.UserDao import UserDao

class BusinessObject():
    """Objeto que implementa la lógica de negocio"""

    #def pruebainsert(self):
    #    user_dao = UserDao()
    #    random_id = random.randint(1000, 9999)
    #    user1 = RegisterUserVO(random_id, "jmpd", "chatgpt@gmail.com", "7593")
    #    rows = user_dao.insert(user1)

    #def pruebaselect(self):
    #    user_dao = UserDao()
    #    users = user_dao.select()

    #    for usuario in users:
    #        print(usuario.user_id, usuario.username, usuario.email, usuario.userpassword)

    def delete_user(self, user_id:int) -> bool:
        """Método que elimina el usuario que tenga un id"""
        user_dao = UserDao() # Instanciamos el dao que conecta con la base de datos
        rows_deleted = user_dao.delete_user_by_id(user_id) # Llamamos a la función que borra el usuario con id específico
        return rows_deleted > 0
    
    def comprobarlogin(self, loginVo) -> RegisterUserVO:
        """Método que comprueba si el usuario existe en la base de datos.
        Si existe, devuelve el objeto RegisterUserVO con los datos del usuario."""
        userdao= UserDao() # Instanciamos el dao que conecta con la base de datos
        return userdao.consultlogin(loginVo) # Llamamos a la función que comprueba si el usuario existe en la base de datos
    
    def insert(self, user_vo) -> int:
        """Método que inserta un usuario en la base de datos."""
        try:
            user_dao = UserDao() # Instanciamos el dao que conecta con la base de datos
            rows = user_dao.insert(user_vo) # Llamamos a la función que inserta el usuario en la base de datos
            return rows # Retornamos el número de filas afectadas por la inserción

        except Exception as e:
            raise Exception(f"Error in BusinessObject.insert: {e}")


