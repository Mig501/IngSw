# src/interface/windows/main_gui/main_window.py

#from PyQt6.QtWidgets import (
#    QMainWindow, QWidget, QPushButton, QVBoxLayout, QHBoxLayout,
#    QLabel, QStackedWidget, QListWidget, QListWidgetItem
#)
#from PyQt6.QtCore import Qt
#from PyQt6.QtGui import QIcon, QPixmap
#
#from interface.windows.main_gui.screens.home_screen import HomeScreen
#from interface.windows.main_gui.screens.item1_screen import Item1Screen
#
#class MainWindow(QMainWindow):
#    def __init__(self):
#        super().__init__()
#        self.setWindowTitle("BSA App")
#        self.setFixedSize(900, 600)
#        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
#        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)
#
#        self.old_pos = None  # Para arrastrar ventana
#
#        # Widget principal
#        self.central_widget = QWidget()
#        self.central_widget.setObjectName('MainContainer')
#        self.setCentralWidget(self.central_widget)
#
#        # Layout principal horizontal
#        self.main_layout = QHBoxLayout()
#        self.central_widget.setLayout(self.main_layout)
#
#        # Sidebar (menú lateral)
#        self.sidebar = QWidget()
#        self.sidebar.setObjectName('Sidebar')
#        self.sidebar.setFixedWidth(140)
#        self.sidebar_layout = QVBoxLayout()
#        self.sidebar_layout.setContentsMargins(0, 60, 0, 0)
#        self.sidebar.setLayout(self.sidebar_layout)
#
#        # Lista de opciones del menú
#        self.menu_list = QListWidget()
#        self.menu_list.setObjectName('MenuList')
#        self.menu_list.setSpacing(6)
#
#        # Home
#        self.home_widget = QWidget()
#        self.home_layout = QHBoxLayout()
#        self.home_layout.setContentsMargins(0, 0, 0, 0)
#        self.home_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)
#        self.home_icon = QLabel()
#        self.pixmap = QPixmap("resources/icons/home.svg")
#        self.home_icon.setPixmap(self.pixmap.scaled(20, 20, Qt.AspectRatioMode.KeepAspectRatio, Qt.TransformationMode.SmoothTransformation))
#        self.home_label = QLabel("Home")
#        self.home_layout.addWidget(self.home_icon)
#        self.home_layout.addWidget(self.home_label)
#        self.home_widget.setLayout(self.home_layout)
#        self.home_item = QListWidgetItem()
#        self.home_item.setSizeHint(self.home_widget.sizeHint())
#        
#        self.menu_list.addItem(self.home_item)
#        self.menu_list.setItemWidget(self.home_item, self.home_widget)
#
#        # Item 1
#        self.item1_widget = QWidget()
#        self.item1_layout = QHBoxLayout()
#        self.item1_layout.setContentsMargins(0, 0, 0, 0)
#        self.item1_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)
#        self.item1_label = QLabel("Item 1")
#        self.item1_layout.addWidget(self.item1_label)
#        self.item1_widget.setLayout(self.item1_layout)
#        self.item1_item = QListWidgetItem()
#        self.item1_item.setSizeHint(self.item1_widget.sizeHint())
#        self.menu_list.addItem(self.item1_item)
#        self.menu_list.setItemWidget(self.item1_item, self.item1_widget)
#
#        self.sidebar_layout.addWidget(self.menu_list)
#
#        # Contenedor derecho con header + contenido
#        self.right_section = QWidget()
#        self.right_section_layout = QVBoxLayout()
#        self.right_section.setLayout(self.right_section_layout)
#
#        # Header
#        self.header = QWidget()
#        self.header.setObjectName('Header')
#        self.header.setFixedHeight(40)
#        self.header_layout = QHBoxLayout()
#        self.header_layout.setContentsMargins(0, 0, 0, 0)
#        self.header_layout.setAlignment(Qt.AlignmentFlag.AlignTop)
#        self.header.setLayout(self.header_layout)
#
#        self.header_label = QLabel("BSA App")
#        self.header_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
#
#        self.btn_minimize = QPushButton()
#        self.btn_minimize.setIcon(QIcon("resources/icons/minus.svg"))
#        self.btn_minimize.setFixedSize(30, 30)
#        self.btn_minimize.clicked.connect(self.showMinimized)
#
#        self.btn_maximize = QPushButton()
#        self.btn_maximize.setIcon(QIcon("resources/icons/chevron_up.svg"))
#        self.btn_maximize.setFixedSize(30, 30)
#        self.btn_maximize.clicked.connect(self.toggle_max_restore)
#
#        self.btn_close = QPushButton()
#        self.btn_close.setObjectName('CloseButton')
#        self.btn_close.setIcon(QIcon("resources/icons/x.svg"))
#        self.btn_close.setFixedSize(30, 30)
#        self.btn_close.clicked.connect(self.close)
#
#        self.header_layout.addStretch()
#        self.header_layout.addWidget(self.header_label)
#        self.header_layout.addStretch()
#        self.header_layout.addWidget(self.btn_minimize)
#        self.header_layout.addWidget(self.btn_maximize)
#        self.header_layout.addWidget(self.btn_close)
#
#        # Área principal
#        self.main_area = QWidget()
#        self.main_area.setObjectName('MainBody')
#        self.main_area_layout = QVBoxLayout()
#        self.main_area.setLayout(self.main_area_layout)
#
#        self.stacked_widget = QStackedWidget()
#        self.pages = [HomeScreen(), Item1Screen()]
#        for page in self.pages:
#            self.stacked_widget.addWidget(page)
#
#        self.main_area_layout.addWidget(self.stacked_widget)
#
#        self.right_section_layout.addWidget(self.header)
#        self.right_section_layout.addWidget(self.main_area)
#
#        self.main_layout.addWidget(self.sidebar)
#        self.main_layout.addWidget(self.right_section)
#
#        # Botón menú
#        self.menu_button = QPushButton("Menú")
#        self.menu_button.setIcon(QIcon("resources/icons/menu.svg"))
#        self.menu_button.setFixedWidth(100)
#        self.menu_button.setFixedHeight(30)
#        self.menu_button.setObjectName("MenuButton")
#        self.menu_button.clicked.connect(self.toggle_sidebar)
#
#        # Posicionar manualmente el botón encima de la sidebar
#        self.menu_button.setParent(self.centralWidget())
#        self.menu_button.move(30, 20)
#        self.menu_button.raise_()
#
#        self.menu_list.currentRowChanged.connect(self.display_page)
#        self.sidebar.setVisible(False)
#
#    def toggle_sidebar(self):
#        '''Se encarga de cambiar el icono del boton de menu cuando este se pulse'''
#        is_visible = not self.sidebar.isVisible()
#        self.sidebar.setVisible(is_visible)
#        icon = QIcon("resources/icons/chevron_left.svg") if is_visible else QIcon("resources/icons/menu.svg")
#        self.menu_button.setIcon(icon)
#        self.menu_button.setText("Menú")
#
#    def toggle_max_restore(self):
#        '''Modifica el icono del boton de maximizar cuando este se pulse'''
#        if self.isMaximized():
#            self.showNormal()
#            self.btn_maximize.setIcon(QIcon("resources/icons/chevron_up.svg"))
#        else:
#            self.showMaximized()
#            self.btn_maximize.setIcon(QIcon("resources/icons/chevron_down.svg"))
#
#    '''
#    Esta funcion no puede ir en la parte de interfaz, ya que se encarga de cambiar de vista cuando 
#    se seleccione una de las opciones de la barra lateral.
#    '''
#    def display_page(self, index):
#        self.stacked_widget.setCurrentIndex(index)
#
#    def mousePressEvent(self, event):
#        '''Permite arrastar la ventana cuando se agarre la misma en la sección de header'''
#        if event.button() == Qt.MouseButton.LeftButton and self.header.underMouse():
#            self.old_pos = event.globalPosition().toPoint()
#
#    def mouseMoveEvent(self, event):
#        '''Se encarga de mover la posicion de la ventana al ser arrastrada'''
#        if self.old_pos:
#            delta = event.globalPosition().toPoint() - self.old_pos
#            self.move(self.x() + delta.x(), self.y() + delta.y())
#            self.old_pos = event.globalPosition().toPoint()
#
#    def mouseReleaseEvent(self, event):
#        '''Se encarga de soltar la ventana cuando se suelta el click'''
#        self.old_pos = None
#

