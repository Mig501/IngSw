# src/interface/windows/login/login_window.py

from PyQt6.QtWidgets import QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QStackedWidget
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QIcon
from interface.windows.login.screens.login_screen import LoginScreen
from interface.windows.login.screens.register_screen import RegisterScreen
from interface.windows.main_gui.main_window import MainWindow
from PyQt6.QtWidgets import QMessageBox

class LoginWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("BSA Login")
        self.setFixedSize(500, 600)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
        self.old_pos = None  # para arrastrar ventana

        # ---------- Contenedor central ----------
        self.central_widget = QWidget()
        self.central_widget.setObjectName('MainContainer')
        self.setCentralWidget(self.central_widget)

        self.main_layout = QVBoxLayout()
        self.main_layout.setContentsMargins(0, 0, 0, 0)
        self.main_layout.setSpacing(0)
        self.central_widget.setLayout(self.main_layout)

        # ---------- Barra superior personalizada ----------
        self.title_bar = QWidget(self.central_widget)
        self.title_bar.setObjectName('TitleBar')
        self.title_bar.setFixedHeight(40)
        self.title_bar.setGeometry(0, 0, self.width(), 40)

        # Botón minimizar
        self.minimize_button = QPushButton(self.title_bar)
        self.minimize_button.setObjectName('MinimizeButton')
        self.minimize_button.setIcon(QIcon("resources/icons/minus.svg"))
        self.minimize_button.setFixedSize(30, 30)

        self.minimize_button.move(420, 10)
        self.minimize_button.clicked.connect(self.showMinimized)

        # Botón cerrar
        self.close_button = QPushButton(self.title_bar)
        self.close_button.setObjectName('CloseButton')
        self.close_button.setIcon(QIcon("resources/icons/x.svg"))
        self.close_button.setFixedSize(30, 30)
        self.close_button.move(455, 10)
        self.close_button.clicked.connect(self.close)

        # ---------- Stack de vistas ----------
        self.stack = QStackedWidget()
        self.main_layout.addSpacing(40)  # espacio para que no solape con la barra
        self.main_layout.addWidget(self.stack)

        # Crear pantallas
        self.login_screen = LoginScreen()
        self.register_screen = RegisterScreen()

        # Añadir al stack
        self.stack.addWidget(self.login_screen)
        self.stack.addWidget(self.register_screen)
        self.stack.setCurrentWidget(self.login_screen)

        # Conexiones
        self.login_screen.register_clicked.connect(self.show_register_screen)
        self.register_screen.back_to_login.connect(self.show_login_screen)

    def show_register_screen(self):
        self.stack.setCurrentWidget(self.register_screen)

    def show_login_screen(self):
        self.stack.setCurrentWidget(self.login_screen)

    def open_main_window(self):
        self.main_window = MainWindow()
        self.main_window.show()
        self.close()

    def mostrar_mensaje(self, mensaje):
        QMessageBox.information(self, "Información", mensaje)

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
