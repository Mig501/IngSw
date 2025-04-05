from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QWidget, QPushButton, QVBoxLayout, QHBoxLayout,
    QLabel, QStackedWidget, QListWidget, QListWidgetItem, QSizePolicy
)
from PyQt6.QtCore import Qt, QPoint
from PyQt6.QtGui import QIcon
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

        self.old_pos = None  # Para controlar el arrastre

        # Widget principal
        central_widget = QWidget()
        central_widget.setObjectName('MainContainer')
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
        items = ['Home', 'Item1']
        for item_text in items:
            item = QListWidgetItem(item_text)
            self.menu_list.addItem(item)
        self.sidebar_layout.addWidget(self.menu_list)

        # Contenedor derecho que incluye el header y el área de contenido
        self.right_section = QWidget()
        self.right_section_layout = QVBoxLayout()
        self.right_section.setLayout(self.right_section_layout)

        # Barra de título con botones personalizados
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
        btn_minimize.setIcon(QIcon("resources/icons/minus.svg"))
        btn_minimize.setFixedSize(30, 30)
        btn_minimize.clicked.connect(self.showMinimized)

        self.btn_maximize = QPushButton()
        self.btn_maximize.setIcon(QIcon("resources/icons/chevron_up.svg"))
        self.btn_maximize.setFixedSize(30, 30)
        self.btn_maximize.clicked.connect(self.toggle_max_restore)

        btn_close = QPushButton()
        btn_close.setIcon(QIcon("resources/icons/x.svg"))
        btn_close.setFixedSize(30, 30)
        btn_close.clicked.connect(self.close)

        self.header_layout.addWidget(self.menu_button)
        self.header_layout.addStretch()
        self.header_layout.addWidget(self.header_label)
        self.header_layout.addStretch()
        self.header_layout.addWidget(btn_minimize)
        self.header_layout.addWidget(self.btn_maximize)
        self.header_layout.addWidget(btn_close)

        # Área de contenido (cambiable)
        self.main_area = QWidget()
        self.main_area.setObjectName('MainBody')
        self.main_area_layout = QVBoxLayout()
        self.main_area.setLayout(self.main_area_layout)

        self.stacked_widget = QStackedWidget()
        self.pages = [
            HomeScreen(),
            Item1Screen()
        ]
        for page in self.pages:
            self.stacked_widget.addWidget(page)

        self.main_area_layout.addWidget(self.stacked_widget)

        # Agregar header y área de contenido al contenedor derecho
        self.right_section_layout.addWidget(self.header)
        self.right_section_layout.addWidget(self.main_area)

        # Agregar widgets al layout principal
        self.main_layout.addWidget(self.sidebar)
        self.main_layout.addWidget(self.right_section)

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
        if self.old_pos is not None:
            delta = event.globalPosition().toPoint() - self.old_pos
            self.move(self.x() + delta.x(), self.y() + delta.y())
            self.old_pos = event.globalPosition().toPoint()

    def mouseReleaseEvent(self, event):
        self.old_pos = None

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())
