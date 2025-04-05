/*CREATE DATABASE BSA_Database_ISW;
GO*/

USE BSA_Database_ISW;

DROP TABLE IF EXISTS User;

CREATE TABLE Users (
	UserID CHAR(7) PRIMARY KEY,
    Username VARCHAR(15) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    UserPassword VARCHAR(20) NOT NULL, 
    Email VARCHAR(90) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    /*Add_Zip_Code VARCHAR(10),
    Country CHAR(3), 
    Street VARCHAR(100) CHARACTER SET utf8mb4,
    Number INT,
    Floor_Num VARCHAR(5),
    Phone_Number CHAR(16),
    Log_Date DATETIME DEFAULT NOW()*/
    /*hay que añadir el campo para el rol de cada user para a la 
    de iniciar sesión, que pueda buscar en la base*/
)

