# src/interface/windows/login/login_window.py

from PyQt6.QtWidgets import QMainWindow, QWidget, QVBoxLayout, QPushButton, QStackedWidget, QMessageBox
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QIcon

from interface.windows.login.screens.login_screen import LoginScreen
from interface.windows.login.screens.register_screen import RegisterScreen
from interface.windows.main_gui.main_window import MainWindow

from controller.LoginController import LoginController
from controller.RegisterController import RegisterController


class LoginWindow(QMainWindow):
    def __init__(self, modelo):
        super().__init__()
        if modelo is None:
            raise ValueError("El modelo no puede ser None.")
        self.modelo = modelo

        self.setWindowTitle("BSA Login")
        self.setFixedSize(500, 600)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
        self.old_pos = None

        # ---------- Contenedor principal ----------
        self.central_widget = QWidget()
        self.central_widget.setObjectName('MainContainer')
        self.setCentralWidget(self.central_widget)

        self.main_layout = QVBoxLayout(self.central_widget)
        self.main_layout.setContentsMargins(0, 0, 0, 0)
        self.main_layout.setSpacing(0)

        # ---------- Barra superior ----------
        self.title_bar = QWidget()
        self.title_bar.setObjectName('TitleBar')
        self.title_bar.setFixedHeight(40)

        self.minimize_button = QPushButton(self.title_bar)
        self.minimize_button.setObjectName('MinimizeButton')
        self.minimize_button.setIcon(QIcon("resources/icons/minus.svg"))
        self.minimize_button.setFixedSize(30, 30)
        self.minimize_button.move(420, 10)
        self.minimize_button.clicked.connect(self.showMinimized)

        self.close_button = QPushButton(self.title_bar)
        self.close_button.setObjectName('CloseButton')
        self.close_button.setIcon(QIcon("resources/icons/x.svg"))
        self.close_button.setFixedSize(30, 30)
        self.close_button.move(455, 10)
        self.close_button.clicked.connect(self.close)

        self.main_layout.addWidget(self.title_bar)

        # ---------- Stack de pantallas ----------
        self.stack = QStackedWidget()
        self.main_layout.addWidget(self.stack)

        # Crear vistas y controladores
        self.login_screen = LoginScreen()
        self.register_screen = RegisterScreen()

        self.login_controller = LoginController(self.modelo, self.login_screen)
        self.register_controller = RegisterController(self.register_screen)

        self.login_screen.controller = self.login_controller
        self.register_screen.controller = self.register_controller

        self.stack.addWidget(self.login_screen)
        self.stack.addWidget(self.register_screen)
        self.stack.setCurrentWidget(self.login_screen)

        # Conectar señales
        self.login_screen.register_clicked.connect(self.show_register_screen)
        self.login_screen.login_clicked.connect(self.open_main_window)
        self.register_screen.back_to_login.connect(self.show_login_screen)

    def show_register_screen(self):
        self.stack.setCurrentWidget(self.register_screen)

    def show_login_screen(self):
        self.clear_fields()
        self.stack.setCurrentWidget(self.login_screen)

    def open_main_window(self):
        user_vo = self.login_controller.iniciar_sesion()
        if user_vo:
            self.main_window = MainWindow(user_rol=user_vo.rol, client_id=user_vo.user_id, user_vo=user_vo)
            self.main_window.logout_signal.connect(self.show_login_screen)
            self.main_window.show()
            self.close()

    def mostrar_mensaje(self, mensaje):
        QMessageBox.information(self, "Información", mensaje)

    def clear_fields(self):
        self.login_screen.input_user.clear()
        self.login_screen.input_pass.clear()

    # ---------- Eventos para mover la ventana ----------
    def mousePressEvent(self, event):
        if event.button() == Qt.MouseButton.LeftButton and self.title_bar.underMouse():
            self.old_pos = event.globalPosition().toPoint()

    def mouseMoveEvent(self, event):
        if self.old_pos:
            delta = event.globalPosition().toPoint() - self.old_pos
            self.move(self.pos() + delta)
            self.old_pos = event.globalPosition().toPoint()

    def mouseReleaseEvent(self, event):
        self.old_pos = None
