CREATE DATABASE BSA_Database_ISW;

USE BSA_Database_ISW;

DROP TABLE IF EXISTS User;

CREATE TABLE Users (
	UserID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(15) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    userpassword VARCHAR(60) NOT NULL, 
    email VARCHAR(90) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    phone_number CHAR(9) UNIQUE
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
    employee_passport CHAR(9) UNIQUE,
    ss_number CHAR(12) UNIQUE,
    dwell_time INT,
    age INT,
    specialization VARCHAR(50),
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    FOREIGN KEY (UsrEmpID) REFERENCES users(UserID)
    CHECK (specialization IN ('mecáncio', 'electricista', 'informático'))
);
-- El check ponerlo así en el workbench
ALTER TABLE employees
ADD CONSTRAINT chk_specialization 
CHECK (specialization IN ('mecánico', 'informático', 'electricista'));


CREATE TABLE admins (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    UsrAdminID INT UNIQUE NOT NULL,
    passport CHAR(9) UNIQUE,
    ss_number CHAR(12) UNIQUE,
    dwell_time INT,
    age INT,
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    FOREIGN KEY (UsrAdminID) REFERENCES users(UserID)
);


CREATE TABLE archs (
    ArchID INT AUTO_INCREMENT PRIMARY KEY,
    UsrArchID INT UNIQUE NOT NULL,
    passport CHAR(9) UNIQUE,
    ss_number CHAR(12) UNIQUE,
    dwell_time INT,
    age INT,
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    FOREIGN KEY (UsrArchID) REFERENCES users(UserID)
);

CREATE TABLE products (
    ProductID BIGINT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(10, 2) NOT NULL,
    brand VARCHAR(30) NOT NULL,
    model VARCHAR(70) NOT NULL,
    year_manufacture CHAR(4) NOT NULL,
    plocation POINT ,--POINT(40.7128-74.0060)
    ptype VARCHAR(25) NOT NULL,
    pdescription TEXT NULL,
    pimage VARCHAR(255) NULL,
    CHECK (ptype IN ('automóviles', 'otros'))
)

CREATE TABLE automovil (
    ProductID BIGINT AUTO_INCREMENT PRIMARY KEY,
    kilometers INT NOT NULL,
    engine VARCHAR(50) NOT NULL,
    consume DECIMAL(2, 1) NOT NULL,
    autonomy SMALLINT NOT NULL,
    enviormental_label VARCHAR(3) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES products(ProductID),
    CHECK (enviormental_label IN ('ECO', '0', 'B', 'C'))
)

CREATE TABLE other(
    ProductID BIGINT AUTO_INCREMENT PRIMARY KEY,
    size_of DECIMAL(7, 2) NOT NULL, --Tamaño en cm
    usedFor VARCHAR(50) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
)