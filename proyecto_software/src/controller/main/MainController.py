from controller.main.ArchManageWorkshopController import ArchManageWorkshopController
from controller.main.AdminManageWorkshopController import AdminManageWorkshopController
from controller.main.BackupController import BackupController
from controller.main.ArchRegisterController import ArchRegisterController
from controller.main.ArchDeleteAdminController import ArchDeleteAdminController
from controller.main.LogViewerController import LogViewerController
from controller.main.AdminRegisterEmployeeController import AdminRegisterEmployeeController
from controller.main.AdminMyEmployeesController import AdminMyEmployeesController
from controller.main.AdminReportController import AdminReportController
from controller.main.ServiceRegisterController import ServiceRegisterController
from controller.main.ClientMyServicesController import ClientMyServicesController
from controller.main.EditProfileController import EditProfileController
from controller.main.ProductRegisterController import ProductRegisterController
from interface.windows.main_gui.screens.archManageWorkshop import ArchManageWorkshop
from interface.windows.main_gui.screens.adminManageWorkshop import AdminManageWorkshop
from interface.windows.main_gui.screens.archBackupScreen import BackupScreen
from interface.windows.main_gui.screens.archRegisterScreen import ArchRegisterScreen
from interface.windows.main_gui.screens.archDeleteAdmins import ArchDeleteAdminScreen
from interface.windows.main_gui.screens.logViewerScreen import LogViewerScreen
from interface.windows.main_gui.screens.adminRegisterScreen import AdminRegisterEmployeeScreen
from interface.windows.main_gui.screens.adminMyEmployeesScreen import MyEmployeesScreen
from interface.windows.main_gui.screens.adminReportScreen import AdminReportScreen
from interface.windows.main_gui.screens.empRegisterServScreen import ServiceRegisterScreen
from interface.windows.main_gui.screens.empMyServicesScreen import MyServicesScreen
from interface.windows.main_gui.screens.editProfileScreen import EditProfileScreen
from interface.windows.main_gui.screens.clientRegisterProdScreen import ProductRegisterScreen
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

            elif isinstance(pantalla, AdminManageWorkshop):
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

            elif isinstance(pantalla, AdminRegisterEmployeeScreen):
                controlador = AdminRegisterEmployeeController(pantalla, self.user_vo.user_id)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de AdminRegisterEmployeeScreen asignado a índice {i}")

            elif isinstance(pantalla, MyEmployeesScreen):
                controlador = AdminMyEmployeesController(pantalla, self.user_vo.user_id)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de MyEmployeesScreen asignado a índice {i}")

            elif isinstance(pantalla, AdminReportScreen):
                controlador = AdminReportController(pantalla)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de AdminReportScreen asignado a índice {i}")

            elif isinstance(pantalla, ServiceRegisterScreen):
                controlador = ServiceRegisterController(pantalla, self.user_vo.user_id)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de ServiceRegisterScreen asignado a índice {i}")

            elif isinstance(pantalla, MyServicesScreen):
                controlador = ClientMyServicesController(pantalla, self.user_vo.user_id)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de MyServicesScreen asignado a índice {i}")

            elif isinstance(pantalla, EditProfileScreen):
                controlador = EditProfileController(pantalla, self.user_vo)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de EditProfileScreen asignado a índice {i}")

            elif isinstance(pantalla, ProductRegisterScreen):
                controlador = ProductRegisterController(pantalla)
                self.subcontroladores[i] = controlador
                print(f"[DEBUG] Controlador de ProductRegisterScreen asignado a índice {i}")
