#src/model/vo/ProductVO.py
import re

# zip code is like the identfier of the product
class ProductVO:
    def __init__(self, zip_code, price, brand, model, year_manf, location, type, description, image) -> None:
        self.zip_code = zip_code
        self.price = price
        self.brand = brand
        self.model = model
        self.year_manf = year_manf
        self.location = location
        self.type = type
        self.description = description
        self.image = image

    # de momento dejamos estos decoradores así, porque no sabemos los tipos de los datos
    #@property
    #def zip_code(self) -> ¿?:
    #    pass
#
    #@zip.code.setter
    #def zip_code(self, zip_code) -> ¿?:
    #    pass
#
    #@property
    #def price(self) -> ¿?:
    #    pass
#
    #@property.setter
    #def price(self, price) -> ¿?:
    #    pass
#
    #@property
    #def brand(self) -> ¿?:
    #    pass
#
    #@brand.setter
    #def brand(self, brand) -> ¿?:
    #    pass
#
    #@property
    #def model(self) -> ¿?:
    #    pass
#
    #@model.setter
    #def model(self, model) -> ¿?:
    #    pass