#src/model/dao/ServiceDao.py
from model.conexion.Conexion import Conexion
from model.vo.ServiceVO import ServiceVO
from model.vo.EmployeeVO import EmployeeVO
from model.vo.ClientVO import ClientVO


class ServiceDao(Conexion):
    """Clase para manejar la tabla de servicios en la base de datos."""
    
    sql_insert = """INSERT INTO services (EmployeeID, price, ser_name, ser_description) 
                    VALUES (?, ?, ?, ?)"""
    sql_select_all = "SELECT * FROM services"
    sql_select_by_id = "SELECT * FROM services WHERE EmployeeID = ?"
    sql_delete_by_id = "DELETE FROM services WHERE ServiceID = ?"
    sql_delete_by_employee_id = "DELETE FROM services WHERE EmployeeID = ?"
    
    def insert_service(self, service_vo: ServiceVO) -> bool:
        """Inserta un nuevo servicio en la base de datos."""
        cursor = self.getCursor()
        
        try: 
            cursor.execute(self.sql_insert, [service_vo.employeeid, service_vo.price, service_vo.name, service_vo.description])
            
            return cursor.rowcount > 0 
        
        except Exception as e:
            raise Exception(f"Error insertando servicio: {e}")
        
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
                service = ServiceVO(row[0], row[1], row[2], row[3], row[4], row[5])
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
            
    def get_employee_services(self, employee_id: int) -> list:
        """Obtiene todos los servicios asociados a un empleado dado su ID."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_select_by_id, [employee_id])
            cols = [column[0] for column in cursor.description] # Obtener nombres de columnas
            results = [dict(zip(cols, row)) for row in cursor.fetchall()] # Obtener filas como diccionarios

            return results

        finally:
            cursor.close()
            self.closeConnection()

    def delete_service(self, service_id:int) -> bool:
        """Elimina un servicio dado su ID."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_delete_by_id, [service_id])
            return cursor.rowcount > 0
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_service_by_employee_id(self, employee_id:int) -> bool:
        """Elimina todos los servicios asociados a un empleado dado su ID."""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_delete_by_employee_id, [employee_id])
            return cursor.rowcount > 0
        
        finally:
            cursor.close()
            self.closeConnection()
    
    def hire_service(self, service_id:int, client_id:int) -> bool:
        """Contrata un servicio dado su ID y el ID del cliente."""
        cursor = self.getCursor()
        
        try:
            #obtener el precio y el properietario del servicio
            cursor.execute("SELECT price, EmployeeID FROM services WHERE ServiceID = ?", [service_id])
            service = cursor.fetchone()
            if service is None:
                raise Exception("No se encontró el servicio.")
            
            price, employee_id = service

            #Obtener el saldo del cliente
            cursor.execute("SELECT balance FROM clients WHERE ClientID = ?", [client_id])
            client = cursor.fetchone()
            if client is None:
                raise Exception("No se encontró el cliente.")
            
            balance = client[0]
            if balance < price:
                raise Exception("El saldo del cliente es insuficiente para contratar el servicio.")
            
            #Actualizar el saldo del cliente
            new_balance = balance - price
            cursor.execute("UPDATE clients SET balance = ? WHERE ClientID = ?", [new_balance, client_id])

        
            #Actualizar el servicio 'estado' como contratado
            cursor.execute("UPDATE services SET estado = 'contratado' WHERE ServiceID = ?", [service_id])
            return cursor.rowcount > 0

        except Exception as e:
            return False
        
        finally:
            cursor.close()
            self.closeConnection()