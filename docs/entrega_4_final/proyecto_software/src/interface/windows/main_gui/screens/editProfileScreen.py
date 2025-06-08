# src/interface/windows/main_gui/screens/editProfileScreen.py
from PyQt6.QtWidgets import QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton
from PyQt6.QtCore import Qt, pyqtSignal

class EditProfileScreen(QWidget):
    logout_signal = pyqtSignal()
    save_changes_signal = pyqtSignal(dict)

    def __init__(self, user_vo):
        super().__init__()
        self.user_vo = user_vo

        layout = QVBoxLayout()
        self.setLayout(layout)

        title = QLabel("Modificar Datos Personales")
        title.setAlignment(Qt.AlignmentFlag.AlignCenter)
        layout.addWidget(title)

        self.username_input = QLineEdit(self.user_vo.username)
        self.email_input = QLineEdit(self.user_vo.email)
        self.phone_input = QLineEdit(self.user_vo.phone)

        layout.addWidget(QLabel("Usuario"))
        layout.addWidget(self.username_input)
        layout.addWidget(QLabel("Correo"))
        layout.addWidget(self.email_input)
        layout.addWidget(QLabel("Teléfono"))
        layout.addWidget(self.phone_input)

        self.saldo_input = None
        
        if self.user_vo.rol == "cliente":
            self.saldo_input = QLineEdit()
            layout.addWidget(QLabel("Saldo (€)"))
            layout.addWidget(self.saldo_input)

        save_btn = QPushButton("Guardar cambios")
        save_btn.clicked.connect(self.emit_save_changes)
        layout.addWidget(save_btn)

        logout_btn = QPushButton("Cerrar sesión")
        logout_btn.clicked.connect(self.logout_signal.emit)
        layout.addWidget(logout_btn)

    def emit_save_changes(self):
        data = {
            "username": self.username_input.text().strip(),
            "email": self.email_input.text().strip(),
            "phone": self.phone_input.text().strip(),
            "saldo": self.saldo_input.text().strip() if self.saldo_input else None
        }
        self.save_changes_signal.emit(data)

    def set_saldo(self, saldo: float):
        if self.saldo_input:
            self.saldo_input.setText(str(saldo))

    def show_message(self, title, message, is_error=False):
        from PyQt6.QtWidgets import QMessageBox
        if is_error:
            QMessageBox.critical(self, title, message)
        
        else:
            QMessageBox.information(self, title, message)
