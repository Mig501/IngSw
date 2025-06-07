# src/controller/main/MainController.py

class MainController:
    """
    Controlador de la ventana principal.
    Gestiona la navegación entre pantallas y acciones del usuario.
    """

    def __init__(self, main_window, modelo, coordinador, user_vo):
        self.vista = main_window
        self.modelo = modelo
        self.coordinador = coordinador
        self.user_vo = user_vo

        # Configura los datos del usuario en la vista
        self.vista.set_user(user_vo)

        # Conectar señales a métodos del controlador
        self.vista.sidebar_button_clicked.connect(self.navegar_a_pantalla)
        self.vista.logout_signal.connect(self.logout)

        # Cargar la pantalla inicial (índice 0)
        self.vista.stacked_widget.setCurrentIndex(0)

    def navegar_a_pantalla(self, index: int):
        """
        Cambia la vista del cuerpo principal según el índice del sidebar.
        """
        try:
            self.vista.stacked_widget.setCurrentIndex(index)
        except Exception as e:
            print(f"[ERROR] No se pudo cambiar a la pantalla índice {index}: {e}")

    def logout(self):
        """
        Cierra la ventana principal y vuelve a mostrar la pantalla de login.
        """
        self.vista.close()
        self.coordinador.mostrar_login()
