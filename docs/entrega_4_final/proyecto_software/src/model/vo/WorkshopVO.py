class WorkshopVO:
    def __init__(self, ws_zip_code: str, size_of: float, phone_number: str, inv_parking_slot: str,
                 inv_num_pieces: int, add_street: str, add_number: int, add_city: str) -> None:
        self.ws_zip_code = ws_zip_code
        self.size_of = size_of
        self.phone_number = phone_number
        self.inv_parking_slot = inv_parking_slot
        self.inv_num_pieces = inv_num_pieces
        self.add_street = add_street
        self.add_number = add_number
        self.add_city = add_city

    @property
    def ws_zip_code(self) -> str:
        return self._ws_zip_code

    @ws_zip_code.setter
    def ws_zip_code(self, ws_zip_code: str) -> None:
        self._ws_zip_code = ws_zip_code

    @property
    def size_of(self) -> float:
        return self._size_of

    @size_of.setter
    def size_of(self, size_of: float) -> None:
        self._size_of = size_of

    @property
    def phone_number(self) -> str:
        return self._phone_number

    @phone_number.setter
    def phone_number(self, phone_number: str) -> None:
        self._phone_number = phone_number

    @property
    def inv_parking_slot(self) -> str:
        return self._inv_parking_slot

    @inv_parking_slot.setter
    def inv_parking_slot(self, inv_parking_slot: str) -> None:
        self._inv_parking_slot = inv_parking_slot

    @property
    def inv_num_pieces(self) -> int:
        return self._inv_num_pieces

    @inv_num_pieces.setter
    def inv_num_pieces(self, inv_num_pieces: int) -> None:
        self._inv_num_pieces = inv_num_pieces

    @property
    def add_street(self) -> str:
        return self._add_street

    @add_street.setter
    def add_street(self, add_street: str) -> None:
        self._add_street = add_street

    @property
    def add_number(self) -> int:
        return self._add_number

    @add_number.setter
    def add_number(self, add_number: int) -> None:
        self._add_number = add_number
