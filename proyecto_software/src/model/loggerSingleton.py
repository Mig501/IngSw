# src/model/loggerSingleton.py
from datetime import datetime

class LoggerSingleton:

    _instance = None
    _logs = []

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super().__new__(cls, *args, **kwargs)
        
        return cls._instance
    
    def add_log_activity(self, message:str) -> None:
        """
        Añade un mensaje de actividad al log.
        """
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        msg = f"[{timestamp}] {message}"
        self._logs.append(msg)

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