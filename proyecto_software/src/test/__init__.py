# Archivo para que el módulo test sea considerado un paquete
import os

test_folder = "/mnt/data/src/test"
init_path = os.path.join(test_folder, "__init__.py")

os.makedirs(test_folder, exist_ok=True)

with open(init_path, "w") as f:
    pass

init_path