# src/interface/windows/main_gui/main_window.py
from PyQt6.QtWidgets import (
    QMainWindow, QWidget, QPushButton, QVBoxLayout, QHBoxLayout,
    QLabel, QStackedWidget, QListWidget, QListWidgetItem
)
from PyQt6.QtCore import Qt, pyqtSignal
from PyQt6.QtGui import QIcon, QPixmap

from interface.windows.main_gui.screens.home_screen import HomeScreen
from interface.windows.main_gui.screens.vehicle_screen import VehicleScreen
from interface.windows.main_gui.screens.other_screen import OtherScreen
from interface.windows.main_gui.screens.archRegisterScreen import ArchRegisterScreen
from interface.windows.main_gui.screens.adminRegisterScreen import AdminRegisterEmployeeScreen
from interface.windows.main_gui.screens.adminManageWorkshop import AdminManageWorkshop
from interface.windows.main_gui.screens.clientRegisterProdScreen import ProductRegisterScreen
from interface.windows.main_gui.screens.archBackupScreen import BackupScreen
from interface.windows.main_gui.screens.editProfileScreen import EditProfileScreen
from interface.windows.main_gui.screens.clientMyProductsScreen import MyProductsScreen
from interface.windows.main_gui.screens.empRegisterServScreen import ServiceRegisterScreen
from interface.windows.main_gui.screens.logViewerScreen import LogViewerScreen
from interface.windows.main_gui.screens.adminReportScreen import AdminReportScreen
from interface.windows.main_gui.screens.empMyServicesScreen import MyServicesScreen
from interface.windows.main_gui.screens.adminMyEmployeesScreen import MyEmployeesScreen
from interface.windows.main_gui.screens.archDeleteAdmins import ArchDeleteAdminScreen
from interface.windows.main_gui.screens.archManageWorkshop import ArchManageWorkshop
from interface.windows.main_gui.screens.service_screen import ServiceScreen


