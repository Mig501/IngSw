# src/main.py

import sys
from PyQt6.QtWidgets import QApplication
from frontend.main_window import MainWindow

def main():
    app = QApplication(sys.argv)

    # Cargar el archivo de estilos si existe
    try:
        with open("src/frontend/style.css", "r") as f:
            app.setStyleSheet(f.read())
    except FileNotFoundError:
        print("⚠️ No se encontró style.css. Continuando sin estilo personalizado.")

    window = MainWindow()
    window.show()
    sys.exit(app.exec())

if __name__ == "__main__":
    main()
