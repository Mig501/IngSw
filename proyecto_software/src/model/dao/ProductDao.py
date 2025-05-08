#src/model/dao/ProductDao.py
from model.conexion.Conexion import Conexion
from model.vo.ProductVO import ProductVO
import jaydebeapi

class ProductDao(Conexion):

    # Be aware fo the names, due to this table is not created yet
    sql_insert = "INSERT INTO products (data) VALUES (?....)" 
    sql_delete = "DELETE FROM products WHERE zip_code = ?"
    # This query (update) could be used or not (depneds on the time left)
    sql_update = "UPDATE products SET data = ? WHERE zip_code = ?"
    # Los select depnderán de las consultas que se hagan en la apliación



    # We have to add the data type of the zip_code
    def insert(self, zip_code,  vo:ProductVO) -> bool:
        """Inserta un nuevo producto en la base de datos""" 
    
        cursor = self.getCursor()
    
        try:
            cursor.execute(self.sql_insert, [zip_code, vo.price, "rest of the data"])


        except Exception as e:
            raise Exception(f"Error insertando producto: {e}")

        finally:
            cursor.close()
        self.closeConnection()

    def delete_by_zip_code(self, zip_code:¿?) -> ¿?:
        """Elimina un producto de la base de datos dado su zip_code."""
        cursor = self.getCursor()
        rows = 0

        try:
            cursor.execute(self.sql_delete, [zip_code])
            rows = cursor.rowcount

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Delete error product with zip_code {zip_code}: {e}")
        
        except Exception as e:
            raise Exception(f"Delete error product with zip_code {zip_code}: {e}")
        
        finally:
            if cursor:
                cursor.close()
            self.closeConnection()

        return rows

    def consult_product_by_params(self, **args) -> list:
        """Consulta los productos de la base de datos según los parámetros/filtros que se le pasen.
        Se pueden pasar varios parámetros, y se generará una consulta SQL con los filtros correspondientes.
        args: diccionario con los parámetros de búsqueda.
        """
        # args = {"zip_code": "12345", "price": 100, ...}
        cursor = self.getCursor()
        columns = list(args.keys())
        values = list(args.values())
        query_products = []

        # Creamos la consulta SQL con los filtros que se le pasen
        sql_query = "SELECT * FROM products WHERE "
        for i, column in enumerate(columns):
            sql_query += f"{column} = ?"
            if i < len(columns) - 1:
                sql_query += " AND "

        try:
            cursor.execute(self.sql_select_consult_args, args)
            rows = cursor.fetchall()

            for row in rows:
                row = list(row)
                product = ProductVO(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8])
                query_products.append(product)

        except jaydebeapi.DatabaseError as e:
            raise jaydebeapi.DatabaseError(f"Error in SELECT query: {e}")

        except Exception as e:
            raise Exception(f"Error in SELECT query: {e}")

        finally:
            if cursor:
                cursor.close()
            self.closeConnection()
            
        if not query_products:
            print("No se han encontrado productos con los parámetros dados.")
            return None

        print(f"Se han encontrado {len(query_products)}.")

        return query_products