class EmployeeVO:
    def __init__(self, passport:str, ss_number:str, dwell_time:int, age:int, specialization:str, first_name:str, second_name:str) -> None:
        self.passport = passport
        self.ss_number = ss_number
        self.dwell_time = dwell_time
        self.age = age
        self.specialization = specialization
        self.first_name = first_name
        self.second_name = second_name

    
    @property
    def passport(self) -> str:
        return self.__passport

    @passport.setter
    def passport(self, passport:str) -> None:
        if len(passport) == 0:
            raise ValueError("Passport cannot be empty")
        
        self.__passport = passport  

    @property
    def ss_number(self) -> str:
        return self.__ss_number
    
    @ss_number.setter
    def ss_number(self, ss_number:str) -> None:
        if len(ss_number) == 0:
            raise ValueError("SS Number cannot be empty")
        
        self.__ss_number = ss_number

    @property
    def dwell_time(self) -> int:
        return self.__dwell_time
    
    @dwell_time.setter
    def dwell_time(self, dwell_time:int) -> None:
        if dwell_time < 0:
            raise ValueError("Dwell time cannot be negative")
        
        self.__dwell_time = dwell_time

    @property
    def age(self) -> int:
        return self.__age
    
    @age.setter
    def age(self, age:int) -> None:
        if age < 0:
            raise ValueError("Age cannot be negative")
        
        self.__age = age

    @property
    def specialization(self) -> str:
        return self.__specialization
    
    @specialization.setter
    def specialization(self, specialization:str) -> None:
        if len(specialization) == 0:
            raise ValueError("Specialization cannot be empty")
        
        self.__specialization = specialization

    @property
    def first_name(self) -> str:
        return self.__first_name
    
    @first_name.setter
    def first_name(self, first_name:str) -> None:
        if len(first_name) == 0:
            raise ValueError("First name cannot be empty")
        
        self.__first_name = first_name

    @property
    def second_name(self) -> str:
        return self.__second_name
    
    @second_name.setter
    def second_name(self, second_name:str) -> None:
        if len(second_name) == 0:
            raise ValueError("Second name cannot be empty")
        
        self.__second_name = second_name
