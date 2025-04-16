# src/main.py
import sys
from PyQt6.QtWidgets import QApplication
from interface.windows.login.login_window import LoginWindow

def main():
    # Crear la aplicación
    app = QApplication(sys.argv)

    # Cargar estilos
    with open("src/interface/style.css", "r") as f:
        app.setStyleSheet(f.read())

    # Crear e iniciar ventana de login
    login_window = LoginWindow()
    login_window.show()

    # Ejecutar la aplicación
    sys.exit(app.exec())

if __name__ == '__main__':
    main()
