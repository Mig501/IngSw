# src/controller/main/MainController.py

from controller.main.ArchManageWorkshopController import ArchManageWorkshopController
from interface.windows.main_gui.screens.archManageWorkshop import ArchManageWorkshop
from controller.main.AdminManageWorkshopController import AdminManageWorkshopController  # NUEVO
from interface.windows.main_gui.screens.adminManageWorkshop import AdminManageWorkshop  # NUEVO
from controller.main.BackupController import BackupController
from interface.windows.main_gui.screens.archBackupScreen import BackupScreen
from controller.main.ArchRegisterController import ArchRegisterController
from interface.windows.main_gui.screens.archRegisterScreen import ArchRegisterScreen
from controller.main.ArchDeleteAdminController import ArchDeleteAdminController
from interface.windows.main_gui.screens.archDeleteAdmins import ArchDeleteAdminScreen
from controller.main.LogViewerController import LogViewerController
from interface.windows.main_gui.screens.logViewerScreen import LogViewerScreen
from model.conexion.Conexion import Conexion

class MainController:
    """
    Controlador de la ventana principal.
    Gestiona la navegación entre pantallas y acciones del usuario.
    """

    def __init__(self, main_window, modelo, coordinador, user_vo, conexion: Conexion):
        self.vista = main_window
        self.modelo = modelo
        self.coordinador = coordinador
        self.user_vo = user_vo
        self.conexion = conexion

        # Configurar usuario en la vista
        self.vista.set_user(user_vo)

        # Conectar señales globales
        self.vista.sidebar_button_clicked.connect(self.navegar_a_pantalla)
        self.vista.logout_signal.connect(self.logout)

        # Subcontroladores de pantallas específicas
        self.subcontroladores = {}
        self.configurar_subcontroladores()

        # Mostrar pantalla inicial (Home)
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
        Cierra la ventana principal y vuelve al login.
        """
        self.vista.close()
        self.coordinador.mostrar_login()

    def configurar_subcontroladores(self):
        """
        Inicializa los controladores específicos de pantallas que lo requieran.
        """
        for i, pantalla in enumerate(self.vista.screens):
            if isinstance(pantalla, ArchManageWorkshop):
                controlador = ArchManageWorkshopController(pantalla, self.modelo)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de ArchManageWorkshop asignado a índice {i}")

            elif isinstance(pantalla, AdminManageWorkshop):  # NUEVO
                controlador = AdminManageWorkshopController(pantalla)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de AdminManageWorkshop asignado a índice {i}")

            elif isinstance(pantalla, BackupScreen):
                controlador = BackupController(
                    pantalla,
                    self.conexion.get_db_name(),
                    self.conexion.get_db_user(),
                    self.conexion.get_db_password()
                )
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de BackupScreen asignado a índice {i}")

            elif isinstance(pantalla, ArchRegisterScreen):
                controlador = ArchRegisterController(pantalla)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de ArchRegisterScreen asignado a índice {i}")

            elif isinstance(pantalla, ArchDeleteAdminScreen):
                controlador = ArchDeleteAdminController(pantalla)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de ArchDeleteAdminScreen asignado a índice {i}")

            elif isinstance(pantalla, LogViewerScreen):
                controlador = LogViewerController(pantalla)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de LogViewerScreen asignado a índice {i}")
