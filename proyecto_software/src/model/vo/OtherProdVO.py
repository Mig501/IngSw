class OtherProductVO:
    def __init__(self, product_id: int, client_id: int, price: float, brand: str, model: str, year_manufacture: str, 
                 plocation: str, ptype: str, pdescription: str, size_of: float, used_for: str, image_path) -> None:
        self.product_id = product_id
        self.client_id = client_id
        self.price = price
        self.brand = brand
        self.model = model
        self.year_manufacture = year_manufacture
        self.plocation = plocation
        self.ptype = ptype
        self.pdescription = pdescription
        self.size_of = size_of
        self.used_for = used_for
        self.image_path = image_path

    # Getters and Setters for all fields
    @property
    def size_of(self) -> float:
        return self._size_of
    
    @size_of.setter
    def size_of(self, size_of: float) -> None:
        self._size_of = size_of

    @property
    def used_for(self) -> str:
        return self._used_for
    
    @used_for.setter
    def used_for(self, used_for: str) -> None:
        self._used_for = used_for
