#src/model/vo/ProductVO.py

class ProductVO:

    def __init__(self, product_id: int, client_id: int, price: float, brand: str, model: str, year_manufacture: str, 
                 plocation: str, ptype: str, pdescription: str, image_path:str) -> None:
        
        self.product_id = product_id
        self.client_id = client_id
        self.price = price
        self.brand = brand
        self.model = model
        self.year_manufacture = year_manufacture
        self.plocation = plocation
        self.ptype = ptype
        self.pdescription = pdescription
        self.image_path = image_path

    # Getters and Setters for all fields
    @property
    def price(self) -> float:
        return self._price
    
    @price.setter
    def price(self, price: float) -> None:
        if price < 0:
            raise ValueError("Price cannot be negative.")

        self._price = price

    @property
    def brand(self) -> str:
        return self._brand
    
    @brand.setter
    def brand(self, brand: str) -> None:
        if not brand:
            raise ValueError("Brand cannot be empty.")

        self._brand = brand

    @property
    def model(self) -> str:
        return self._model
    
    @model.setter
    def model(self, model: str) -> None:
        if not model:
            raise ValueError("Model cannot be empty.")
        
        self._model = model

    @property
    def year_manufacture(self) -> str:
        return self._year_manufacture
    
    @year_manufacture.setter
    def year_manufacture(self, year_manufacture: str) -> None:
        if not year_manufacture or len(str(year_manufacture)) != 4:
            raise ValueError("Year of manufacture must be a 4-digit number and cannot be empty.")
        
        self._year_manufacture = year_manufacture

    @property
    def plocation(self) -> str:
        return self._plocation
    
    @plocation.setter
    def plocation(self, plocation: str) -> None:
        if not plocation:
            raise ValueError("Location cannot be empty.")

        self._plocation = plocation
 
    @property
    def ptype(self) -> str:
        return self._ptype
    
    @ptype.setter
    def ptype(self, ptype: str) -> None:
        self._ptype = ptype

    @property
    def pdescription(self) -> str:
        return self._pdescription
    
    @pdescription.setter
    def pdescription(self, pdescription: str) -> None:
        if not pdescription:
            raise ValueError("Description cannot be empty.")
        
        self._pdescription = pdescription

    @property
    def image_path(self) -> str:
        return self._image_path

    @image_path.setter
    def image_path(self, image_path: str) -> None:
        if not image_path:
            raise ValueError("Image path cannot be empty.")
        
        self._image_path = image_path