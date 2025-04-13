# src/tests/test_select_users.py

from model.dao.UserDao import UserDao

def test_ver_usuarios():
    user_dao = UserDao()
    usuarios = user_dao.select()

    if not usuarios:
        print("No hay usuarios en la base de datos.")
    else:
        print(f"Se encontraron {len(usuarios)} usuario(s):\n")
        for user in usuarios:
            print(f"ID: {user.user_id}, Usuario: {user.username}, Contraseña: {user.userpassword}, Email: {user.email}, Teléfono: {user.phone}")

if __name__ == '__main__':
    test_ver_usuarios()
