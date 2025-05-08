#src/model/vo/AutomobileVO.py
from model.vo.ProductVO import ProductVO
import re

class OtherProdVO(ProductVO):
    def __init__(self, product_Id:int, price:float, brand:str, model:str, year_manufacture:str, plocation:str, ptype:str, pdescription:str, pimage,
                 size_of:float, usedFor:str) -> None:
        
        # Llamamos al constructor de la clase padre (ProductVO)
        super().__init__(product_Id, price, brand, model, year_manufacture, plocation, ptype, pdescription, pimage)

        self.size_of = size_of
        self.usedFor = usedFor

    @property
    def size_of(self) -> float:
        return self._size_of
    
    @size_of.setter
    def size_of(self, size_of:float) -> float:
        if size_of <= 0:
            raise ValueError("El tamaño debe ser un número positivo.")
        
        self._size_of = size_of

    @property
    def usedFor(self) -> str:
        return self._usedFor
    
    @usedFor.setter
    def usedFor(self, usedFor:str) -> str:
        if not usedFor or len(usedFor) < 1:
            raise ValueError("El uso no puede estar vacío.")
        
        self._usedFor = usedFor