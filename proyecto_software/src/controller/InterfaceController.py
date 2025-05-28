# InterfaceController.py

from model.vo.LoginUserVO import LoginUserVO
from interface.windows.main_gui.main_window import MainWindow
from model.loggerSingleton import LoggerSingleton
from interface.windows.login.login_window import LoginWindow
from interface.windows.main_gui.screens.adminManageWorkshop import AdminManageWorkshop
from model.vo.WorkshopVO import WorkshopVO

class InterfaceController:
    def __init__(self, modelo, app):
        """Constructor de InterfaceController"""
        self.modelo = modelo
        self.app = app
        self.logger = LoggerSingleton()
        self.login_window = LoginWindow()
        self.login_window.login_screen.login_clicked.connect(self.iniciar_login)
        self.admin_manage_workshop = AdminManageWorkshop()
        self.admin_manage_workshop.save_workshop_signal.connect(self.guardar_taller)

    def load_css(self):
        with open('src/interface/style.css', 'r') as f:
            self.app.setStyleSheet(f.read())

    def mostrar_login_window(self):
        """Muestra la ventana de login"""
        self.load_css()
        self.login_window.show()

    def iniciar_login(self):
        """Lógica para el inicio de sesión"""
        username, password = self.login_window.login_screen.get_credentials()

        # Validación de credenciales
        if not username or not password:
            self.login_window.mostrar_mensaje("Por favor, completa todos los campos.")
            return

        login_vo = LoginUserVO(username, password)
        user = self.modelo.comprobarlogin(login_vo)

        if user is None:
            self.login_window.mostrar_mensaje("Nombre de usuario o contraseña incorrectos.")
            self.logger.add_log_activity(f"Intento de inicio de sesión fallido para el usuario {username}.")
        else:
            self.login_window.mostrar_mensaje("¡¡Inicio de sesión exitoso!!")
            self.logger.add_log_activity(f"Usuario {user.username} ha iniciado sesión.")
            self.mostrar_main_window(user)

    def mostrar_main_window(self, user):
        """Muestra la ventana principal con el rol del usuario"""
        rol = self.modelo.get_user_rol(user.user_id) if user.user_id != 1 else "arch"
        self.main_window = MainWindow(user_rol=rol, client_id=user.user_id, user_vo=user)
        self.main_window.logout_signal.connect(self.volver_a_login)
        self.main_window.show()
        self.login_window.close()

    def volver_a_login(self):
        self.main_window.close()
        self.login_window.clear_fields()
        self.mostrar_login_window()

    def guardar_taller(self, data):
        try:
            workshop_vo = WorkshopVO(
                data["ws_zip_code"],
                float(data["size_of"]),
                data["phone_number"],
                data["inv_parking_slot"],
                int(data["inv_num_pieces"]),
                data["add_street"],
                int(data["add_number"]),
                data["add_city"]
            )

            if self.modelo.register_workshop(workshop_vo):
                self.admin_manage_workshop.show_message("Éxito", "Taller registrado correctamente.")
                self.admin_manage_workshop.clear_form()
            else:
                self.admin_manage_workshop.show_message("Error", "No se pudo registrar el taller.", is_error=True)

        except Exception as e:
            self.admin_manage_workshop.show_message("Error", str(e), is_error=True)