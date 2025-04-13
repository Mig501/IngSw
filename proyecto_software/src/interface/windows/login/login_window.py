from PyQt6.QtWidgets import QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QStackedWidget, QLabel
from PyQt6.QtCore import Qt, QPoint
from PyQt6.QtGui import QIcon
from interface.windows.login.screens.login_screen import LoginScreen
from interface.windows.login.screens.register_screen import RegisterScreen
from interface.windows.main_gui.main_window import MainWindow

class LoginWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA Login")
        self.setFixedSize(500, 600)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
        self.old_pos = None  # para arrastrar ventana

        # ---------- Barra superior personalizada ----------
        self.title_bar = QWidget()
        self.title_bar.setObjectName('TitleBar')
        self.title_bar.setFixedHeight(30)

        self.title_layout = QHBoxLayout()
        self.title_layout.setContentsMargins(5, 0, 5, 0)

        # Botón minimizar
        self.minimize_button = QPushButton()
        self.minimize_button.setObjectName('MinimizeButton')
        self.minimize_button.setIcon(QIcon("resources/icons/minus.svg"))
        self.minimize_button.setFixedSize(30, 30)
        self.minimize_button.clicked.connect(self.showMinimized)

        # Botón cerrar
        self.close_button = QPushButton()
        self.close_button.setObjectName('CloseButton')
        self.close_button.setIcon(QIcon("resources/icons/x.svg"))
        self.close_button.setFixedSize(30, 30)
        self.close_button.clicked.connect(self.close)

        self.title_layout.addStretch()
        self.title_layout.addWidget(self.minimize_button)
        self.title_layout.addWidget(self.close_button)

        self.title_bar.setLayout(self.title_layout)

        # ---------- Contenido principal ----------
        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)

        self.main_layout = QVBoxLayout()
        self.main_layout.setContentsMargins(0, 0, 0, 0)
        self.main_layout.setSpacing(0)

        self.main_layout.addWidget(self.title_bar)

        # Crear stack de vistas
        self.stack = QStackedWidget()
        self.main_layout.addWidget(self.stack)

        self.central_widget.setLayout(self.main_layout)

        # Crear pantallas
        self.login_screen = LoginScreen()
        self.register_screen = RegisterScreen()

        # Añadir al stack
        self.stack.addWidget(self.login_screen)
        self.stack.addWidget(self.register_screen)
        self.stack.setCurrentWidget(self.login_screen)

        # Conexiones
        self.login_screen.login_success.connect(self.open_main_window)
        self.login_screen.register_clicked.connect(self.show_register_screen)
        self.register_screen.back_to_login.connect(self.show_login_screen)

    # ---------- Métodos para cambiar vistas ----------
    def show_register_screen(self):
        self.stack.setCurrentWidget(self.register_screen)

    def show_login_screen(self):
        self.stack.setCurrentWidget(self.login_screen)

    def open_main_window(self):
        self.main_window = MainWindow()
        self.main_window.show()
        self.close()

    # ---------- Arrastrar ventana ----------
    def mousePressEvent(self, event):
        if event.button() == Qt.MouseButton.LeftButton and self.title_bar.underMouse():
            self.old_pos = event.globalPosition().toPoint()

    def mouseMoveEvent(self, event):
        if self.old_pos:
            delta = event.globalPosition().toPoint() - self.old_pos
            self.move(self.x() + delta.x(), self.y() + delta.y())
            self.old_pos = event.globalPosition().toPoint()

    def mouseReleaseEvent(self, event):
        self.old_pos = None
