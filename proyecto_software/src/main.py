# src/main.py
from model.BusinessObject import BusinessObject
import sys
from PyQt6.QtWidgets import QApplication
from interface.windows.login.login_window import LoginWindow

def main():
    app = QApplication(sys.argv)

    # Cargar CSS si lo tienes
    with open("src/interface/style.css", "r") as f:
        app.setStyleSheet(f.read())

    login = LoginWindow()
    login.show()

    sys.exit(app.exec())


if __name__ == '__main__':
    main()
