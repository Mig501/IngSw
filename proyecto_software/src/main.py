# src/main.py
from model.BusinessObject import BussinesObject
import sys
from PyQt6.QtWidgets import QApplication
from frontend.windows.login.login_window import LoginWindow

def main():
    app = QApplication(sys.argv)

    # Cargar CSS si lo tienes
    with open("src/frontend/style.css", "r") as f:
        app.setStyleSheet(f.read())

    login = LoginWindow()
    login.show()

    sys.exit(app.exec())

    # Probar select, insert
    BusinessObject().pruebainsert()
    BusinessObject().pruebaselect()
    BusinessObject().Comprobarlogin()

if __name__ == '__main__':
    main()