from PyQt6.QtWidgets import (
    QMainWindow, QWidget, QPushButton, QVBoxLayout, QHBoxLayout,
    QLabel, QStackedWidget, QListWidget, QListWidgetItem
)
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QIcon, QPixmap

from interface.windows.main_gui.screens.home_screen import HomeScreen
from interface.windows.main_gui.screens.item1_screen import Item1Screen
from interface.windows.main_gui.screens.archRegisterScreen import ArchRegisterScreen

class MainWindow(QMainWindow):
    def __init__(self, user_rol=None):
        super().__init__()
        self.setWindowTitle("BSA App")
        self.setFixedSize(900, 600)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)

        self.old_pos = None
        self.user_rol = user_rol

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

        # Home
        self.add_sidebar_item("Home", HomeScreen())

        # Item1
        self.add_sidebar_item("Item 1", Item1Screen())

        # Arch only: Registrar usuarios
        if self.user_rol == "arch":
            self.add_sidebar_item("Registrar", ArchRegisterScreen())

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

        self.header_label = QLabel("BSA App")
        self.header_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

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
        self.header_layout.addWidget(self.header_label)
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

        self.menu_button = QPushButton("Menú")
        self.menu_button.setIcon(QIcon("resources/icons/menu.svg"))
        self.menu_button.setFixedWidth(100)
        self.menu_button.setFixedHeight(30)
        self.menu_button.setObjectName("MenuButton")
        self.menu_button.clicked.connect(self.toggle_sidebar)

        self.menu_button.setParent(self.centralWidget())
        self.menu_button.move(30, 20)
        self.menu_button.raise_()

        self.menu_list.currentRowChanged.connect(self.display_page)
        self.sidebar.setVisible(False)

    def add_sidebar_item(self, label, screen):
        item_widget = QWidget()
        layout = QHBoxLayout()
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setAlignment(Qt.AlignmentFlag.AlignCenter)
        label_widget = QLabel(label)
        layout.addWidget(label_widget)
        item_widget.setLayout(layout)

        item = QListWidgetItem()
        item.setSizeHint(item_widget.sizeHint())

        self.menu_list.addItem(item)
        self.menu_list.setItemWidget(item, item_widget)
        self.screens.append(screen)

    def toggle_sidebar(self):
        is_visible = not self.sidebar.isVisible()
        self.sidebar.setVisible(is_visible)
        icon = QIcon("resources/icons/chevron_left.svg") if is_visible else QIcon("resources/icons/menu.svg")
        self.menu_button.setIcon(icon)
        self.menu_button.setText("Menú")

    def toggle_max_restore(self):
        if self.isMaximized():
            self.showNormal()
            self.btn_maximize.setIcon(QIcon("resources/icons/chevron_up.svg"))
        else:
            self.showMaximized()
            self.btn_maximize.setIcon(QIcon("resources/icons/chevron_down.svg"))

    def display_page(self, index):
        self.stacked_widget.setCurrentIndex(index)

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
