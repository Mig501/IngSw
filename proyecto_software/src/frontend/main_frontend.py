# src/frontend/main_frontend.py

import sys
from PyQt6.QtWidgets import QApplication, QMainWindow

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("BSA - Buy Sell Auto App")
        self.setGeometry(100, 100, 800, 600) # x, y, width, height: posiciones y tamaño de la ventana iniciales de la ventana

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())