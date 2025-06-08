# src/model/UserBusinessObject.py
from model.dao.UserDao import UserDao
from model.dao.ClientDao import ClientDao
from model.dao.EmployeeDao import EmployeeDao
from model.dao.AdminDao import AdminDao
from model.dao.ArchDao import ArchDao
from model.vo.EmployeeVO import EmployeeVO
from model.vo.LoginUserVO import LoginUserVO
from model.vo.AdminVO import AdminVO
from model.vo.RegisterUserVO import RegisterUserVO
from model.vo.ArchVO import ArchVO

class UserBusinessObject:
    def __init__(self, user_dao=None, client_dao=None, employee_dao=None, admin_dao=None, arch_dao=None) -> None:
        self.user_dao = user_dao or UserDao()
        self.client_dao = client_dao or ClientDao()
        self.employee_dao = employee_dao or EmployeeDao()
        self.admin_dao = admin_dao or AdminDao()
        self.arch_dao = arch_dao or ArchDao()

    def comprobarlogin(self, loginVo:LoginUserVO) -> RegisterUserVO:
        """Verifica las credenciales de inicio de sesión del usuario"""
        return self.user_dao.consultlogin(loginVo)
    
    def insert(self, user_vo:RegisterUserVO) -> int:
        """Inserta un nuevo usuario en la base de datos."""
        return self.user_dao.insert(user_vo)

    def get_user_rol(self, user_id:int) -> str:
        """Obtiene el rol del usuario dado su ID."""
        return self.user_dao.get_user_rol(user_id)

    def username_exists(self, username:str) -> bool:
        """Verifica si un nombre de usuario ya existe en la base de datos."""
        return self.user_dao.username_exists(username)

    def delete_user(self, user_id:int) -> bool:
        """Elimina un usuario y su información asociada de la base de datos."""
        try:
            self.client_dao.delete_by_user_id(user_id)
            self.employee_dao.delete_by_user_id(user_id)
            self.admin_dao.delete_by_user_id(user_id)
            self.arch_dao.delete_by_user_id(user_id)
            return self.user_dao.delete_user_by_id(user_id)
        except Exception as e:
            raise Exception(f"Delete error user with ID {user_id}: {e}")

    def registrar_cliente(self, user_vo:RegisterUserVO) -> bool:
        """Inserta un nuevo cliente en la base de datos."""
        if not self.user_dao.insert(user_vo):
            return False
        user_id = self.user_dao.get_last_inserted_user_id()
        return self.client_dao.insert_client(user_id)

    def registrar_empleado(self, user_vo:RegisterUserVO, employee_vo: EmployeeVO, admin_id=None) -> bool:
        """Inserta un nuevo empleado en la base de datos."""
        user_vo.rol = "empleado"
        if not self.user_dao.insert(user_vo):
            return False
        user_id = self.user_dao.get_last_inserted_user_id()
        ws_zip_code = self.user_dao.get_workshop_zip_code()
        return self.employee_dao.insert(user_id, employee_vo, ws_zip_code, admin_id)

    def registrar_admin(self, user_vo:RegisterUserVO, admin_vo:AdminVO) -> bool:
        """Inserta un nuevo administrador en la base de datos."""
        user_vo.rol = "admin"
        if not self.user_dao.insert(user_vo):
            return False
        user_id = self.user_dao.get_last_inserted_user_id()
        return self.admin_dao.insert(user_id, admin_vo)
    
    def registrar_arch(self, user_vo:RegisterUserVO, arch_vo:ArchVO) -> bool:
        """Inserta un super administrador en la base datos."""
        user_vo.rol = "arch"
        if not self.user_dao.insert(user_vo):
            return False
        user_id = self.user_dao.get_last_inserted_user_id()
        return self.arch_dao.insert(user_id, arch_vo)

    def update_user_profile(self, user_id:int, username:str, email:str, phone:str) -> tuple:
        """Actualiza los datos modificados del perfil del usuario."""
        return self.user_dao.update_user_profile(user_id, username, email, phone)

    def get_client_id(self, user_id:int) -> int:
        """Obtiene el ID del cliente asociado a un usuario dado su ID."""
        return self.client_dao.get_client_id(user_id)

    def get_employee_id(self, user_id:int) -> int:
        """Obtiene el ID del empleado asociado a un usuario dado su ID."""
        return self.employee_dao.get_employee_id_from_user_id(user_id)

    def get_admin_id_by_user_id(self, user_id:int) -> int:
        """Obtiene el ID del administrador asociado a un usuario dado su ID."""
        return self.admin_dao.get_admin_id(user_id)

    def get_employee_id_from_user_id(self, user_id:int) -> int:
        """Obtiene el ID del empleado dado su ID de usuario."""
        return self.employee_dao.get_employee_id_from_user_id(user_id)
    
    def get_saldo_cliente(self, client_id:int) -> float:
        """Obtiene el saldo del cliente dado su ID."""
        return self.client_dao.get_saldo(client_id)

    def update_client_stats(self, client_id:int, nuevo_saldo:float) -> bool:
        """Actualiza el saldo del cliente dado su ID."""
        return self.client_dao.update_saldo(client_id, nuevo_saldo)
    
    def get_employees_by_admin_id(self, admin_id:int) -> list:
        """Obtiene una lista de empleados asociados a un administrador dado su ID."""
        return self.employee_dao.get_employees_by_admin_id(admin_id)
    
    def delete_employee(self, employee_id:int) -> bool:
        """Elimina un empleado y su información asociada de la base de datos."""
        user_id = self.employee_dao.delete_by_employee_id(employee_id)

        self.user_dao.delete_user_by_id(user_id)
        return True
    
    def get_admins_excluding_actual(self, actual_admin_id:int) -> list:
        """Obtiene una lista de administradores excluyendo al administrador actual,
        para reasignar los empleados de un administrador que se va a eliminar."""
        return self.admin_dao.get_all_admins_excluding_actual(actual_admin_id)
    
    def delete_admin(self, admin_id:int, new_admin_id_emp:int=None) -> bool:
        """Elimina un administrador y reasigna sus empleados a otro administrador proporcionado."""
        # Primero reasignamos los empleados del admin a otro admin, si se ha proporcionado uno
        if new_admin_id_emp is not None:
           self.employee_dao.update_admin_id(admin_id, new_admin_id_emp)
    
        # Obtengo el id de usuario del admin a eliminar
        admin_user_id = self.admin_dao.get_usr_admin_id(admin_id)
        
        # Primero eliminamos al admin de la tabla admins
        self.admin_dao.delete_by_user_id(admin_user_id)
        
        # Después eliminamos al usuario de la tabla users
        self.user_dao.delete_user_by_id(admin_user_id)
        
        return True
    
    def count_users(self) -> int:
        """Devuelve el número total de usuarios registrados en la tabla `users`."""
        try:
            cursor = self.user_dao.getCursor()
            cursor.execute("SELECT COUNT(*) FROM users")
            count = cursor.fetchone()[0]
            cursor.close()
            return count
        except Exception as e:
            raise Exception(f"Error al contar usuarios: {e}")