class LoginVO:
    """
    Class representing a login value object.
    """

    def __init__(self, username, password):
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