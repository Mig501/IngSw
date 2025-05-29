from model.conexion.Conexion import Conexion
from model.vo.ProductVO import ProductVO
from model.vo.AutomobileVO import AutomobileVO
from model.vo.OtherProdVO import OtherProductVO

class ProductDao(Conexion):

    sql_insert_user_product = """
        INSERT INTO user_products (ProductID, ClientID, price, brand, model, year_manufacture, plocation, ptype, pdescription)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"""
    sql_insert_workshop_product = """
        INSERT INTO workshop_products (ProductID, WS_zip_code)
        VALUES (?, ?)"""
    sql_insert_automobile = """
        INSERT INTO automovil (ProductID, kilometers, engine, consume, autonomy, enviormental_label)
        VALUES (?, ?, ?, ?, ?, ?)"""
    sql_insert_other_product = """
        INSERT INTO other (ProductID, size_of, usedFor)
        VALUES (?, ?, ?)"""
    sql_insert_image = """
        INSERT INTO pimage (ProductID, pimage)
        VALUES (?, ?)"""
    sql_get_product_by_client_id = """
        SELECT * FROM user_products
        WHERE ClientID = ?
        AND vendido = FALSE"""
    sql_delete_automobile = """DELETE FROM automovil WHERE ProductID = ?"""
    sql_delete_other_product = """DELETE FROM other WHERE ProductID = ?"""
    sql_delete_image = """DELETE FROM pimage WHERE ProductID = ?"""
    sql_delete_user_product = """DELETE FROM user_products WHERE ProductID = ?"""
    sql_delete_workshop_product = """DELETE FROM workshop_products WHERE ProductID = ?"""
    sql_buy_product = """INSERT INTO product_purchase (ClientID, ProductID, Purchase_date, Purchase_time)
                        VALUES (?, ?, ?, ?)"""

    sql_get_zip_code = """
        SELECT WS_zip_code FROM workshop LIMIT 1
    """

    def insert_product(self, product_vo: ProductVO, ws_zip_code:str) -> bool:
        """Inserta un producto en la base de datos."""
        cursor = self.getCursor()
        try:
            # Insertar en la tabla de productos de usuario
            cursor.execute(self.sql_insert_user_product, (
                product_vo.product_id,
                product_vo.client_id,
                product_vo.price,
                product_vo.brand,
                product_vo.model,
                product_vo.year_manufacture,
                product_vo.plocation,
                product_vo.ptype,
                product_vo.pdescription
            ))

            # Obtener el ProductID generado automáticamente
            cursor.execute("SELECT MAX(ProductID) FROM user_products")
            product_id = cursor.fetchone()[0]
            print(f"Product ID: {product_id}")

            # Insertar en la tabla de productos del taller
            cursor.execute(self.sql_insert_workshop_product, (
                product_id,
                ws_zip_code
            ))

            # Insertar en la tabla específica según el tipo de producto
            if isinstance(product_vo, AutomobileVO):
                # Producto es un automóvil, insertamos en la tabla automovil
                cursor.execute(self.sql_insert_automobile, (
                    product_id,
                    product_vo.kilometers,
                    product_vo.engine,
                    product_vo.consume,
                    product_vo.autonomy,
                    product_vo.environnmental_label
                ))

            elif isinstance(product_vo, OtherProductVO):
                # Producto es otro tipo de producto, insertamos en la tabla other_product
                cursor.execute(self.sql_insert_other_product, (
                    product_id,
                    product_vo.size_of,
                    product_vo.used_for
                ))

            # Insertar la imagen del producto
            cursor.execute(self.sql_insert_image, (
                product_id,
                product_vo.image_path
            ))

            return True  # Si todo fue exitoso, devolvemos True

        except Exception as e:
            cursor.rollback()
            print(f"Error insertando producto: {e}")
            return False  # Si hubo un error, devolvemos False
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_filtered_cars(self, price_range=None, kilometers_range=None, fuel_type=None,
                          consume_range=None, autonomy_range=None, environmental_label=None,
                          brand=None, model=None, search_text=None) -> list:
        """Obtiene una lista de automóviles filtrados según los criterios proporcionados."""
        
        cursor = self.getCursor()
        query = """
            SELECT up.*, pi.pimage, a.*
            FROM user_products up
            JOIN automovil a ON up.ProductID = a.ProductID
            LEFT JOIN pimage pi ON up.ProductID = pi.ProductID
            WHERE 1=1
        """
        params = []

        # Construimos la consulta según los filtros proporcionados
        if price_range:
            query += " AND up.price BETWEEN ? AND ?"
            params.extend(price_range)

        if kilometers_range:
            query += " AND a.kilometers BETWEEN ? AND ?"
            params.extend(kilometers_range)

        if fuel_type:
            query += " AND LOWER(a.engine) = ?"
            params.append(fuel_type.lower())

        if consume_range:
            query += " AND a.consume BETWEEN ? AND ?"
            params.extend(consume_range)

        if autonomy_range:
            query += " AND a.autonomy BETWEEN ? AND ?"
            params.extend(autonomy_range)

        if environmental_label:
            query += " AND a.enviormental_label = ?"
            params.append(environmental_label)

        if brand:
            query += " AND LOWER(up.brand) LIKE ?"
            params.append(f"%{brand.lower()}%")

        if model:
            query += " AND LOWER(up.model) LIKE ?"
            params.append(f"%{model.lower()}%")

        if search_text:
            query += " AND (LOWER(up.brand) LIKE ? OR LOWER(up.model) LIKE ?)"
            params.append(f"%{search_text.lower()}%")
            params.append(f"%{search_text.lower()}%")

        query += " AND up.vendido = FALSE"

        cursor.execute(query, params)
        columns = [col[0] for col in cursor.description] # Obtengo los nombres de las columnas
        results = [dict(zip(columns, row)) for row in cursor.fetchall()]
        return results

    def get_filtered_others(self, price_range=None, size_range=None, brand=None, model=None) -> list:
        """Obtiene una lista de otros productos filtrados según los criterios proporcionados."""

        cursor = self.getCursor()
        query = """
            SELECT up.*, pi.pimage, o.*
            FROM user_products up
            JOIN other o ON up.ProductID = o.ProductID
            LEFT JOIN pimage pi ON up.ProductID = pi.ProductID
            WHERE 1=1
        """
        params = []

        # Construimos la consulta según los filtros proporcionados
        if price_range:
            query += " AND up.price BETWEEN ? AND ?"
            params.extend(price_range)

        if size_range:
            query += " AND o.size_of BETWEEN ? AND ?"
            params.extend(size_range)

        if brand:
            query += " AND LOWER(up.brand) LIKE ?"
            params.append(f"%{brand.lower()}%")

        if model:
            query += " AND LOWER(up.model) LIKE ?"
            params.append(f"%{model.lower()}%")

        query += " AND up.vendido = FALSE"

        cursor.execute(query, params)
        columns = [col[0] for col in cursor.description] # Obtengo los nombres de las columnas
        results = [dict(zip(columns, row)) for row in cursor.fetchall()]
        return results

    def get_client_products(self, client_id:int) -> list:
        """Obtiene los productos de un cliente específico"""
        cursor = self.getCursor()
        
        try:
            cursor.execute(self.sql_get_product_by_client_id, (client_id,))
            columns = [col[0] for col in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
            
            return results
        
        except Exception as e:
            cursor.rollback()
            raise Exception(f"Error obteniendo productos del cliente: {e}")
        
    def delete_product(self, product_id) -> bool:
        """Elimina un producto de la base de datos."""
        cursor = self.getCursor()
        try:
            # Comprobamos el tipo de producto
            cursor.execute("SELECT ptype FROM user_products WHERE ProductID = ?", (product_id,))
            p_type = cursor.fetchone()

            if not p_type:
                print(f"Producto con ID {product_id} no encontrado.")
                return False
            
            p_type = p_type[0]

            # Borramos las tablas dependientes
            cursor.execute(self.sql_delete_image, (product_id,))
            cursor.execute(self.sql_delete_workshop_product, (product_id,))
            
            # Borramos la tabla de producto en función del tipo
            if p_type == "automóviles":
                cursor.execute(self.sql_delete_automobile, (product_id,))
            
            else:
                cursor.execute(self.sql_delete_other_product, (product_id,))

            # Borramos el producto del usuario
            cursor.execute(self.sql_delete_user_product, (product_id,))
            
            return cursor.rowcount > 0

        except Exception as e:
            cursor.rollback()
            raise Exception(f"Error eliminando producto: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def buy_product(self, buyer_id:int, product_id:int, date:str, time:str) -> bool:
        """Registra la compra de un producto por parte de un cliente."""
        cursor = self.getCursor()
        try:
            # Insertamos la compra en la tabla product_purchase
            cursor.execute(self.sql_buy_product, (buyer_id, product_id, date, time))

            # Actualizamos el estado del producto a vendido
            cursor.execute("UPDATE user_products SET vendido = TRUE WHERE ProductID = ?", (product_id,))

            return cursor.rowcount > 0  # Retorna True si se actualizó al menos una fila
        
        except Exception as e:
            cursor.rollback()
            raise Exception(f"Error registrando compra: {e}")

    def get_owner_id(self, product_id: int) -> int:
        """Obtiene el ClientID propietario del producto (ProductID)."""
        cursor = self.getCursor()
        
        try:
            cursor.execute("SELECT ClientID FROM user_products WHERE ProductID = ?", (product_id,))
            row = cursor.fetchone()
            return row[0] if row else None
        
        except Exception as e:
            cursor.rollback()
            raise Exception(f"Error obteniendo el propietario del producto: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_product_price(self, product_id: int) -> float:
        """Obtiene el precio de un producto dado su ProductID."""
        cursor = self.getCursor()
        
        try:
            cursor.execute("SELECT price FROM user_products WHERE ProductID = ?", (product_id,))
            row = cursor.fetchone()
            return row[0] if row else None

        except Exception as e:
            cursor.rollback()
            raise Exception(f"Error obteniendo el precio del producto: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_workshop_zip_code(self) -> str:
        """Obtiene el código postal del taller asociado a un producto dado su ProductID."""
        cursor = self.getCursor()

        try:
            cursor.execute(self.sql_get_zip_code)
            row = cursor.fetchone()
            
            return row[0] if row else None
        
        except Exception as e:
            cursor.rollback()
            raise Exception(f"Error obteniendo el código postal del taller: {e}")
        
        finally:
            cursor.close()
            self.closeConnection()
