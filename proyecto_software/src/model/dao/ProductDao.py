from model.conexion.Conexion import Conexion
from model.vo.ProductVO import ProductVO
from model.vo.AutomobileVO import AutomobileVO
from model.vo.OtherProdVO import OtherProductVO
from model.dao.WorkshopDAO import WorkshopDao
from datetime import datetime

class ProductDao(Conexion):

    sql_insert_user_product = """
        INSERT INTO user_products (ProductID, ClientID, price, brand, model, year_manufacture, plocation, ptype, pdescription)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    """
    sql_insert_workshop_product = """
        INSERT INTO workshop_products (ProductID, WS_zip_code)
        VALUES (?, ?)
    """

    sql_insert_automobile = """
        INSERT INTO automovil (ProductID, kilometers, engine, consume, autonomy, enviormental_label)
        VALUES (?, ?, ?, ?, ?, ?)
    """

    sql_insert_other_product = """
        INSERT INTO other (ProductID, size_of, usedFor)
        VALUES (?, ?, ?)
    """
    sql_insert_image = """
        INSERT INTO pimage (ProductID, pimage)
        VALUES (?, ?)
    """
    sql_get_product_by_client_id = """
        SELECT * FROM user_products
        WHERE ClientID = ?
        AND vendido = FALSE
    """

    sql_delete_automobile = """DELETE FROM automovil WHERE ProductID = ?"""
    sql_delete_other_product = """DELETE FROM other WHERE ProductID = ?"""
    sql_delete_image = """DELETE FROM pimage WHERE ProductID = ?"""
    sql_delete_user_product = """DELETE FROM user_products WHERE ProductID = ?"""
    sql_delete_workshop_product = """DELETE FROM workshop_products WHERE ProductID = ?"""
    sql_buy_product = """INSERT INTO product_purchase (ClientID, ProductID, Purchase_date, Purchase_time)
                        VALUES (?, ?, ?, ?)"""

    def insert_product(self, product_vo: ProductVO) -> bool:
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
                WorkshopDao().get_zip_code()  # Obtener el código postal del taller
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
            print(f"Error insertando producto: {e}")
            return False  # Si hubo un error, devolvemos False
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_filtered_cars(self, price_range=None, kilometers_range=None, fuel_type=None,
                          consume_range=None, autonomy_range=None, environmental_label=None,
                          brand=None, model=None, search_text=None):
        
        cursor = self.getCursor()
        query = """
            SELECT up.*, pi.pimage, a.*
            FROM user_products up
            JOIN automovil a ON up.ProductID = a.ProductID
            LEFT JOIN pimage pi ON up.ProductID = pi.ProductID
            WHERE 1=1
        """
        params = []

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
    
    def get_client_products(self, client_id):
        """Obtiene los productos de un cliente específico"""

        cursor = self.getCursor()
        try:
            cursor.execute(self.sql_get_product_by_client_id, (client_id,))
            columns = [col[0] for col in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
            return results
        
        except Exception as e:
            print(f"Error obteniendo productos del cliente: {e}")
            return []

    def delete_product(self, product_id) -> bool:
        """Elimina un producto de la base de datos."""
        cursor = self.getCursor()
        try:
            print(f"Eliminando producto con ID: {product_id}")
            # Comprobamos el tipo de producto
            cursor.execute("SELECT ptype FROM user_products WHERE ProductID = ?", (product_id,))
            p_type = cursor.fetchone()

            if not p_type:
                print(f"Producto con ID {product_id} no encontrado.")
                return False
            
            p_type = p_type[0]

            # Borramos las tablas dependientes
            print(f"Eliminando imagen del producto con ID: {product_id}")
            cursor.execute(self.sql_delete_image, (product_id,))
            print(f"Eliminando producto del taller con ID: {product_id}")
            cursor.execute(self.sql_delete_workshop_product, (product_id,))
            
            # Borramos la tabla de producto en función del tipo
            if p_type == "automóviles":
                print("Eliminando producto de tipo automóvil")
                cursor.execute(self.sql_delete_automobile, (product_id,))
            
            else:
                cursor.execute(self.sql_delete_other_product, (product_id,))

            # Borramos el producto del usuario
            print(f"Eliminando producto del usuario con ID: {product_id}")
            cursor.execute(self.sql_delete_user_product, (product_id,))
            
            return cursor.rowcount > 0

        except Exception as e:
            print(f"Error eliminando producto: {e}")
            return False
        
        finally:
            cursor.close()
            self.closeConnection()

    def buy_product(self, buyer_id:int, product_id:int) -> bool:
        """Registra la compra de un producto por parte de un cliente."""

        cursor = self.getCursor()

        try:
            # Obtener el precio y propietario del producto
            cursor.execute("SELECT price, ClientID FROM user_products WHERE ProductID = ?", (product_id,))
            result = cursor.fetchone()
            
            if not result:
                raise Exception("Producto no encontrado.")
        
            price, seller_id = float(result[0]), int(result[1])

            # Obtenemos el saldo del cliente
            cursor.execute("SELECT saldo, num_compras FROM clients WHERE ClientID = ?", (buyer_id,))
            row = cursor.fetchone()
            if not row:
                raise Exception("Cliente comprador no encontrado.")
            
            saldo_comprador, compras_actuales = float(row[0]), int(row[1])


            # Verificamos si el comprador tiene suficiente saldo
            if saldo_comprador <= price:
                raise Exception("Saldo insuficiente para realizar la compra.")
            
            # Obtenemos el saldo y ventas del vendedor
            cursor.execute("SELECT saldo, num_ventas FROM clients WHERE ClientID = ?", (seller_id,))
            row = cursor.fetchone()
            if not row:
                raise Exception("Cliente vendedor no encontrado.")
            
            saldo_vendedor, ventas_actuales = float(row[0]), int(row[1])

            # Actualizamos el saldo del comprador
            nuevo_saldo_comprador = saldo_comprador - price
            nuevo_compras = compras_actuales + 1

            nuevo_saldo_vendedor = saldo_vendedor + price
            nuevo_ventas = ventas_actuales + 1

            cursor.execute(
                "UPDATE clients SET saldo = ?, num_compras = ? WHERE ClientID = ?",
                (nuevo_saldo_comprador, nuevo_compras, buyer_id)
            )

            cursor.execute(
                "UPDATE clients SET saldo = ?, num_ventas = ? WHERE ClientID = ?",
                (nuevo_saldo_vendedor, nuevo_ventas, seller_id)
            )

            # Registramos la compra en la tabla product_purchase
            date = datetime.now().date().strftime("%Y-%m-%d")
            time_ = datetime.now().time().strftime("%H:%M:%S")

            cursor.execute(self.sql_buy_product, (buyer_id, product_id, date, time_))

            # Marcamos el producto como vendido
            cursor.execute("UPDATE user_products SET vendido = TRUE WHERE ProductID = ?", (product_id,))
            return cursor.rowcount > 0

        except Exception as e:
            print(f"Error registrando compra: {e}")
            return False
        
        finally:
            cursor.close()
            self.closeConnection()

    def get_owner_id(self, product_id: int) -> int:
        """Obtiene el ClientID propietario del producto (ProductID)."""
        cursor = self.getCursor()
        try:
            cursor.execute("SELECT ClientID FROM user_products WHERE ProductID = ?", (product_id,))
            row = cursor.fetchone()
            return row[0] if row else None
        except Exception as e:
            print(f"Error obteniendo el ID del propietario del producto {product_id}: {e}")
            return None
        finally:
            cursor.close()
            self.closeConnection()
