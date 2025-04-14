class LoginUserVO:
    """
    Clase que representa el objeto de valor para el inicio de sesión.
    """

    def __init__(self, username, password) -> None:
        self.username = username
        self.userpassword = password

    @property
    def username(self):
        return self._username
    
    @username.setter
    def username(self, username):
        self._username = username

    @property
    def userpassword(self):
        return self._userpassword
    
    @userpassword.setter
    def userpassword(self, password):
        self._userpassword = password