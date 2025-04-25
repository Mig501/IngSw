# src/tests/test_select_users.py
from model.dao.UserDao import UserDao

def test_show_all_users() -> None:
    """Muestra todos los usuarios de la base de datos, en caso de que existan."""
    user_dao = UserDao() # Instanciamos la clase UserDao para acceder a tabla de usuario
    usuarios = user_dao.select() # Consulta que obtiene los usuarios

    if not usuarios:
        print("No hay usuarios en la base de datos.")
    
    else:
        print(f"Se encontraron {len(usuarios)} usuario(s):\n")
    
        for user in usuarios:
            print(f"ID: {user.user_id}, Usuario: {user.username}, Contraseña: {user.userpassword}, Email: {user.email}, Teléfono: {user.phone}, Rol: {user.rol}")