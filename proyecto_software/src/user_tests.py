from test.deleteUsers import test_delete_users, reset_autoincrement_if_empty
from test.showUsers import test_show_all_users

def main():
    option = input("Pulse 1 para ver todos los usuarios, pulse 2 para eliminar usuarios, pulse 3 para resetear autoincremento y otra cosa para salir: ")
    
    while option in ["1", "2", "3"]:
        if option == "1":
            test_show_all_users()

        elif option == "2":
            test_delete_users()

        else:
            reset_autoincrement_if_empty()

        option = input("Pulse 1 para ver todos los usuarios, pulse 2 para eliminar usuarios, pulse 3 para resetear autoincremento y otra cosa para salir: ")


if __name__ == "__main__":
    main()