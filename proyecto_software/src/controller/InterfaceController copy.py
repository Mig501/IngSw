# InterfaceController.py

from model.vo.LoginUserVO import LoginUserVO
from interface.windows.main_gui.main_window import MainWindow
from model.loggerSingleton import LoggerSingleton
from interface.windows.login.login_window import LoginWindow
from interface.windows.main_gui.screens.adminManageWorkshop import AdminManageWorkshop
from model.vo.WorkshopVO import WorkshopVO

class InterfaceController:
    def __init__(self, modelo, app):
        self.modelo = modelo
        self.app = app
        self.logger = LoggerSingleton()

        self.login_window = LoginWindow()
        self.login_window.login_screen.login_clicked.connect(self.iniciar_login)

    def load_css(self):
        with open('src/interface/style.css', 'r') as f:
            self.app.setStyleSheet(f.read())

    def mostrar_login_window(self):
        self.load_css()
        self.login_window.show()

    def iniciar_login(self):
        username, password = self.login_window.login_screen.get_credentials()
        if not username or not password:
            self.login_window.mostrar_mensaje("Por favor, completa todos los campos.")
            return

        login_vo = LoginUserVO(username, password)
        user = self.modelo.user.comprobarlogin(login_vo)

        if user is None:
            self.login_window.mostrar_mensaje("Nombre de usuario o contraseña incorrectos.")
            self.logger.add_log_activity(f"Intento de inicio de sesión fallido para el usuario {username}.")
        else:
            self.login_window.mostrar_mensaje("¡¡Inicio de sesión exitoso!!")
            self.logger.add_log_activity(f"Usuario {user.username} ha iniciado sesión.")
            self.mostrar_main_window(user)

    def mostrar_main_window(self, user):
        rol = self.modelo.user.get_user_rol(user.user_id) if user.user_id != 1 else "arch"
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

            if self.modelo.workshop.register_workshop(workshop_vo):
                self.admin_manage_workshop.show_message("Éxito", "Taller registrado correctamente.")
                self.admin_manage_workshop.clear_form()
            else:
                self.admin_manage_workshop.show_message("Error", "No se pudo registrar el taller.", is_error=True)

        except Exception as e:
            self.admin_manage_workshop.show_message("Error", str(e), is_error=True)

    # Métodos adicionales expuestos por el controlador

    def get_filtered_cars(self, **filters):
        return self.modelo.product.get_filtered_cars(**filters)

    def get_filtered_others(self, **filters):
        return self.modelo.product.get_filtered_others(**filters)

    def buy_product(self, product_id, client_id):
        return self.modelo.product.buy_product(product_id, client_id)

    def get_client_products(self, client_id):
        return self.modelo.product.get_client_products(client_id)

    def delete_product(self, product_id):
        return self.modelo.product.delete_product(product_id)

    def register_employee(self, user_vo, employee_vo, admin_id):
        return self.modelo.user.registrar_empleado(user_vo, employee_vo, admin_id)

    def get_employees_by_admin(self, admin_id):
        return self.modelo.user.get_employees_by_admin_id(admin_id)

    def delete_employee(self, employee_id):
        self.modelo.service.delete_services_by_employee_id(employee_id)
        return self.modelo.user.delete_employee(employee_id)

    def register_service(self, service_vo):
        return self.modelo.service.register_service(service_vo)

    def get_employee_services(self, employee_id):
        return self.modelo.service.get_employee_services(employee_id)

    def delete_service(self, service_id):
        return self.modelo.service.delete_service(service_id)

    def hire_service(self, client_id, service_id):
        return self.modelo.service.hire_service(client_id, service_id)

    def get_report_summary(self, start_date, end_date):
        return {
            "top_buyer": self.modelo.report.get_top_buyer(start_date, end_date),
            "top_seller": self.modelo.report.get_top_seller(start_date, end_date),
            "top_brand": self.modelo.report.get_top_brand(start_date, end_date),
            "daily_sales": self.modelo.report.get_daily_sales(start_date, end_date),
            "total_sales": self.modelo.report.get_totals(start_date, end_date)
        }

    def update_user_profile(self, user_id, username, email, phone):
        return self.modelo.user.update_user_profile(user_id, username, email, phone)

    def get_client_id(self, user_id):
        return self.modelo.user.get_client_id(user_id)

    def get_employee_id(self, user_id):
        return self.modelo.user.get_employee_id_from_user_id(user_id)

    def get_admin_id_by_user(self, user_id):
        return self.modelo.user.get_admin_id_by_user_id(user_id)

    def get_admins_excluding(self, admin_id):
        return self.modelo.user.get_admins_excluding_actual(admin_id)

    def delete_admin(self, admin_id, new_admin_id):
        return self.modelo.user.delete_admin(admin_id, new_admin_id)

    def get_service_owner_id(self, service_id):
        return self.modelo.service.get_service_owner_id(service_id)

    def get_owner_id(self, product_id):
        return self.modelo.product.get_owner_id(product_id)

    def get_client_saldo(self, client_id):
        return self.modelo.user.get_saldo_cliente(client_id)

    def update_client_saldo(self, client_id, new_balance):
        return self.modelo.user.update_client_stats(client_id, new_balance)

    def add_log(self, message):
        self.logger.add_log_activity(message)

    def get_current_log(self):
        return self.logger.get_log()

    def clear_log(self):
        return self.logger.clear_log()

    def load_logs_by_date(self, date):
        return self.logger.load_logs_for_date(date)
