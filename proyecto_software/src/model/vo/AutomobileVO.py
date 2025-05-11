class AutomobileVO:
    def __init__(self, product_id: int, client_id: int, price: float, brand: str, model: str, year_manufacture: str, 
                 plocation: str, ptype: str, pdescription: str, kilometers: int, engine: str, consume: float, autonomy: int, environmental_label, image_path) -> None:
        self.product_id = product_id
        self.client_id = client_id
        self.price = price
        self.brand = brand
        self.model = model
        self.year_manufacture = year_manufacture
        self.plocation = plocation
        self.ptype = ptype
        self.pdescription = pdescription
        self.kilometers = kilometers
        self.engine = engine
        self.consume = consume
        self.autonomy = autonomy
        self.image_path = image_path
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
