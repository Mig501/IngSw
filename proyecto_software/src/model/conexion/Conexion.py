# src/model/conexion/Conexion.py
import jaydebeapi

class Conexion:
    def __init__(self, host='localhost', database='bsa_database_isw', user='root', password='changeme'):
        self._host = host
        self._database = database
        self._user = user
        self._password = password
        self.conexion = self.createConnection()

    def createConnection(self):
        try:
            jdbc_driver = "com.mysql.cj.jdbc.Driver"
            jar_file = "lib/mysql-connector-j-9.2.0.jar"
            self.conexion = jaydebeapi.connect(
                jdbc_driver,
                f"jdbc:mysql://{self._host}/{self._database}",
                [self._user, self._password],
                jar_file
            )
            return self.conexion
        except Exception as e:
            print("Error creando conexión:", e)
            return None

    """Un cursor es una estructura de control que permite recorrer los resultados de una 
    consulta SQL y manipular fila por fila los datos recuperados desde una base de datos."""
    def getCursor(self):
        if self.conexion is None:
            self.createConnection()
        return self.conexion.cursor()

    def closeConnection(self):
        try:
            if self.conexion:
                self.conexion.close()
                self.conexion = None
        except Exception as e:
            print("Error cerrando conexión:", e)

    # Getters para los datos de conexión
    def get_db_name(self):
        return self._database

    def get_db_user(self):
        return self._user

    def get_db_password(self):
        return self._password

    def get_db_host(self):
        return self._host