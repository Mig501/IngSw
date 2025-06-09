# src/main.py
import sys
from PyQt6.QtWidgets import QApplication
from model.BusinessObject import BusinessObject
from controller.ControladorPrincipal import ControladorPrincipal
import multiprocessing
from utils.server.verify_server import run_server

def main():
    # Iniciar servidor Flask en segundo plano
    flask_process = multiprocessing.Process(target=run_server)
    flask_process.start()

    # Crear la aplicación
    app = QApplication(sys.argv)

    try:
        with open("src/interface/style.css", "r") as f:
            app.setStyleSheet(f.read())
    except Exception as e:
        print(f"[ERROR] No se pudo cargar el CSS: {e}")

    # Crear modelo
    modelo = BusinessObject()

    # Crear el controlador principal y llamar a su método de inicio
    coordinador = ControladorPrincipal(modelo)
    coordinador.iniciar()

    # Ejecutar la aplicación
    exit_code = app.exec()

    # Al cerrar la app, detener el servidor Flask
    flask_process.terminate()
    flask_process.join()

    sys.exit(exit_code)

if __name__ == '__main__':
    main()
