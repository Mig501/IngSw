#○ src/model/vo/LoginUserVO.py
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
        if not username:
            raise ValueError("Username must not be empty")
        
        self._username = username

    @property
    def userpassword(self):
        return self._userpassword
    
    @userpassword.setter
    def userpassword(self, password):
        if not password:
            raise ValueError("Password must not be empty")
        
        self._userpassword = password