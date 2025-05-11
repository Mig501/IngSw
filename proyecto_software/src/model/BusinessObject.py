# src/model/BusinessObject.py
from model.conexion.Conexion import Conexion
from model.vo.RegisterUserVO import RegisterUserVO
from model.dao.UserDao import UserDao
from model.dao.UserDao import UserDao
from model.dao.ClientDao import ClientDao
from model.dao.EmployeeDao import EmployeeDao
from model.dao.AdminDao import AdminDao
from model.dao.ArchDao import ArchDao
from model.vo.WorkshopVO import WorkshopVO
from model.dao.WorkshopDAO import WorkshopDao

class BusinessObject():
    """Objeto que implementa la lógica de negocio"""

    def delete_user(self, user_id:int) -> bool:
        """Método que elimina el usuario que tenga como id de usuario"""
        try:
            # Primero eliminanmos en las tablas que tienenn foreign key a users
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

            # Eliminar si es arch
            try:
                ArchDao().delete_by_user_id(user_id)

            except Exception as e:
                pass

            # Eliminar de users
            return UserDao().delete_user_by_id(user_id)
        
        except Exception as e:
            raise Exception(f"Delete error user with ID {user_id}: {e}")       
    
    def comprobarlogin(self, loginVo) -> RegisterUserVO:
        """Método que comprueba si el usuario existe en la base de datos.
        Si existe, devuelve el objeto RegisterUserVO con los datos del usuario en 
        caso de que exista."""
        userdao = UserDao() # Instanciamos el dao que conecta con la base de datos
        user = userdao.consultlogin(loginVo) # Llamamos a la función que busca el usuario por su nombre de usuario

        return user
    
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
        
        user_id = user_dao.get_last_inserted_user_id() # Obtenemos el id del usuario que acabamos de insertar para que este se incremente
        
        return ClientDao().insert_client(user_id)
    
    def registrar_empleado(self, user_vo, employee_vo, admin_id) -> bool:
        """Método que registra un empleado en la base de datos."""
        user_vo.rol = "empleado"
        user_dao = UserDao()

        if not user_dao.insert(user_vo):
            return False
        
        user_id = user_dao.get_last_inserted_user_id()
        
        return EmployeeDao().insert(user_id, admin_id, employee_vo)
    
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
        """Método que obtiene el rol del usuario.
        Está función la usaremos para mostrar una ventana u otra dependiendo del rol."""
        return UserDao().get_user_rol(user_id)

    def register_workshop(self, workshop_vo:WorkshopVO) -> bool:
        """Método que registra un taller en la base de datos."""
        try:
            workshop_dao = WorkshopDao()

            return workshop_dao.insert_workshop(workshop_vo)
    
        except Exception as e:
            raise Exception(f"Error in BusinessObject.register_workshop: {e}")