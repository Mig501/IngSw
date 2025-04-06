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
<<<<<<< HEAD
    Add_Country CHAR(3), 
    Add_Street VARCHAR(100) CHARACTER SET utf8mb4,
    Add_Number INT,
    Add_Floor_Num VARCHAR(5),
=======
    Country CHAR(3), 
    Street VARCHAR(100) CHARACTER SET utf8mb4,
    Number INT,
    Floor_Num VARCHAR(5),
    Phone_Number CHAR(16),
>>>>>>> a4d8439fdc6cf4e40e68fdc5219924bb50497d44
    Log_Date DATETIME DEFAULT NOW()*/
    /*hay que añadir el campo para el rol de cada user para a la 
    de iniciar sesión, que pueda buscar en la base*/
)

