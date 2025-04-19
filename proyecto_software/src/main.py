# src/main.py
from model.BusinessObject import BusinessObject
from PyQt6.QtWidgets import QApplication
from interface.windows.login.login_window import LoginWindow
from controller.CoordinadorPrincipal import CoordinadorPrincipal
import sys

def main():
    # Crear la aplicación
    app = QApplication(sys.argv)

    # Cargar estilos
    with open("src/interface/style.css", "r") as f:
        app.setStyleSheet(f.read())

    #login.show()
    #sys.exit(app.exec())
    
    # Crear modelo y vista
    modelo = BusinessObject()
    login_window = LoginWindow()

    # Crear controlador
    controlador = CoordinadorPrincipal(login_window, modelo)

    # Conexión de la señal del botón de inicio de sesión al método iniciarlogin
    login_window.login_screen.login_clicked.connect(controlador.iniciarlogin)
    login_window.show()

    # Ejecutar la aplicación
    sys.exit(app.exec())

if __name__ == '__main__':
    main()