from PyQt6.QtWidgets import QApplication, QMainWindow
from PyQt6 import uic

# Cargar la interfaz generada desde el archivo .ui
Form, Window = uic.loadUiType("./src/interface/ui/Login.ui")

class MiVentana(QMainWindow, Form):
    def __init__(self):
        super().__init__()
        self.setupUi(self)  # Inicializa los widgets

        # Conectar el botón a la función
        self.aceptar.clicked.connect(self.on_button_click) # Cualquier instancia de botton cuando se clica registra el evento


    def on_button_click(self):
        print("Botón presionado")
        texto_area = self.nombre_usuario.text() #Obtener el texto del campo nombre
        print("El user es: ", end="")
        print(texto_area)


if __name__ == "__main__":
    app = QApplication([])
    ventana = MiVentana()
    ventana.show()
    app.exec()