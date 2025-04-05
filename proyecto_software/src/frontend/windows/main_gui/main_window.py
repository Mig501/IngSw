from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QWidget, QPushButton, QVBoxLayout, QHBoxLayout,
    QLabel, QStackedWidget, QListWidget, QListWidgetItem, QSizePolicy
)
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QIcon
import sys

from frontend.windows.main_gui.screens.item1_screen import Item1Screen
from frontend.windows.main_gui.screens.item2_screen import Item2Screen
from frontend.windows.main_gui.screens.item3_screen import Item3Screen
from frontend.windows.main_gui.screens.item4_screen import Item4Screen

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA App")
        self.setFixedSize(900, 600)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)  # <- ✅ QUITAR BARRA DE SISTEMA

        # Widget principal
        central_widget = QWidget()
        self.setCentralWidget(central_widget)

        # Layout principal horizontal
        self.main_layout = QHBoxLayout()
        central_widget.setLayout(self.main_layout)

        # Sidebar (menú lateral)
        self.sidebar = QWidget()
        self.sidebar.setFixedWidth(200)
        self.sidebar_layout = QVBoxLayout()
        self.sidebar.setLayout(self.sidebar_layout)

        # Lista de opciones
        self.menu_list = QListWidget()
        for i in range(1, 5):
            item = QListWidgetItem(f"Item {i}")
            self.menu_list.addItem(item)
        self.sidebar_layout.addWidget(self.menu_list)

        # Cuerpo principal con header y contenido
        self.main_area = QWidget()
        self.main_area_layout = QVBoxLayout()
        self.main_area.setLayout(self.main_area_layout)

        # ✅ BARRA DE TÍTULO PERSONALIZADA CON BOTONES
        self.header = QWidget()
        self.header.setFixedHeight(40)
        self.header_layout = QHBoxLayout()
        self.header_layout.setContentsMargins(0, 0, 0, 0)
        self.header.setLayout(self.header_layout)

        self.menu_button = QPushButton("Menú")
        self.menu_button.setIcon(QIcon("resources/icons/menu.svg"))
        self.menu_button.setFixedWidth(100)
        self.menu_button.clicked.connect(self.toggle_sidebar)

        self.header_label = QLabel("BSA App")
        self.header_label.setAlignment(Qt.AlignmentFlag.AlignCenter)

        btn_minimize = QPushButton()
        btn_minimize.setIcon(QIcon("resources/icons/chevron_down.svg"))
        btn_minimize.setFixedSize(30, 30)
        btn_minimize.clicked.connect(self.showMinimized)

        btn_maximize = QPushButton()
        btn_maximize.setIcon(QIcon("resources/icons/chevron_up.svg"))
        btn_maximize.setFixedSize(30, 30)
        btn_maximize.clicked.connect(self.toggle_max_restore)

        btn_close = QPushButton()
        btn_close.setIcon(QIcon("resources/icons/x.svg"))
        btn_close.setFixedSize(30, 30)
        btn_close.clicked.connect(self.close)

        self.header_layout.addWidget(self.menu_button)
        self.header_layout.addStretch()
        self.header_layout.addWidget(self.header_label)
        self.header_layout.addStretch()
        self.header_layout.addWidget(btn_minimize)
        self.header_layout.addWidget(btn_maximize)
        self.header_layout.addWidget(btn_close)

        # Contenido (cambiable)
        self.stacked_widget = QStackedWidget()
        self.pages = [
            Item1Screen(),
            Item2Screen(),
            Item3Screen(),
            Item4Screen()
        ]
        for page in self.pages:
            self.stacked_widget.addWidget(page)

        # Agregar a layout de main area
        self.main_area_layout.addWidget(self.header)
        self.main_area_layout.addWidget(self.stacked_widget)

        # Agregar widgets al layout principal
        self.main_layout.addWidget(self.sidebar)
        self.main_layout.addWidget(self.main_area)

        # Conectar selección del menú
        self.menu_list.currentRowChanged.connect(self.display_page)

        # Sidebar inicialmente oculta
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
        else:
            self.showMaximized()

    def display_page(self, index):
        self.stacked_widget.setCurrentIndex(index)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())
