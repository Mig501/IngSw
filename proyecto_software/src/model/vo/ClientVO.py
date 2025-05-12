class ClientVO:
    def __init__(self, client_id: str, username: str, client_email: str, phone_number: int, password: str, num_sells: int = 0, num_buys: int = 0, cash: int = 0) -> None:
        self.client_id = client_id
        self.username = username
        self.client_email = client_email
        self.phone_number = phone_number
        self.password = password
        self.num_sells = num_sells
        self.num_buys = num_buys
        self.cash = cash
     

    def __str__(self):
        return f"ClientVO(client_id={self.client_id}, client_name={self.client_name}, client_email={self.client_email})"
    
    # Getters and Setters for all fields
    @property
    def client_id(self) -> str:
        return self._client_id
    @client_id.setter
    def client_id(self, client_id: str) -> None:
        self._client_id = client_id

    @property
    def username(self) -> str:
        return self._username
    @username.setter
    def username(self, username: str) -> None:
        self._username = username

    @property
    def client_email(self) -> str:
        return self._client_email
    @client_email.setter
    def client_email(self, client_email: str) -> None:
        self._client_email = client_email

    @property
    def phone_number(self) -> int:
        return self._phone_number
    @phone_number.setter
    def phone_number(self, phone_number: int) -> None:
        self._phone_number = phone_number

    @property
    def password(self) -> str:
        return self._password
    @password.setter
    def password(self, password: str) -> None:
        self._password = password
    
    @property
    def num_sells(self) -> int:
        return self._num_sells
    @num_sells.setter
    def num_sells(self, num_sells: int) -> None:
        self._num_sells = num_sells

    @property
    def num_buys(self) -> int:
        return self._num_buys
    @num_buys.setter
    def num_buys(self, num_buys: int) -> None:
        self._num_buys = num_buys
    
    @property
    def cash(self) -> int:
        return self._cash
    @cash.setter
    def cash(self, cash: int) -> None:
        self._cash = cash
        
    