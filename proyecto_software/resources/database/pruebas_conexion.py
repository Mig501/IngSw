# src/database/pruebas_conexion.py
import pymysql

#conexion=mysql.connector.connect( host='localhost', user='root', password='changeme')
conexion=pymysql.connect(host='localhost', user='root', password='changeme')
cursor=conexion.cursor()
cursor.execute("show databases")
for base in cursor:
    print(base)
conexion.close()