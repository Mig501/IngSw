from model.conexion.Conexion import Conexion

class ClientDao(Conexion):

    sql_delete = "DELETE FROM clients WHERE ClientID = ?"
    sql_insert = "INSERT INTO clients (ClientID, num_ventas, num_compras, saldo, WS_zip_code) VALUES (?, 0, 0, 0.00, ?)"
    sql_update = "UPDATE clients SET num_ventas = ?, num_compras = ?, saldo = ? WHERE ClientID = ?"
    sql_consult_workshop = "SELECT WS_zip_code FROM workshop LIMIT 1"

    def insert_client(self, user_id: int) -> bool:
        """
        Inserta un nuevo cliente con valores por defecto en la tabla clients.
        """
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_consult_workshop)
            ws_zip_code = cursor.fetchone() # Me devuelve el único zip code de la tabla workshop
            
            if ws_zip_code is None:
                raise Exception("No se encontró el código postal del taller.")

            cursor.execute(self.sql_insert, [user_id, ws_zip_code[0]])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando cliente: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def update_client_stats(self, user_id: int, ventas: int, compras: int, saldo: float) -> bool:
        """Actualiza los datos de estadísticas de un cliente."""
        cursor = self.getCursor()
        try:
            cursor.execute(self.sql_update, [ventas, compras, saldo, user_id])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error actualizando cliente: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        """Elimina un cliente de la tabla clients por su ID de usuario."""
        cursor = self.getCursor()
        try:
            cursor.execute(self.sql_delete, [user_id])
        
            return cursor.rowcount > 0
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_client_id(self, user_id: int) -> int:
        """Obtiene el ClientID si coincide con el ClientID (caso actual)."""
        cursor = self.getCursor()
        try:
            cursor.execute("SELECT ClientID FROM clients WHERE ClientID = ?", (user_id,))
            client_id = cursor.fetchone()

            if client_id is None:
                raise Exception("No se encontró el ID del cliente.")

            return client_id[0]

        except Exception as e:
            raise Exception(f"Error obteniendo el ID del cliente: {e}")
    
        finally:
            cursor.close()
            self.closeConnection()

    def get_saldo(self, client_id: int) -> float:
        cursor = self.getCursor()
        try:
            cursor.execute("SELECT saldo FROM clients WHERE ClientID = ?", (client_id,))
            row = cursor.fetchone()
            return float(row[0]) if row else 0.0
        finally:
            cursor.close()
            self.closeConnection()

    def update_saldo(self, client_id: int, nuevo_saldo: float) -> bool:
        cursor = self.getCursor()
        try:
            cursor.execute("UPDATE clients SET saldo = ? WHERE ClientID = ?", (nuevo_saldo, client_id))
            return cursor.rowcount > 0
        finally:
            cursor.close()
            self.closeConnection()
