from model.conexion.Conexion import Conexion

class ClientDao(Conexion):

    sql_delete = "DELETE FROM clients WHERE ClientID = ?"
    sql_insert = "INSERT INTO clients (ClientID, num_ventas, num_compras, saldo) VALUES (?, 0, 0, 0.00)"
    sql_update = "UPDATE clients SET num_ventas = ?, num_compras = ?, saldo = ? WHERE UserID = ?"

    def insert_client(self, user_id: int) -> bool:
        """
        Inserta un nuevo cliente con valores por defecto en la tabla `clients`.
        """
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_insert, [user_id])
        
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
