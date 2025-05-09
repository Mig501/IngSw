CREATE DATABASE BSA_Database_ISW;

USE BSA_Database_ISW;

DROP TABLE IF EXISTS User;

CREATE TABLE Users (
	UserID INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(15) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    userpassword VARCHAR(60) NOT NULL, 
    email VARCHAR(90) CHARACTER SET utf8mb4 NOT NULL UNIQUE,
    phone_number CHAR(9) UNIQUE,
    rol VARCHAR(20) NOT NULL DEFAULT 'cliente';
)

CREATE TABLE clients (
	ClientID INT PRIMARY KEY,
    WS_zip_code CHAR(5) NOT NULL,
    num_ventas INT DEFAULT 0,
    num_compras INT DEFAULT 0,
    saldo DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (ClientID) REFERENCES users(UserID),
    FOREIGN KEY (WS_zip_code) REFERENCES workshop(WS_zip_code),
);

CREATE TABLE employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,     
    UsrEmpID INT UNIQUE NOT NULL,
    AdminID INT UNIQUE NOT NULL,
    WS_zip_code CHAR(5) NOT NULL,
    employee_passport CHAR(9) UNIQUE,
    ss_number CHAR(12) UNIQUE,
    dwell_time INT,
    age INT,
    specialization VARCHAR(50),
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    FOREIGN KEY (UsrEmpID) REFERENCES users(UserID),
    FOREIGN KEY (AdminID) REFERENCES admins(AdminID),
    FOREIGN KEY (WS_zip_code) REFERENCES workshop(WS_zip_code),
    CHECK (specialization IN ('mecáncio', 'electricista', 'informático'))
);
-- El check ponerlo así en el workbench
ALTER TABLE employees
ADD CONSTRAINT chk_specialization 
CHECK (specialization IN ('mecánico', 'informático', 'electricista'));

CREATE TABLE admins (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    UsrAdminID INT UNIQUE NOT NULL,
    ArchID INT UNIQUE NOT NULL,
    passport CHAR(9) UNIQUE,
    ss_number CHAR(12) UNIQUE,
    dwell_time INT,
    age INT,
    first_name VARCHAR(50),
    second_name VARCHAR(50),
    FOREIGN KEY (UsrAdminID) REFERENCES users(UserID)
    FOREIGN KEY (ArchID) REFERENCES archs(ArchID)
);
-- Relacionar `admins` con `archs`
ALTER TABLE admins 
    ADD CONSTRAINT fk_arch_id 
    FOREIGN KEY (ArchID) REFERENCES archs(ArchID);

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
    plocation POINT ,
    ptype VARCHAR(25) NOT NULL,
    pdescription TEXT NULL,
    CHECK (ptype IN ('automóviles', 'otros'))
)

CREATE TABLE pimage (
    ProductID BIGINT NOT NULL,
    pimage VARCHAR(255) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
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

CREATE TABLE services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    AdminID INT UNIQUE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    ser_name VARCHAR(50) NOT NULL,
    ser_description TEXT,
    FOREIGN KEY (AdminID) REFERENCES admins(AdminID),
)

CREATE TABLE workshop (
    WS_zip_code CHAR(5) NOT NULL,
    size_of DECIMAL(7, 2) NOT NULL,
    phone_number CHAR(9) UNIQUE,
    Inv_parking_slot VARCHAR(50) NOT NULL,
    Inv_num_pieces INT NOT NULL,
    add_street VARCHAR(50) NOT NULL,
    add_number INT NOT NULL,
    add_city VARCHAR(50) NOT NULL,
)

CREATE TABLE client_services (
    ClientID INT NOT NULL,
    ServiceID INT NOT NULL,
    Service_date DATE NOT NULL,
    Service_time TIME NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES clients(ClientID),
    FOREIGN KEY (ServiceID) REFERENCES services(ServiceID)
)

CREATE TABLE client_products (
    ClientID INT NOT NULL,
    ProductID BIGINT NOT NULL,
    Purchase_date DATE NOT NULL,
    Purchase_time TIME NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES clients(ClientID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
)

CREATE TABLE employee_services (
    EmployeeID INT NOT NULL,
    ServiceID INT NOT NULL,
    Service_date DATE NOT NULL,
    Service_time TIME NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (ServiceID) REFERENCES services(ServiceID)
)

CREATE TABLE employee_workshop (
    EmployeeID INT NOT NULL,
    WS_zip_code CHAR(5) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (WS_zip_code) REFERENCES workshop(WS_zip_code)
)

CREATE TABLE workshop_products (
    WS_zip_code CHAR(5) NOT NULL,
    ProductID BIGINT NOT NULL,
    FOREIGN KEY (WS_zip_code) REFERENCES workshop(WS_zip_code),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
)