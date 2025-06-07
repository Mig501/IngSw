# src/controller/main/MainController.py

from controller.main.ArchManageWorkshopController import ArchManageWorkshopController
from interface.windows.main_gui.screens.archManageWorkshop import ArchManageWorkshop

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

        # Configurar usuario
        self.vista.set_user(user_vo)

        # Conectar señales globales
        self.vista.sidebar_button_clicked.connect(self.navegar_a_pantalla)
        self.vista.logout_signal.connect(self.logout)

        # Subcontroladores de pantallas específicas
        self.subcontroladores = {}
        self.configurar_subcontroladores()

        # Mostrar pantalla inicial
        self.vista.stacked_widget.setCurrentIndex(0)

    def configurar_subcontroladores(self):
        """
        Inicializa los controladores específicos de pantallas que lo requieran.
        """
        for i, pantalla in enumerate(self.vista.screens):
            if isinstance(pantalla, ArchManageWorkshop):
                controlador = ArchManageWorkshopController(pantalla, self.modelo)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de ArchManageWorkshop asignado a índice {i}")

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
        Cierra la ventana principal y vuelve al login.
        """
        self.vista.close()
        self.coordinador.mostrar_login()
