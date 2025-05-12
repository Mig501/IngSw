class ServiceVO:
    """
    ServiceVO is a class that represents a service with its details.
    It contains attributes for the service's name, type, and status.
    """

    def __init__(self, serviceid: int, adminID:int, name: str, description: str, price: float):
        """
        Initializes the ServiceVO instance with the given name, type, and status.

        :param name: The name of the service.
        :param service_type: The type of the service.
        :param status: The status of the service.
        """
        self._serviceid = serviceid
        self._adminID = adminID
        self._name = name
        self._description = description
        self._price = price
    
    def __str__(self):
        return f"ServiceVO(serviceid={self._serviceid}, name={self._name}, description={self._description}, price={self._price})"
    
    # Getters and Setters for all fields
    @property
    def serviceid(self) -> int:
        return self._serviceid
    @serviceid.setter
    def serviceid(self, serviceid: int) -> None:
        self._serviceid = serviceid
        
    @property
    def adminID(self) -> int:
        return self._adminID
    @adminID.setter
    def adminID(self, adminID: int) -> None:
        self._adminID = adminID

    @property
    def name(self) -> str:
        return self._name
    @name.setter
    def name(self, name: str) -> None:
        self._name = name

    @property
    def description(self) -> str:
        return self._description
    @description.setter
    def description(self, description: str) -> None:
        self._description = description

    @property
    def price(self) -> float:
        return self._price
    @price.setter
    def price(self, price: float) -> None:
        self._price = price
    