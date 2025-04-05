class UserVO:
    def __init__(self, user_id, username, email, userpassword):
        self.user_id = user_id
        self.username = username
        self.email = email
        self.userpassword = userpassword
    
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
        return self._password
    
    @userpassword.setter
    def userpassword(self, password):
        self._password = password
