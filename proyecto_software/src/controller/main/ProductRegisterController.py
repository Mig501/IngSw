#src/controller/main/ProductRegisterController.py
from model.BusinessObject import BusinessObject
from model.vo.AutomobileVO import AutomobileVO
from model.vo.OtherProdVO import OtherProductVO
from model.loggerSingleton import LoggerSingleton


class ProductRegisterController:
    def __init__(self, vista):
        self.vista = vista
        self.bo = BusinessObject().product
        self.logger = LoggerSingleton()

        # Conectar la señal de la vista al método registrar_producto
        self.vista.registrar_producto_signal.connect(self.registrar_producto)

    def registrar_producto(self, data: dict):
        """
        Método que procesa y valida los datos del formulario y realiza el registro del producto.

        Args:
            data (dict): Diccionario con todos los campos introducidos por el usuario en la vista.
        """        
        try:
            price = float(data["price"])
        
        except ValueError:
            self.vista.show_message("Error", "El precio debe ser un número válido.", is_error=True)
            return

        brand = data["brand"].strip().lower()
        model = data["model"].strip().lower()

        if not brand or not model:
            self.vista.show_message("Error", "Marca y modelo son obligatorios.", is_error=True)
            return

        try:
            year = int(data["year"])
        
        except ValueError:
            self.vista.show_message("Error", "El año debe ser un número válido.", is_error=True)
            return

        ptype = data["ptype"]
        image_path = data["image"].strip()
        description = data["description"].strip()
        location = data["location"].strip()
        client_id = data["client_id"]
        especificos = data["especificos"]

        try:
            if ptype == "automóviles":
                kilometers = int(especificos["kilometers"])
                consume = float(especificos["consume"])
                autonomy = int(especificos["autonomy"])
                engine = especificos["engine"]
                env_label = especificos["env_label"]

                product_vo = AutomobileVO(
                    None, client_id, price, brand, model, year,
                    location, ptype, description,
                    kilometers, engine, consume, autonomy, env_label,
                    image_path
                )

            elif ptype == "otros":
                size_of = float(especificos["size_of"])
                used_for = especificos["used_for"].strip()
        
                if not used_for:
                    raise ValueError("El campo 'Usado para' es obligatorio.")

                product_vo = OtherProductVO(
                    None, client_id, price, brand, model, year,
                    location, ptype, description, size_of, used_for,
                    image_path
                )

            else:
                raise ValueError("Tipo de producto no válido.")

            # Intentar registrar
            success = self.bo.register_product(product_vo)

            if success:
                self.logger.add_log_activity(f"Producto registrado por cliente {client_id}.")
                self.vista.show_message("Éxito", "Producto registrado correctamente.")
                self.vista.clear_fields()
        
            else:
                self.vista.show_message("Error", "No se pudo registrar el producto.", is_error=True)

        except ValueError as ve:
            self.vista.show_message("Error de validación", str(ve), is_error=True)
        
        except Exception as e:
            self.vista.show_message("Error inesperado", str(e), is_error=True)
