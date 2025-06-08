# src/model/dao/ServiceDao.py

from model.conexion.Conexion import Conexion
from model.vo.ServiceVO import ServiceVO
from model.vo.EmployeeVO import EmployeeVO
from model.vo.ClientVO import ClientVO

class ServiceDao(Conexion):
    """DAO para manejar operaciones con la tabla de servicios."""

    sql_insert = """INSERT INTO services (EmployeeID, price, ser_name, ser_description) 
                    VALUES (?, ?, ?, ?)"""
    sql_select_all = "SELECT * FROM services"
    sql_select_by_id = "SELECT * FROM services WHERE EmployeeID = ?"
    sql_delete_by_id = "DELETE FROM services WHERE ServiceID = ?"
    sql_delete_by_employee_id = "DELETE FROM services WHERE EmployeeID = ?"

    def insert_service(self, service_vo: ServiceVO) -> bool:
        cursor = self.getCursor()
        try: 
            cursor.execute(self.sql_insert, [
                service_vo.employeeid,
                service_vo.price,
                service_vo.name,
                service_vo.description
            ])
            return cursor.rowcount > 0 
        
        except Exception as e:
            raise Exception(f"Error insertando servicio: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def select_all(self) -> list[ServiceVO]:
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_select_all)
            rows = cursor.fetchall()
            return [ServiceVO(*row) for row in rows]
        
        finally:
            cursor.close() 
            self.closeConnection()

    def get_employee_by_service_id(self, service_id: int) -> EmployeeVO:
        cursor = self.getCursor()
        
        try:
            cursor.execute("SELECT EmployeeID FROM services WHERE ServiceID = ?", [service_id])
            row = cursor.fetchone()
            if row is None:
                raise Exception("No se encontró el empleado asociado al servicio.")
            return row[0]
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_client_by_service_id(self, service_id: int) -> ClientVO:
        cursor = self.getCursor()
        
        try:
            cursor.execute("SELECT ClientID FROM services WHERE ServiceID = ?", [service_id])
            row = cursor.fetchone()
        
            if row is None:
                raise Exception("No se encontró el cliente asociado al servicio.")
            return ClientVO(row[0])
        
        finally:
            cursor.close()
            self.closeConnection()

    def reset_autoincrement_if_empty(self):
        cursor = self.getCursor()
        try:
            cursor.execute("SELECT COUNT(*) FROM services")
            if cursor.fetchone()[0] == 0:
                cursor.execute("ALTER TABLE services AUTO_INCREMENT = 1")
        finally:
            cursor.close()
            self.closeConnection()

    def get_employee_services(self, employee_id: int) -> list:
        cursor = self.getCursor()
        try:
            cursor.execute(self.sql_select_by_id, [employee_id])
            cols = [column[0] for column in cursor.description]
            return [dict(zip(cols, row)) for row in cursor.fetchall()]
        finally:
            cursor.close()
            self.closeConnection()

    def delete_service(self, service_id: int) -> bool:
        cursor = self.getCursor()
        try:
            cursor.execute(self.sql_delete_by_id, [service_id])
            return cursor.rowcount > 0
        finally:
            cursor.close()
            self.closeConnection()

    def delete_service_by_employee_id(self, employee_id: int) -> bool:
        cursor = self.getCursor()
        try:
            cursor.execute(self.sql_delete_by_employee_id, [employee_id])
            return True
        finally:
            cursor.close()
            self.closeConnection()

    def hire_service(self, service_id: int, client_id: int) -> bool: 
        cursor = self.getCursor()
        try:
            print(f"DEBUG - Iniciando contratación: servicio {service_id}, cliente {client_id}")

            # Obtener precio y empleado
            cursor.execute("SELECT price FROM services WHERE ServiceID = ?", [service_id])
            service = cursor.fetchone()
            if service is None:
                print("DEBUG - Servicio no encontrado.")
                return False
            price = service[0]
            print(f"DEBUG - Precio del servicio: {price}")

            # Obtener saldo del cliente
            cursor.execute("SELECT saldo FROM clients WHERE ClientID = ?", [client_id])
            client = cursor.fetchone()
            if client is None:
                print("DEBUG - Cliente no encontrado.")
                return False
            balance = client[0]
            print(f"DEBUG - Saldo del cliente: {balance}")

            # Verificar saldo suficiente
            if balance < price:
                print("DEBUG - Saldo insuficiente.")
                return False

            # Actualizar saldo y marcar como contratado
            new_balance = balance - price
            cursor.execute("UPDATE clients SET saldo = ? WHERE ClientID = ?", [new_balance, client_id])
            cursor.execute("UPDATE services SET estado = 'contratado' WHERE ServiceID = ?", [service_id])

            print("DEBUG - Contratación completada.")
            return True

        except Exception as e:
            print(f"ERROR - Excepción durante contratación: {e}")
            return False

        finally:
            cursor.close()
            self.closeConnection()

    def get_filtered_services(self, **filters) -> list:
        """
        Devuelve una lista de servicios **no contratados** filtrados dinámicamente por:
            - name (str): búsqueda parcial por nombre del servicio
            - price_range (tuple): (min_price, max_price)
        """
        cursor = self.getCursor()
        try:
            query = """
                SELECT s.ServiceID, s.EmployeeID, s.price, s.ser_name, s.ser_description
                FROM services s
                WHERE s.estado = 'pendiente'
            """
            conditions = []
            params = []

            # Filtro por nombre
            if "name" in filters and filters["name"].strip():
                conditions.append("LOWER(s.ser_name) LIKE ?")
                params.append(f"%{filters['name'].strip().lower()}%")

            # Filtro por rango de precio
            if "price_range" in filters:
                min_price, max_price = filters["price_range"]
                if min_price is not None:
                    conditions.append("s.price >= ?")
                    params.append(min_price)
                if max_price is not None:
                    conditions.append("s.price <= ?")
                    params.append(max_price)

            # Agregar condiciones al query si hay
            if conditions:
                query += " AND " + " AND ".join(conditions)

            cursor.execute(query, params)
            columns = [col[0] for col in cursor.description]
            return [dict(zip(columns, row)) for row in cursor.fetchall()]

        except Exception as e:
            raise Exception(f"Error en get_filtered_services: {e}")
        finally:
            cursor.close()
            self.closeConnection()
