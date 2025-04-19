#src/deleteUsers.py
from model.BusinessObject import BusinessObject
from model.dao.UserDao import UserDao
from model.dao.ClientDao import ClientDao
from model.dao.EmployeeDao import EmployeeDao
from model.dao.ArchDao import ArchDao
from model.dao.UserDao import UserDao
from model.dao.AdminDao import AdminDao

def reset_autoincrement_if_empty():
    """Reinicia el autoincremento de la tabla users, clients, employees y
     archs si están vacía."""
    
    tables = {
        'users': UserDao(),
        'clients': UserDao(),
        'employees': EmployeeDao(),
        'archs': ArchDao(),
        'admins': AdminDao()
    }

    for table, dao in tables.items():
        cursor = dao.getCursor() # Obtenemos el cursor de la tabla correspondiente

        try:
            cursor.execute(f"SELECT COUNT(*) FROM {table}")
            count = cursor.fetchone()[0] # Obtenemos la cantidad de registros en la tabla

            if count == 0:
                cursor.execute(f"ALTER TABLE {table} AUTO_INCREMENT = 1")
                print(f"Se ha reiniciado el autoincremento de la tabla {table}.")

        finally:
            cursor.close() # Cerramos el cursor
            dao.closeConnection() # Cerramos la conexión a la base de datos


def test_delete_users():
    """Función que elimina los usuarios con ids ingresados por pantalla"""
    users_ids = []

    # Pedimos que se ingrese
    while True:
        user_id = input("Enter the ID of the user you want to delete: ")
        
        if user_id == "":
            break
        
        try:
            users_ids.append(int(user_id))

        except ValueError:
            print("Invalid input. Please enter a valid user ID.")

    if not users_ids:
        print("No user IDs provided. Exiting.")
        return

    # Creamos el objeto de negocio, que es el encargado de
    # encapsuar las reglas de negocio (lo que se puede o no hacer con los datos)
    business_object = BusinessObject()

    # Eliminamos los usuarios de la lista
    for user_id in users_ids:
        try:
            deleted = business_object.delete_user(user_id)
           
            if deleted:
                print(f"Usuario con ID {user_id} eliminado correctamente.")
            
            else:
                print(f"No se encontró usuario con ID {user_id}.")
        
        except Exception as e:
            print(f"Error al eliminar el usuario {user_id}: {e}")

if __name__ == "__main__":
    test_delete_users()
    reset_autoincrement_if_empty()