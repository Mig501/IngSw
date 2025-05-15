#imports
from model.conexion.Conexion import Conexion
from model.vo.ServiceVO import ServiceVO
from model.vo.EmployeeVO import EmployeeVO
from model.vo.ClientVO import ClientVO


class ServiceDao(Conexion):
    """Clase para manejar la tabla de servicios en la base de datos."""
    
    sql_insert = """INSERT INTO services (ServiceID, ServiceType, ServiceDate, ServiceTime, 
                    ServiceDescription, EmployeeID, ClientID) 
                    VALUES (?, ?, ?, ?, ?, ?, ?)"""
    
    sql_delete = "DELETE FROM services WHERE ServiceID = ?"

    sql_select_all = "SELECT * FROM services"
    
    def insert(self, service_id: int, service_vo: ServiceVO) -> bool:
        """Inserta un nuevo servicio en la base de datos."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_insert, [service_id, service_vo.service_type,
                                             service_vo.service_date, service_vo.service_time,
                                             service_vo.service_description, service_vo.employee_id,
                                             service_vo.client_id])
            
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando servicio: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete(self, service_id: int) -> bool:
        """Elimina un servicio de la base de datos dado su ID."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_delete, [service_id])
            return cursor.rowcount > 0
        
        finally:
            cursor.close()
            self.closeConnection()

    def select_all(self) -> list[ServiceVO]:
        """Selecciona todos los servicios de la base de datos."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_select_all)
            rows = cursor.fetchall()
            
            services = []
            for row in rows:
                service = ServiceVO(row[0], row[1], row[2], row[3], row[4], row[5], row[6])
                services.append(service)
            
            return services
        
        finally:
            cursor.close() 
            self.closeConnection()

    def get_employee_by_service_id(self, service_id: int) -> EmployeeVO:
        """Obtiene el empleado asociado a un servicio dado su ID."""
        cursor = self.getCursor()
        
        try:
            cursor.execute("SELECT EmployeeID FROM services WHERE ServiceID = ?", [service_id])
            employee_id = cursor.fetchone()
            
            if employee_id is None:
                raise Exception("No se encontró el empleado asociado al servicio.")
            
            return EmployeeVO(employee_id[0])
        
        finally:
            cursor.close()
            self.closeConnection()
    
    def get_client_by_service_id(self, service_id: int) -> ClientVO:
        """Obtiene el cliente asociado a un servicio dado su ID."""
        cursor = self.getCursor()
        
        try:
            cursor.execute("SELECT ClientID FROM services WHERE ServiceID = ?", [service_id])
            client_id = cursor.fetchone()
            
            if client_id is None:
                raise Exception("No se encontró el cliente asociado al servicio.")
            
            return ClientVO(client_id[0])
        
        finally:
            cursor.close()
            self.closeConnection()
    
    def reset_autoincrement_if_empty(self):
        """Esta función es solo para hacer pruebas nosotros"""
        cursor = self.getCursor()
        
        try:
            cursor.execute("SELECT COUNT(*) FROM services")
            count = cursor.fetchone()[0]
            
            if count == 0:  # Si no hay registros en la tabla, reiniciamos el autoincremento
                cursor.execute("ALTER TABLE services AUTO_INCREMENT = 1")
        
        finally:
            cursor.close()
            self.closeConnection()
            