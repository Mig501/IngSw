# src/model/loggerSingleton.py
from datetime import datetime
import os

class LoggerSingleton:

    _instance = None
    _logs = []
    _log_dir = "logs"

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super().__new__(cls, *args, **kwargs)

            # Creamos la carpeta de logs si no existe
            if not os.path.exists(cls._log_dir):
                os.makedirs(cls._log_dir)
        
        return cls._instance
    
    def add_log_activity(self, message:str) -> None:
        """
        Añade un mensaje de actividad al log.
        """
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        msg = f"[{timestamp}] {message}"
        self._logs.append(msg)
        self._write_log_to_file(msg)

    def _write_log_to_file(self, message:str) -> None:
        """
        Escribe un mensaje de log en un archivo
        """
        file = datetime.now().strftime(f"{self._log_dir}/logs_%Y-%m-%d.txt")
        with open(file, "a", encoding="utf-8") as f:
            f.write(message + "\n")

    def print_log(self) -> None:
        """
        Muestra todos los logs del sistema.
        """
        print("==== SYSTEM LOGS ====")
        for idx, log in enumerate(self._logs):
            print(f"{idx}. {log}")

    def get_log(self):
        """
        Devuelve una copia de la lista de logs.
        """
        return self._logs.copy()
    
    def clear_log(self) -> None:
        """
        Limpia el log del sistema.
        """
        self._logs.clear()

    def load_logs_for_date(self, date:str) -> bool:
        """
        Carga los logs de un archivo específico basado en la fecha.
        Devuelve True si se cargaron logs, False si no se encontraron.
        """
        file = f"{self._log_dir}/logs_{date}.txt"
        if os.path.exists(file):
            with open(file, "r", encoding="utf-8") as f:
                self._logs = f.readlines().splitlines()
            return True
        
        else:
            self._logs = []
            return False