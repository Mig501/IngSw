# src/main.py

import sys
from PyQt6.QtWidgets import QApplication
from frontend.login_window import LoginWindow

def main():
    app = QApplication(sys.argv)

    # Cargar CSS si lo tienes
    with open("src/frontend/style.css", "r") as f:
        app.setStyleSheet(f.read())

    login = LoginWindow()
    login.show()

    sys.exit(app.exec())

if __name__ == '__main__':
    main()
