# src/model/UserBusinessObject.py
from model.dao.UserDao import UserDao
from model.dao.ClientDao import ClientDao
from model.dao.EmployeeDao import EmployeeDao
from model.dao.AdminDao import AdminDao
from model.dao.ArchDao import ArchDao
from model.vo.EmployeeVO import EmployeeVO

class UserBusinessObject:
    def __init__(self, user_dao=None, client_dao=None, employee_dao=None, admin_dao=None, arch_dao=None):
        self.user_dao = user_dao or UserDao()
        self.client_dao = client_dao or ClientDao()
        self.employee_dao = employee_dao or EmployeeDao()
        self.admin_dao = admin_dao or AdminDao()
        self.arch_dao = arch_dao or ArchDao()

    # hecho
    def comprobarlogin(self, loginVo):
        return self.user_dao.consultlogin(loginVo)
    
    # hecho
    def insert(self, user_vo):
        return self.user_dao.insert(user_vo)

    # hecho
    def get_user_rol(self, user_id):
        return self.user_dao.get_user_rol(user_id)

    # hecho
    def username_exists(self, username):
        return self.user_dao.username_exists(username)

    # hecho
    def delete_user(self, user_id):
        try:
            self.client_dao.delete_by_user_id(user_id)
            self.employee_dao.delete_by_user_id(user_id)
            self.admin_dao.delete_by_user_id(user_id)
            self.arch_dao.delete_by_user_id(user_id)
            return self.user_dao.delete_user_by_id(user_id)
        except Exception as e:
            raise Exception(f"Delete error user with ID {user_id}: {e}")

    # hehcho
    def registrar_cliente(self, user_vo):
        if not self.user_dao.insert(user_vo):
            return False
        user_id = self.user_dao.get_last_inserted_user_id()
        return self.client_dao.insert_client(user_id)
    
    # hecho
    def registrar_empleado(self, user_vo, employee_vo: EmployeeVO, admin_id=None):
        user_vo.rol = "empleado"
        if not self.user_dao.insert(user_vo):
            return False
        user_id = self.user_dao.get_last_inserted_user_id()
        ws_zip_code = self.user_dao.get_workshop_zip_code()
        return self.employee_dao.insert(user_id, employee_vo, ws_zip_code, admin_id)
    
    # hecho
    def registrar_admin(self, user_vo, admin_vo):
        user_vo.rol = "admin"
        if not self.user_dao.insert(user_vo):
            return False
        user_id = self.user_dao.get_last_inserted_user_id()
        return self.admin_dao.insert(user_id, admin_vo)
    
    # hecho
    def registrar_arch(self, user_vo, arch_vo):
        user_vo.rol = "arch"
        if not self.user_dao.insert(user_vo):
            return False
        user_id = self.user_dao.get_last_inserted_user_id()
        return self.arch_dao.insert(user_id, arch_vo)

    # hecho
    def update_user_profile(self, user_id, username, email, phone):
        return self.user_dao.update_user_profile(user_id, username, email, phone)

    # hecho
    def get_client_id(self, user_id):
        return self.client_dao.get_client_id(user_id)

    # hecho
    def get_employee_id(self, user_id):
        return self.employee_dao.get_employee_id_from_user_id(user_id)

    # hecho
    def get_admin_id_by_user_id(self, user_id):
        return self.admin_dao.get_admin_id(user_id)

    # hecho
    def get_employee_id_from_user_id(self, user_id):
        return self.employee_dao.get_employee_id_from_user_id(user_id)
    
    # hecho
    def get_saldo_cliente(self, client_id:int) -> float:
        return self.client_dao.get_saldo(client_id)

    # hecho
    def update_client_stats(self, client_id:int, nuevo_saldo:float) -> bool:
        return self.client_dao.update_saldo(client_id, nuevo_saldo)
    
    # hecho
    def get_employees_by_admin_id(self, admin_id:int) -> list:
        return self.employee_dao.get_employees_by_admin_id(admin_id)
    
    # hecho
    def delete_employee(self, employee_id:int) -> bool:
        from model.dao.ServiceDao import ServiceDao
        ServiceDao().delete_service_by_employee_id(employee_id)

        user_id = self.employee_dao.delete_by_employee_id(employee_id)

        self.user_dao.delete_user_by_id(user_id)
        return True
    
    # hecho
    def get_admins_excluding_actual(self, actual_admin_id:int) -> list:
        return self.admin_dao.get_all_admins_excluding_actual(actual_admin_id)
    
    # hecho
    def delete_admin(self, admin_id:int, new_admin_id_emp:int=None) -> bool:
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