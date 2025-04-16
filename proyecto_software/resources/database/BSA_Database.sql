CREATE DATABASE BSA_Database_ISW;

USE BSA_Database_ISW;

DROP TABLE IF EXISTS User;

CREATE TABLE Users (
	UserID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(15) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    userpassword VARCHAR(60) NOT NULL, 
    email VARCHAR(90) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    phone_number CHAR(9)
)

ALTER TABLE users
ADD rol VARCHAR(20) NOT NULL DEFAULT 'cliente';

CREATE TABLE clients (
	ClientID INT PRIMARY KEY,
    num_ventas INT DEFAULT 0,
    num_compras INT DEFAULT 0,
    saldo DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (ClientID) REFERENCES users(UserID)
);

CREATE TABLE employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,     -- Identificador propio del empleado
    UsrEmpID INT UNIQUE NOT NULL,                    -- Referencia a la tabla users
    employee_passport VARCHAR(30),
    ss_number VARCHAR(30),
    dwell_time INT,
    age INT,
    specialization VARCHAR(50),
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    FOREIGN KEY (UsrEmpID) REFERENCES users(UserID)
);



CREATE TABLE admins (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    UsrAdminID INT UNIQUE NOT NULL,
    passport VARCHAR(30),
    ss_number VARCHAR(30),
    dwell_time INT,
    age INT,
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    FOREIGN KEY (UsrAdminID) REFERENCES users(UserID)
);



CREATE TABLE archs (
    ArchID INT AUTO_INCREMENT PRIMARY KEY,
    UsrArchID INT UNIQUE NOT NULL,
    passport VARCHAR(30),
    ss_number VARCHAR(30),
    dwell_time INT,
    age INT,
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    FOREIGN KEY (UsrArchID) REFERENCES users(UserID)
);