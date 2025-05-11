from model.conexion.Conexion import Conexion
from model.vo.ProductVO import ProductVO
from model.vo.AutomobileVO import AutomobileVO
from model.vo.OtherProdVO import OtherProductVO
from model.dao.WorkshopDAO import WorkshopDao

class ProductDao(Conexion):

    # SQL de inserción en diferentes tablas
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
        INSERT INTO other_product (ProductID, size_of, used_for)
        VALUES (?, ?, ?)
    """

    sql_insert_image = """
        INSERT INTO pimage (ProductID, pimage)
        VALUES (?, ?)
    """

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

