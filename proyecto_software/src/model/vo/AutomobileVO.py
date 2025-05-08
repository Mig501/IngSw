#src/model/vo/AutomobileVO.py
from model.vo.ProductVO import ProductVO
import re

class AutomobileVO(ProductVO):
    def __init__(self, product_Id:int, price:float, brand:str, model:str, year_manufacture:str, plocation:str, ptype:str, pdescription:str, pimage,
                 kilometers:int, engine:str, consume:float, autonomy:int, environmental_label:str) -> None:
        
        # Llamamos al constructor de la clase padre (ProductVO)
        super().__init__(product_Id, price, brand, model, year_manufacture, plocation, ptype, pdescription, pimage)

        self.kilometers = kilometers
        self.engine = engine
        self.consume = consume
        self.autonomy = autonomy
        self.environmental_label = environmental_label

    @property
    def kilometers(self) -> int:
        return self._kilometers
    
    @kilometers.setter
    def kilometers(self, kilometers:int) -> int:
        if kilometers <= 0:
            raise ValueError("Los kilómetros deben ser un número entero positivo.")
        
        self._kilometers = kilometers

    @property
    def engine(self) -> str:
        return self._engine
    
    @engine.setter
    def engine(self, engine:str) -> str:
        if not engine or len(engine) < 1:
            raise ValueError("El motor no puede estar vacío.")
        
        self._engine = engine

    @property
    def consume(self) -> float:
        return self._consume
    
    @consume.setter
    def consume(self, consume:float) -> float:
        if consume <= 0:
            raise ValueError("El consumo debe ser un número positivo.")
        
        self._consume = consume

    @property
    def autonomy(self) -> int:
        return self._autonomy
    
    @autonomy.setter
    def autonomy(self, autonomy:int) -> int:
        if autonomy <= 0:
            raise ValueError("La autonomía debe ser un número entero positivo.")
        
        self._autonomy = autonomy

    @property
    def environmental_label(self) -> str:
        return self._environmental_label
    
    @environmental_label.setter
    def environmental_label(self, environmental_label:str) -> str:
        if environmental_label not in ['ECO', 'C', '0', 'B']:
            raise ValueError("Environmental label must be 'ECO', 'C', '0' or 'B'.")
        self._environmental_label = environmental_label
