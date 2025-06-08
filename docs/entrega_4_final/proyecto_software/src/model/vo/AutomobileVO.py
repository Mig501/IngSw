#src/model/vo/AutomobileVO.py
from model.vo.ProductVO import ProductVO
class AutomobileVO(ProductVO):

    VALID_ENGINES = ['Gasolina', 'Diesel', 'Hibrido', 'Electrico', 'Hibrido enchufable', 'Hidrogeno', 'Biocombustible']
    VALID_ENVIRONMENTAL_LABELS = ['0', 'ECO', 'B', 'C']

    def __init__(self, product_id: int, client_id: int, price: float, brand: str, model: str, year_manufacture: str,
                 plocation: str, ptype: str, pdescription: str, kilometers: int, engine: str, consume: float,
                 autonomy: int, environmental_label, image_path) -> None:
        
        super().__init__(product_id, client_id, price, brand, model, year_manufacture, plocation, ptype, pdescription, image_path)
        self.kilometers = kilometers
        self.engine = engine
        self.consume = consume
        self.autonomy = autonomy
        self.environnmental_label = environmental_label

    # Getters and Setters for all fields
    @property
    def kilometers(self) -> int:
        return self._kilometers

    @kilometers.setter
    def kilometers(self, kilometers: int) -> None:
        if kilometers < 0:
            raise ValueError("Kilometers cannot be negative.")
        
        self._kilometers = kilometers

    @property
    def engine(self) -> str:
        return self._engine
    
    @engine.setter
    def engine(self, engine: str) -> None:
        if engine not in self.VALID_ENGINES:
            raise ValueError(f"Invalid engine type. Valid options are: {self.VALID_ENGINES}")
        
        self._engine = engine

    @property
    def consume(self) -> float:
        return self._consume
    
    @consume.setter
    def consume(self, consume: float) -> None:
        if consume < 0:
            raise ValueError("Consume cannot be negative.")
        
        self._consume = consume

    @property
    def autonomy(self) -> int:
        return self._autonomy
    
    @autonomy.setter
    def autonomy(self, autonomy: int) -> None:
        if autonomy < 0:
            raise ValueError("Autonomy cannot be negative.")

        self._autonomy = autonomy
