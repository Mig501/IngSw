/*CREATE DATABASE BSA_Database_ISW;
GO*/

USE BSA_Database_ISW;

DROP TABLE IF EXISTS User;

CREATE TABLE Users (
	UserID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(15) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    userpassword VARCHAR(20) NOT NULL, 
    email VARCHAR(90) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    phone_number CHAR(9)
    /*Add_Zip_Code VARCHAR(10),
    Add_Country CHAR(3), 
    Add_Street VARCHAR(100) CHARACTER SET utf8mb4,
    Add_Number INT,
    Add_Floor_Num VARCHAR(5),
    Log_Date DATETIME DEFAULT NOW()*/
    /*hay que añadir el campo para el rol de cada user para a la 
    de iniciar sesión, que pueda buscar en la base*/
)

