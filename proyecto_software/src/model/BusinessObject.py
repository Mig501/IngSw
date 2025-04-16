# src/model/BusinessObject.py
import random
from model.conexion.Conexion import Conexion
from model.vo.RegisterUserVO import RegisterUserVO
from model.dao.UserDao import UserDao
from model.dao.UserDao import UserDao
from model.dao.ClientDao import ClientDao
from model.dao.EmployeeDao import EmployeeDao
from model.dao.AdminDao import AdminDao
from model.dao.ArchDao import ArchDao

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
        try:
            # Eliminar si es cliente
            try:
                ClientDao().delete_by_user_id(user_id)
            
            except Exception as e:
                pass

            # Eliminar si es empleado
            try:
                EmployeeDao().delete_by_user_id(user_id)

            except Exception as e:
                pass

            # Eliminar si es admin
            try:
                AdminDao().delete_by_user_id(user_id)

            except Exception as e:
                pass

            # Eliminar de users
            return UserDao().delete_user_by_id(user_id)
        except Exception as e:
            raise Exception(f"Delete error user with ID {user_id}: {e}")       
    
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

    def registrar_cliente(self, user_vo) -> bool:
        """Método que registra un cliente en la base de datos."""

        user_dao = UserDao()

        if not user_dao.insert(user_vo):
            return False
        
        user_id = user_dao.get_last_inserted_user_id()
        
        return ClientDao().insert_client(user_id)
    
    def registrar_empleado(self, user_vo, employee_vo) -> bool:
        """Método que registra un empleado en la base de datos."""
        
        user_vo.rol = "empleado"
        user_dao = UserDao()

        if not user_dao.insert(user_vo):
            return False
        
        user_id = user_dao.get_last_inserted_user_id()
        
        return EmployeeDao().insert(user_id, employee_vo)
    
    def registrar_admin(self, user_vo, admin_vo) -> bool:
        """Método que registra un administrador en la base de datos."""
        
        user_vo.rol = "admin"
        user_dao = UserDao()

        if not user_dao.insert(user_vo):
            return False
        
        user_id = user_dao.get_last_inserted_user_id()
        
        return AdminDao().insert(user_id, admin_vo)
    
    def registrar_arch(self, user_vo, arch_vo) -> bool:
        """Método que registra un archivador en la base de datos."""

        user_vo.rol = "arch"
        user_dao = UserDao()

        if not user_dao.insert(user_vo):
            return False
        
        user_id = user_dao.get_last_inserted_user_id()
        
        return ArchDao().insert(user_id, arch_vo)
    
    def get_user_rol(self, user_id: int) -> str:
        """Método que obtiene el rol del usuario."""
        return UserDao().get_user_rol(user_id)
