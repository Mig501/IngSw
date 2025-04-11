# src/frontend/windows/main_gui/main_window.py

from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QWidget, QPushButton, QVBoxLayout, QHBoxLayout,
    QLabel, QStackedWidget, QListWidget, QListWidgetItem, QSizePolicy
)
from PyQt6.QtCore import Qt, QSize
from PyQt6.QtGui import QIcon, QPixmap
import sys

from frontend.windows.main_gui.screens.home_screen import HomeScreen
from frontend.windows.main_gui.screens.item1_screen import Item1Screen

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA App")
        self.setFixedSize(900, 600)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)

        self.old_pos = None  # Para arrastrar ventana

        # Widget principal
        central_widget = QWidget()
        central_widget.setObjectName('MainContainer')
        self.setCentralWidget(central_widget)

        # Layout principal horizontal
        self.main_layout = QHBoxLayout()
        central_widget.setLayout(self.main_layout)

        # Sidebar (menú lateral)
        self.sidebar = QWidget()
        self.sidebar.setObjectName('Sidebar')
        self.sidebar.setFixedWidth(200)
        self.sidebar_layout = QVBoxLayout()
        self.sidebar_layout.setContentsMargins(0, 60, 0, 0)
        self.sidebar.setLayout(self.sidebar_layout)

        # Lista de opciones del menú
        self.menu_list = QListWidget()
        self.menu_list.setObjectName('MenuList')
        self.menu_list.setSpacing(6)

        # Home
        home_widget = QWidget()
        home_layout = QHBoxLayout()
        home_layout.setContentsMargins(0, 0, 0, 0)
        home_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)
        home_icon = QLabel()
        pixmap = QPixmap("resources/icons/home.svg")
        home_icon.setPixmap(pixmap.scaled(20, 20, Qt.AspectRatioMode.KeepAspectRatio, Qt.TransformationMode.SmoothTransformation))
        home_label = QLabel("Home")
        home_layout.addWidget(home_icon)
        home_layout.addWidget(home_label)
        home_widget.setLayout(home_layout)
        home_item = QListWidgetItem()
        home_item.setSizeHint(home_widget.sizeHint())
        self.menu_list.addItem(home_item)
        self.menu_list.setItemWidget(home_item, home_widget)

        # Item 1
        item1_widget = QWidget()
        item1_layout = QHBoxLayout()
        item1_layout.setContentsMargins(0, 0, 0, 0)
        item1_layout.setAlignment(Qt.AlignmentFlag.AlignCenter)
        item1_label = QLabel("Item 1")
        item1_layout.addWidget(item1_label)
        item1_widget.setLayout(item1_layout)
        item1_item = QListWidgetItem()
        item1_item.setSizeHint(item1_widget.sizeHint())
        self.menu_list.addItem(item1_item)
        self.menu_list.setItemWidget(item1_item, item1_widget)

        self.sidebar_layout.addWidget(self.menu_list)

        # Contenedor derecho con header + contenido
        self.right_section = QWidget()
        self.right_section_layout = QVBoxLayout()
        self.right_section.setLayout(self.right_section_layout)

        # Header
        self.header = QWidget()
        self.header.setObjectName('Header')
        self.header.setFixedHeight(40)
        self.header_layout = QHBoxLayout()
        self.header_layout.setContentsMargins(0, 0, 0, 0)
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

        btn_close = QPushButton()
        btn_close.setIcon(QIcon("resources/icons/x.svg"))
        btn_close.setFixedSize(30, 30)
        btn_close.clicked.connect(self.close)

        self.header_layout.addStretch()
        self.header_layout.addWidget(self.header_label)
        self.header_layout.addStretch()
        self.header_layout.addWidget(self.btn_minimize)
        self.header_layout.addWidget(self.btn_maximize)
        self.header_layout.addWidget(btn_close)

        # Área principal
        self.main_area = QWidget()
        self.main_area.setObjectName('MainBody')
        self.main_area_layout = QVBoxLayout()
        self.main_area.setLayout(self.main_area_layout)

        self.stacked_widget = QStackedWidget()
        self.pages = [HomeScreen(), Item1Screen()]
        for page in self.pages:
            self.stacked_widget.addWidget(page)

        self.main_area_layout.addWidget(self.stacked_widget)

        self.right_section_layout.addWidget(self.header)
        self.right_section_layout.addWidget(self.main_area)

        self.main_layout.addWidget(self.sidebar)
        self.main_layout.addWidget(self.right_section)

        # Botón de menú fuera del header y encima del sidebar
        self.menu_button = QPushButton("Menú", self)
        self.menu_button.setIcon(QIcon("resources/icons/menu.svg"))
        self.menu_button.setObjectName("MenuFloating")
        self.menu_button.setFixedWidth(100)
        self.menu_button.move(10, 10)
        self.menu_button.raise_()
        self.menu_button.clicked.connect(self.toggle_sidebar)

        self.menu_list.currentRowChanged.connect(self.display_page)
        self.sidebar.setVisible(False)

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
