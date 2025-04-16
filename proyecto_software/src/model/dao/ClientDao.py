from model.conexion.Conexion import Conexion

class ClientDao(Conexion):
    def insert_client(self, user_id: int) -> bool:
        """
        Inserta un nuevo cliente con valores por defecto en la tabla `clients`.
        """
        cursor = self.getCursor()
        
        try:
            sql = """
            INSERT INTO clients (ClientID, num_ventas, num_compras, saldo)
            VALUES (?, 0, 0, 0.00)
            """
            cursor.execute(sql, [user_id])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error insertando cliente: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def update_client_stats(self, user_id: int, ventas: int, compras: int, saldo: float) -> bool:
        """
        Actualiza los datos de estadísticas de un cliente.
        """
        cursor = self.getCursor()
        
        try:
            sql = """
            UPDATE clients
            SET num_ventas = ?, num_compras = ?, saldo = ?
            WHERE UserID = ?
            """
        
            cursor.execute(sql, [ventas, compras, saldo, user_id])
        
            return cursor.rowcount > 0
        
        except Exception as e:
            raise Exception(f"Error actualizando cliente: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def delete_by_user_id(self, user_id: int) -> bool:
        cursor = self.getCursor()
        try:
            cursor.execute("DELETE FROM clients WHERE ClientID = ?", [user_id])
            return cursor.rowcount > 0
        finally:
            cursor.close()
            self.closeConnection()
