class RegisterUserVO:
    """Clase que representa un registro de usuario"""

    def __init__(self, user_id, username, userpassword, email, phone, rol='cliente') -> None:
        self.user_id = user_id
        self.username = username
        self.userpassword = userpassword
        self.email = email
        self.phone = phone
        self.rol = rol
    
    @property
    def user_id(self):
        return self._user_id
    
    @user_id.setter
    def user_id(self, user_id):
        self._user_id = user_id

    @property
    def username(self):
        return self._username
    
    @username.setter
    def username(self, username):
        self._username = username

    @property
    def email(self):
        return self._email
    
    @email.setter
    def email(self, email):
        self._email = email

    @property
    def userpassword(self):
        return self._userpassword
    
    @userpassword.setter
    def userpassword(self, password):
        self._userpassword = password

    @property
    def phone(self):
        return self._phone
    
    @phone.setter
    def phone(self, phone):
        self._phone = phone

    @property
    def rol(self):
        return self._rol

    @rol.setter
    def rol(self, rol):
        if rol not in ['cliente', 'admin', 'arch', 'empleado']:
            raise ValueError("Rol debe ser 'cliente', 'admin', 'arch' o 'empleado'")
        
        self._rol = rol

    def __str__(self) -> tuple:
        """Devuelve una string del registro de usuario"""
        return (f"UserVO{{id_user={self._user_id}, nombre='{self._username}', "
                f"email='{self._email}', password='{self._userpassword}'}}")