class UserVO:
    def __init__(self, user_id, username, email, userpassword, phone):
        self.user_id = user_id
        self.username = username
        self.email = email
        self.userpassword = userpassword
        self.phone = phone
    
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