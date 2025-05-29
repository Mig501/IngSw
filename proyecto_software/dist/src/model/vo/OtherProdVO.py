from model.vo.ProductVO import ProductVO
class OtherProductVO(ProductVO):

    def __init__(self, product_id: int, client_id: int, price: float, brand: str, model: str, year_manufacture: str,
                 plocation: str, ptype: str, pdescription: str, size_of: float, used_for: str, image_path) -> None:
        super().__init__(product_id, client_id, price, brand, model, year_manufacture, plocation, ptype, pdescription, image_path)
        self.size_of = size_of
        self.used_for = used_for
    
    # Getters and Setters for all fields
    @property
    def size_of(self) -> float:
        return self._size_of
     
    @size_of.setter
    def size_of(self, size_of: float) -> None:
        if size_of <= 0:
            raise ValueError("Size must be a positive number.")
        
        self._size_of = size_of

    @property
    def used_for(self) -> str:
        return self._used_for
    
    @used_for.setter
    def used_for(self, used_for: str) -> None:
        if not used_for:
            raise ValueError("Used for cannot be empty.")
        
        self._used_for = used_for
