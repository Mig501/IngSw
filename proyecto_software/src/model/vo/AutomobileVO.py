from ProductVO import ProductVO
class AutomobileVO(ProductVO):

    def __init__(self, product_id: int, client_id: int, price: float, brand: str, model: str, year_manufacture: str,
                 plocation: str, ptype: str, pdescription: str, kilometers: int, engine: str, consume: float,
                 autonomy: int, environmental_label, image_path) -> None:
        super().__init__(product_id, client_id, price, brand, model, year_manufacture, plocation, ptype, pdescription, image_path)
        self._kilometers = kilometers
        self._engine = engine
        self._consume = consume
        self._autonomy = autonomy
        self.environnmental_label = environmental_label

    # Getters and Setters for all fields
    @property
    def kilometers(self) -> int:
        return self._kilometers
    
    @kilometers.setter
    def kilometers(self, kilometers: int) -> None:
        self._kilometers = kilometers

    @property
    def engine(self) -> str:
        return self._engine
    
    @engine.setter
    def engine(self, engine: str) -> None:
        self._engine = engine

    @property
    def consume(self) -> float:
        return self._consume
    
    @consume.setter
    def consume(self, consume: float) -> None:
        self._consume = consume

    @property
    def autonomy(self) -> int:
        return self._autonomy
    
    @autonomy.setter
    def autonomy(self, autonomy: int) -> None:
        self._autonomy = autonomy
