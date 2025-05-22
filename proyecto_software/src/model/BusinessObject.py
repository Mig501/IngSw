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
from model.vo.ProductVO import ProductVO
from model.dao.ProductDao import ProductDao
from model.dao.ReportDao import ReportDao
from model.vo.AutomobileVO import AutomobileVO
from model.vo.OtherProdVO import OtherProductVO
from model.dao.ServiceDao import ServiceDao
from model.vo.ServiceVO import ServiceVO
from model.vo.EmployeeVO import EmployeeVO
from model.vo.ClientVO import ClientVO
from model.vo.AdminVO import AdminVO
from model.vo.ArchVO import ArchVO

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
            admin_dao = UserDao() # Instanciamos el dao que conecta con la base de datos
            rows = admin_dao.insert(user_vo) # Llamamos a la función que inserta el usuario en la base de datos
            
            return rows # Retornamos el número de filas afectadas por la inserción

        except Exception as e:
            raise Exception(f"Error in BusinessObject.insert: {e}")

    def registrar_cliente(self, user_vo) -> bool:
        """Método que registra un cliente en la base de datos."""
        admin_dao = UserDao()

        if not admin_dao.insert(user_vo):
            return False
        
        user_id = admin_dao.get_last_inserted_user_id() # Obtenemos el id del usuario que acabamos de insertar para que este se incremente
        
        return ClientDao().insert_client(user_id)
    
    def registrar_empleado(self, user_vo, employee_vo, admin_id=None) -> bool:
        """Método que registra un empleado en la base de datos."""
        user_vo.rol = "empleado"
        admin_dao = UserDao()

        if not admin_dao.insert(user_vo):
            return False
        
        user_id = admin_dao.get_last_inserted_user_id()
        
        return EmployeeDao().insert(user_id, employee_vo, admin_id)
    
    def registrar_admin(self, user_vo, admin_vo) -> bool:
        """Método que registra un administrador en la base de datos."""
        user_vo.rol = "admin"
        admin_dao = UserDao()

        if not admin_dao.insert(user_vo):
            return False
        
        user_id = admin_dao.get_last_inserted_user_id()
        
        return AdminDao().insert(user_id, admin_vo)
    
    def registrar_arch(self, user_vo, arch_vo) -> bool:
        """Método que registra un archivador en la base de datos."""
        user_vo.rol = "arch"
        admin_dao = UserDao()

        if not admin_dao.insert(user_vo):
            return False
        
        user_id = admin_dao.get_last_inserted_user_id()
        
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
        
    def register_product(self, product_vo:ProductVO) -> bool:
        """Método que registra un producto en la base de datos."""
        try:
            product_dao = ProductDao()

            if product_dao.insert_product(product_vo):
                return True
            
            else:
                return False
        
        except Exception as e:
            raise Exception(f"Error in BusinessObject.register_product: {e}")
        
    
    def register_service(self, service_vo:ServiceVO) -> bool:
        """Método que registra un servicio en la base de datos."""
        try:
            service_dao = ServiceDao()

            if service_dao.insert_service(service_vo):
                return True
            
            else:
                return False
        
        except Exception as e:
            raise Exception(f"Error in BusinessObject.register_service: {e}")
        
    def get_client_id(self, user_id: int) -> int:
        """Método que obtiene el ID del cliente a partir del ID del usuario."""
        try:
            client_dao = ClientDao()
            return client_dao.get_client_id(user_id)
        
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_client_id: {e}")
        
    
    def get_filtered_cars(self, price_range=None, kilometers_range=None, fuel_type=None,
                          consume_range=None, autonomy_range=None, environmental_label=None,
                          brand=None, model=None, search_text=None):
        
        return ProductDao().get_filtered_cars(
            price_range=price_range,
            kilometers_range=kilometers_range,
            fuel_type=fuel_type,
            consume_range=consume_range,
            autonomy_range=autonomy_range,
            environmental_label=environmental_label,
            brand=brand,
            model=model,
            search_text=search_text
        )
    
    def get_filtered_others(self, price_range=None, size_range=None, brand=None, model=None):
        return ProductDao().get_filtered_others(
            price_range=price_range,
            size_range=size_range,
            brand=brand,
            model=model
        )

    def update_user_profile(self, user_id:int, username:str, email:str, phone:str) -> bool:
        """Método que actualiza el perfil del usuario."""
        try:
            admin_dao = UserDao()
            return admin_dao.update_user_profile(user_id, username, email, phone)
        
        except Exception as e:
            raise Exception(f"Error in BusinessObject.update_user_profile: {e}")
    
    def get_client_products(self, client_id:int) -> ProductDao:
        """Obtiene los productos del cliente"""

        try:
            product_dao = ProductDao()
            return product_dao.get_client_products(client_id)
        
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_client_products: {e}")
        
    def delete_product(self, product_id:int) -> bool:
        """Elimina un producto de la base de datos."""
        try:
            product_dao = ProductDao()
            return product_dao.delete_product(product_id)

        except Exception as e:
            raise Exception(f"Error in BusinessObject.delete_product: {e}")
        
    def buy_product(self, product_id:int, client_id:int) -> bool:
        """Registra la compra de un producto por parte de un cliente."""
        try:
            product_dao = ProductDao()
            return product_dao.buy_product(client_id, product_id)
        
        except Exception as e:
            raise Exception(f"Error in BusinessObject.buy_product: {e}")
        
    def get_owner_id(self, product_id: int) -> int:
        """Obtiene el ID del propietario de un producto."""
        
        try:
            product_dao = ProductDao()
            return product_dao.get_owner_id(product_id)

        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_owner_id: {e}")
        
    def get_saldo_cliente(self, client_id:int) -> float:
        """Obtiene el saldo de un cliente."""
        try:
            client_dao = ClientDao()
            return client_dao.get_saldo(client_id)

        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_saldo_cliente: {e}")
        
    def update_client_stats(self, user_id:int, nuevo_saldo:float) -> bool:
        """Actualiza las estadísticas de un cliente."""
        try:
            client_dao = ClientDao()
            return client_dao.update_saldo(user_id, nuevo_saldo)

        except Exception as e:
            raise Exception(f"Error in BusinessObject.update_client_stats: {e}")
        
    def get_top_buyer(self, start_date: str, end_date: str):
        """Obtiene el cliente que más ha comprado entre dos fechas."""
        try:
            report_dao = ReportDao()
            return report_dao.get_top_buyer(start_date, end_date)
        
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_top_buyer: {e}")

    def get_top_seller(self, start_date: str, end_date: str):
        try:
            report_dao = ReportDao()
            return report_dao.get_top_seller(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_top_seller: {e}")

    def get_top_brand(self, start_date: str, end_date: str):
        try:
            report_dao = ReportDao()
            return report_dao.get_top_brand(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_top_brand: {e}")

    def get_daily_sales(self, start_date: str, end_date: str):
        try:
            report_dao = ReportDao()
            return report_dao.get_daily_sales(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_daily_sales: {e}")

    def get_totals(self, start_date: str, end_date: str):
        try:
            report_dao = ReportDao()
            return report_dao.get_totals(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_totals: {e}")

    def get_purchase_date(self, start_date: str, end_date: str):
        try:
            report_dao = ReportDao()
            return report_dao.get_purchase_date(start_date, end_date)
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_purchase_date: {e}")
        
    def get_employee_services(self, client_id:int) -> list:
        try:
            service_dao = ServiceDao()
            return service_dao.get_employee_services(client_id)
        
        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_employee_services: {e}")
        
    def delete_service(self, service_id:int) -> bool:
        try:
            service_dao = ServiceDao()
            return service_dao.delete_service(service_id)

        except Exception as e:
            raise Exception(f"Error in BusinessObject.delete_service: {e}")

    def get_employees_by_admin_id(self, admin_id:int) -> list:
        """Obtiene los empleados a partir de su ID de administrador."""

        try:
            employee_dao = EmployeeDao()

            return employee_dao.get_employees_by_admin_id(admin_id)

        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_employees_by_admin_id: {e}")
    
    def delete_employee(self, employee_id:int) -> bool:
        try:
            service_dao = ServiceDao()
            employee_dao = EmployeeDao()

            # Primero eliminamos los servicios asociados al empleado, en caso de que existan
            service_dao.delete_service_by_employee_id(employee_id)

            return employee_dao.delete_by_employee_id(employee_id)
        
            
        except Exception as e:
            raise Exception(f"Error in BusinessObject.delete_employee: {e}")
        
    def get_admin_id_by_user_id(self, user_id:int) -> int:
        try:
            admin_dao = AdminDao()
            return admin_dao.get_admin_id(user_id)

        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_admin_id_by_user_id: {e}")
        

    def get_employee_id_from_user_id(self, user_id:int) -> int:
        """Devuelve el ID del empleado dado su ID de usuario"""
        try:
            employee_dao = EmployeeDao()
            return employee_dao.get_employee_id_from_user_id(user_id)

        except Exception as e:
            raise Exception(f"Error in BusinessObject.get_employee_id_from_user_id: {e}")