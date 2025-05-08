#src/model/vo/AutomobileVO.py
from model.vo.ProductVO import ProductVO
import re

class OtherProdVO(ProductVO):
    def __init__(self, product_Id:int, price:float, brand:str, model:str, year_manufacture:str, plocation:str, ptype:str, pdescription:str, pimage,
                 size:float, usedFor:str) -> None:
        
        # Llamamos al constructor de la clase padre (ProductVO)
        super().__init__(product_Id, price, brand, model, year_manufacture, plocation, ptype, pdescription, pimage)

        self.size = size
        self.usedFor = usedFor

