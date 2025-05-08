#src/model/vo/ProductVO.py
import re

class ProductVO:
    def __init__(self, product_Id:int, price:float, brand:str, model:str, year_manufacture:str, plocation:str, ptype:str, pdescription:str, pimage) -> None:
        self.product_Id = product_Id
        self.price = price
        self.brand = brand
        self.model = model
        self.year_manufacture = year_manufacture
        self.plocation = plocation
        self.ptype = ptype
        self.pdescription = pdescription
        self.pimage = pimage

    @property
    def product_Id(self) -> int:
        return self._product_Id

    @product_Id.setter
    def product_Id(self, product_Id:int) -> int:
        if product_Id <= 0:
            raise ValueError("El product_Id debe ser un número entero positivo.")
        
        self._product_Id = product_Id

    @property
    def price(self) -> float:
        return self._price

    @price.setter
    def price(self, price:float) -> float:
        if price <= 0:
            raise ValueError("El precio debe ser un número positivo.")
        
        self._price = price
    
    @property
    def brand(self) -> str:
        return self._brand

    @brand.setter
    def brand(self, brand) -> str:
        if not brand or len(brand) < 1:
            raise ValueError("La marca no puede estar vacía.")
        self._brand = brand

    @property
    def model(self) -> str:
        return self._model
    
    @model.setter
    def model(self, model) -> str:
        if not model or len(model) < 1:
            raise ValueError("El modelo no puede estar vacío.")
        self._model = model

    @property
    def year_manufacture(self) -> str:
        return self._year_manufacture
    
    @year_manufacture.setter
    def year_manufacture(self, year_manufacture) -> str:
        if not re.match(r"^\d{4}$", year_manufacture):
            raise ValueError("El año de fabricación debe ser un número de 4 dígitos.")
        self._year_manufacture = year_manufacture

    @property
    def plocation(self) -> str:
        return self._plocation
    
    @plocation.setter
    def plocation(self, plocation) -> str:
        if not isinstance(plocation, tuple) or len(plocation) != 2:
            raise ValueError("La ubicación debe ser una tupla con dos elementos (latitud, longitud).")
        self._plocation = plocation

    @property
    def ptype(self) -> str:
        return self._ptype
    
    @ptype.setter
    def ptype(self, ptype) -> str:
        if ptype not in ['automóviles', 'otros']:
            raise ValueError("El tipo de producto debe ser 'automóviles' o 'otros'.")
        self._ptype = ptype
