from PyQt6.QtWidgets import QApplication, QMainWindow
from PyQt6 import uic
from src.interface.Login import Login


if __name__ == "__main__":
    app = QApplication([])
    ventana = Login()
    ventana.show()
    app.exec()