class MainWindow(QMainWindow):

    logout_signal = pyqtSignal()
    sidebar_button_clicked = pyqtSignal(int)

    def __init__(self, user_rol=None, client_id=None, user_vo=None):
        super().__init__()

        self.setWindowTitle("BSA App")
        self.setFixedSize(900, 600)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)

        self.old_pos = None
        self.user_rol = user_rol
        self.client_id = client_id
        self.user_vo = user_vo

        self.central_widget = QWidget()
        self.central_widget.setObjectName('MainContainer')
        self.setCentralWidget(self.central_widget)

        self.main_layout = QHBoxLayout()
        self.central_widget.setLayout(self.main_layout)

        self.sidebar = QWidget()
        self.sidebar.setObjectName('Sidebar')
        self.sidebar.setFixedWidth(140)
        self.sidebar_layout = QVBoxLayout()
        self.sidebar_layout.setContentsMargins(0, 60, 0, 0)
        self.sidebar.setLayout(self.sidebar_layout)

        self.menu_list = QListWidget()
        self.menu_list.setObjectName('MenuList')
        self.menu_list.setSpacing(6)

        self.screens = []

        self.add_sidebar_item("Home", HomeScreen())

        if self.user_rol == "arch":
            self.add_sidebar_item("Registrar usuarios", ArchRegisterScreen())
            self.add_sidebar_item("Gestionar taller", ArchManageWorkshop())
            self.backup_screen = BackupScreen()
            self.add_sidebar_item("Realizar Copia de Seguridad", self.backup_screen)
            self.add_sidebar_item("Visualizar Logs", LogViewerScreen())
            self.add_sidebar_item("Eliminar Admins", ArchDeleteAdminScreen())

        if self.user_rol == "admin":
            self.add_sidebar_item("Registrar empleados", AdminRegisterEmployeeScreen())
            self.add_sidebar_item("Gestionar taller", AdminManageWorkshop())
            self.add_sidebar_item("Redactor de informes", AdminReportScreen())
            self.add_sidebar_item("Empleados", MyEmployeesScreen())

        if self.user_rol == "cliente":
            self.add_sidebar_item("Registrar producto", ProductRegisterScreen(self.client_id))
            self.add_sidebar_item("Mis productos", MyProductsScreen())
            self.add_sidebar_item("Vehículos", VehicleScreen())
            self.add_sidebar_item("Otros productos", OtherScreen())
            self.add_sidebar_item("Servicios", ServiceScreen(self.user_vo))

        if self.user_rol == "empleado":
            self.add_sidebar_item("Registrar servicio", ServiceRegisterScreen())
            self.add_sidebar_item("Mis servicios", MyServicesScreen())

        if self.user_vo:
            edit_screen = EditProfileScreen(self.user_vo)
            self.add_sidebar_item("Cuenta", edit_screen)
            edit_screen.logout_signal.connect(self.log_out)

        self.sidebar_layout.addWidget(self.menu_list)

        self.right_section = QWidget()
        self.right_section_layout = QVBoxLayout()
        self.right_section.setLayout(self.right_section_layout)

        self.header = QWidget()
        self.header.setObjectName('Header')
        self.header.setFixedHeight(40)
        self.header_layout = QHBoxLayout()
        self.header_layout.setContentsMargins(0, 0, 0, 0)
        self.header_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
        self.header.setLayout(self.header_layout)

        self.setCentralWidget(self.central_widget)

        self.btn_minimize = QPushButton()
        self.btn_minimize.setIcon(QIcon("resources/icons/minus.svg"))
        self.btn_minimize.setFixedSize(30, 30)
        self.btn_minimize.clicked.connect(self.showMinimized)

        self.btn_maximize = QPushButton()
        self.btn_maximize.setIcon(QIcon("resources/icons/chevron_up.svg"))
        self.btn_maximize.setFixedSize(30, 30)
        self.btn_maximize.clicked.connect(self.toggle_max_restore)

        self.btn_close = QPushButton()
        self.btn_close.setObjectName('CloseButton')
        self.btn_close.setIcon(QIcon("resources/icons/x.svg"))
        self.btn_close.setFixedSize(30, 30)
        self.btn_close.clicked.connect(self.close)

        self.header_layout.addStretch()
        self.header_layout.addStretch()
        self.header_layout.addWidget(self.btn_minimize)
        self.header_layout.addWidget(self.btn_maximize)
        self.header_layout.addWidget(self.btn_close)

        self.main_area = QWidget()
        self.main_area.setObjectName('MainBody')
        self.main_area_layout = QVBoxLayout()
        self.main_area.setLayout(self.main_area_layout)

        self.stacked_widget = QStackedWidget()
        for screen in self.screens:
            self.stacked_widget.addWidget(screen)

        self.main_area_layout.addWidget(self.stacked_widget)

        self.right_section_layout.addWidget(self.header)
        self.right_section_layout.addWidget(self.main_area)

        self.main_layout.addWidget(self.sidebar)
        self.main_layout.addWidget(self.right_section)

        self.bsa_logo = QLabel(self.central_widget)
        pixmap = QPixmap("resources/images/BSA_name.png")
        self.bsa_logo.setPixmap(pixmap.scaledToWidth(80, Qt.TransformationMode.SmoothTransformation))
        self.bsa_logo.setFixedSize(80, 30)
        self.bsa_logo.move((140 - self.bsa_logo.width()) // 2 + 20, 20)
        self.bsa_logo.raise_()

        self.menu_list.currentRowChanged.connect(self.display_page)
        self.sidebar.setVisible(True)

    def add_sidebar_item(self, label, screen):
        item_widget = QWidget()
        layout = QHBoxLayout()
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setAlignment(Qt.AlignmentFlag.AlignLeft)
        label_widget = QLabel(label)
        layout.addWidget(label_widget)
        item_widget.setLayout(layout)

        item = QListWidgetItem()
        item.setSizeHint(item_widget.sizeHint())

        self.menu_list.addItem(item)
        self.menu_list.setItemWidget(item, item_widget)
        self.screens.append(screen)

    def toggle_max_restore(self):
        if self.isMaximized():
            self.showNormal()
            self.btn_maximize.setIcon(QIcon("resources/icons/chevron_up.svg"))
        else:
            self.showMaximized()
            self.btn_maximize.setIcon(QIcon("resources/icons/chevron_down.svg"))

    def display_page(self, index):
        self.sidebar_button_clicked.emit(index)

    def mousePressEvent(self, event):
        if event.button() == Qt.MouseButton.LeftButton and self.header.underMouse():
            self.old_pos = event.globalPosition().toPoint()

    def mouseMoveEvent(self, event):
        if self.old_pos:
            delta = event.globalPosition().toPoint() - self.old_pos
            self.move(self.x() + delta.x(), self.y() + delta.y())
            self.old_pos = event.globalPosition().toPoint()

    def mouseReleaseEvent(self, event):
        self.old_pos = None

    def log_out(self):
        self.logout_signal.emit()

    def set_user(self, user_vo):
        self.user_vo = user_vo
        self.user_rol = user_vo.rol
        self.client_id = user_vo.user_id
        # print(f"[DEBUG] Usuario cargado en MainWindow: {user_vo.username} (rol: {user_vo.rol})")
