#src/deleteUsers.py
from model.BusinessObject import BusinessObject

def test_delete_users():
    """Función para eliminar los usuarios que tengan los ids
    que se indiquen"""
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