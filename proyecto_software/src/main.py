import sys
from PyQt6.QtWidgets import QApplication
from model.BusinessObject import BusinessObject
from interface.windows.login.login_window import LoginWindow
from controller.CoordinadorPrincipal import CoordinadorPrincipal
import multiprocessing
from src.utils.server.verify_server import run_server

def main():
    # Iniciar servidor Flask en segundo plano
    flask_process = multiprocessing.Process(target=run_server)
    flask_process.start()

    # Crear la aplicación
    app = QApplication(sys.argv)

    # Cargar estilos
    with open("src/interface/style.css", "r") as f:
        app.setStyleSheet(f.read())

    # Crear modelo y vista
    modelo = BusinessObject()
    login_window = LoginWindow()

    # Crear controlador
    controlador = CoordinadorPrincipal(login_window, modelo)

    # Conexión de la señal del botón de inicio de sesión al método iniciarlogin
    login_window.login_screen.login_clicked.connect(controlador.iniciarlogin)
    login_window.show()

    # Ejecutar la aplicación
    exit_code = app.exec()

    # Al cerrar la app, detener el servidor Flask
    flask_process.terminate()
    flask_process.join()

    sys.exit(exit_code)

if __name__ == '__main__':
    main()