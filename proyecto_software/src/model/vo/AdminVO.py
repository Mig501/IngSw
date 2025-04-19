import re
class AdminVO:
    def __init__(self, passport: str, ss_number: str, dwell_time: int, age: int, first_name: str, second_name: str) -> None:
        self.passport = passport
        self.ss_number = ss_number
        self.dwell_time = dwell_time
        self.age = age
        self.first_name = first_name
        self.second_name = second_name


    @property
    def passport(self) -> str:
        return self.__passport
    
    @passport.setter
    def passport(self, passport: str) -> None:
        if not re.match(r'^[A-Z]{3}[0-9]{6}$', passport):
            raise ValueError("Passport must be in the format 'AAA123456'")

        self.__passport = passport

    @property
    def ss_number(self) -> str:
        return self.__ss_number
    
    @ss_number.setter
    def ss_number(self, ss_number: str) -> None:
        if not re.match(r'^\d{12}$', ss_number):
            raise ValueError("SS Number must have 12 digits'")

        self.__ss_number = ss_number

    @property
    def dwell_time(self) -> int:
        return self.__dwell_time
    
    @dwell_time.setter
    def dwell_time(self, dwell_time: int) -> None:
        if dwell_time < 0:
            raise ValueError("Dwell time cannot be negative.")
        self.__dwell_time = dwell_time

    @property
    def age(self) -> int:
        return self.__age
    
    @age.setter
    def age(self, age: int) -> None:
        if age < 0:
            raise ValueError("Age cannot be negative.")

        self.__age = age

    @property
    def first_name(self) -> str:
        return self.__first_name

    @first_name.setter
    def first_name(self, first_name: str) -> None:
        if len(first_name) == 0:
            raise ValueError("First name cannot be empty.")
        
        self.__first_name = first_name

    @property
    def second_name(self) -> str:
        return self.__second_name
    
    @second_name.setter
    def second_name(self, second_name: str) -> None:
        if len(second_name) == 0:
            raise ValueError("Second name cannot be empty.")
        
        self.__second_name = second_name