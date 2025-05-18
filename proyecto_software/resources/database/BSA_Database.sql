CREATE TABLE `users` (
   `UserID` int NOT NULL AUTO_INCREMENT,
   `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
   `userpassword` varchar(60) NOT NULL,
   `email` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
   `phone_number` char(9) DEFAULT NULL,
   `rol` varchar(20) NOT NULL DEFAULT 'cliente',
   PRIMARY KEY (`UserID`),
   UNIQUE KEY `Username` (`username`),
   UNIQUE KEY `UserPassword` (`userpassword`),
   UNIQUE KEY `phone_number_UNIQUE` (`phone_number`)
 );
 
 CREATE TABLE `workshop` (
   `WS_zip_code` char(5) NOT NULL,
   `size_of` decimal(7,2) NOT NULL,
   `phone_number` char(9) DEFAULT NULL,
   `Inv_parking_slot` int NOT NULL,
   `Inv_num_pieces` int NOT NULL,
   `add_street` varchar(50) NOT NULL,
   `add_number` int NOT NULL,
   `add_city` varchar(50) NOT NULL,
   PRIMARY KEY (`WS_zip_code`),
   UNIQUE KEY `phone_number` (`phone_number`)
 );
 
  CREATE TABLE `archs` (
   `ArchID` int NOT NULL AUTO_INCREMENT,
   `UsrArchID` int NOT NULL,
   `passport` char(9) DEFAULT NULL,
   `ss_number` char(12) DEFAULT NULL,
   `dwell_time` int DEFAULT NULL,
   `age` int DEFAULT NULL,
   `first_name` varchar(50) DEFAULT NULL,
   `second_name` varchar(50) DEFAULT NULL,
   PRIMARY KEY (`ArchID`),
   UNIQUE KEY `UsrArchID` (`UsrArchID`),
   UNIQUE KEY `passport_UNIQUE` (`passport`),
   UNIQUE KEY `ss_number_UNIQUE` (`ss_number`),
   CONSTRAINT `archs_ibfk_1` FOREIGN KEY (`UsrArchID`) REFERENCES `users` (`UserID`)
 );
 
CREATE TABLE `admins` (
   `AdminID` int NOT NULL AUTO_INCREMENT,
   `UsrAdminID` int NOT NULL,
   `passport` char(9) DEFAULT NULL,
   `ss_number` char(12) DEFAULT NULL,
   `dwell_time` int DEFAULT NULL,
   `age` int DEFAULT NULL,
   `first_name` varchar(50) DEFAULT NULL,
   `second_name` varchar(50) DEFAULT NULL,
   `ArchID` int DEFAULT NULL,
   PRIMARY KEY (`AdminID`),
   UNIQUE KEY `UsrAdminID` (`UsrAdminID`),
   UNIQUE KEY `passport_UNIQUE` (`passport`),
   UNIQUE KEY `ss_number_UNIQUE` (`ss_number`),
   KEY `FK_ArchID` (`ArchID`),
   CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`UsrAdminID`) REFERENCES `users` (`UserID`),
   CONSTRAINT `FK_ArchID` FOREIGN KEY (`ArchID`) REFERENCES `archs` (`UsrArchID`)
 );

CREATE TABLE `employees` (
   `EmployeeID` int NOT NULL AUTO_INCREMENT,
   `UsrEmpID` int NOT NULL,
   `employee_passport` char(9) DEFAULT NULL,
   `ss_number` char(12) DEFAULT NULL,
   `dwell_time` int DEFAULT NULL,
   `age` int DEFAULT NULL,
   `specialization` varchar(50) DEFAULT NULL,
   `first_name` varchar(50) DEFAULT NULL,
   `second_name` varchar(50) DEFAULT NULL,
   `AdminID` int DEFAULT NULL,
   `WS_zip_code` char(5) NOT NULL,
   PRIMARY KEY (`EmployeeID`),
   UNIQUE KEY `UsrEmpID` (`UsrEmpID`),
   UNIQUE KEY `employee_passport_UNIQUE` (`employee_passport`),
   UNIQUE KEY `ss_number_UNIQUE` (`ss_number`),
   KEY `FK_WS_zip_code` (`WS_zip_code`),
   KEY `FK_AdminID` (`AdminID`),
   CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`UsrEmpID`) REFERENCES `users` (`UserID`),
   CONSTRAINT `FK_AdminID` FOREIGN KEY (`AdminID`) REFERENCES `admins` (`AdminID`),
   CONSTRAINT `FK_WS_zip_code` FOREIGN KEY (`WS_zip_code`) REFERENCES `workshop` (`WS_zip_code`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `chk_specialization` CHECK ((`specialization` in (_utf8mb4'mecánico',_utf8mb4'informático',_utf8mb4'electricista')))
 );
 
 CREATE TABLE `clients` (
   `ClientID` int NOT NULL,
   `num_ventas` int DEFAULT '0',
   `num_compras` int DEFAULT '0',
   `saldo` decimal(10,2) DEFAULT '0.00',
   `WS_zip_code` char(5) NOT NULL,
   PRIMARY KEY (`ClientID`),
   KEY `WS_zip_code` (`WS_zip_code`),
   CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `users` (`UserID`),
   CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`WS_zip_code`) REFERENCES `workshop` (`WS_zip_code`) ON DELETE CASCADE ON UPDATE CASCADE
 );
 
CREATE TABLE `user_products` (
   `ProductID` bigint NOT NULL AUTO_INCREMENT,
   `ClientID` int NOT NULL,
   `price` decimal(10,2) NOT NULL,
   `brand` varchar(30) NOT NULL,
   `model` varchar(70) NOT NULL,
   `year_manufacture` char(4) NOT NULL,
   `plocation` varchar(50) DEFAULT NULL,
   `ptype` varchar(25) NOT NULL,
   `pdescription` text,
   `vendido` BOOLEAN NOT NULL DEFAULT FALSE,
   PRIMARY KEY (`ProductID`),
   KEY `ClientID` (`ClientID`),
   CONSTRAINT `user_products_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
   CONSTRAINT `user_products_chk_1` CHECK ((`ptype` in (_utf8mb4'automóviles',_utf8mb4'otros')))
 );
 ALTER TABLE user_products ADD vendido BOOLEAN NOT NULL DEFAULT FALSE;

 
  CREATE TABLE `services` (
   `ServiceID` int NOT NULL AUTO_INCREMENT,
   `EmployeeID` int NOT NULL,
   `price` decimal(10,2) NOT NULL,
   `ser_name` varchar(50) NOT NULL,
   `ser_description` text,
   PRIMARY KEY (`ServiceID`),
   KEY `EmployeeID` (`EmployeeID`),
   CONSTRAINT `services_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`)
 );
 
 CREATE TABLE `automovil` (
   `ProductID` bigint NOT NULL AUTO_INCREMENT,
   `kilometers` int NOT NULL,
   `engine` varchar(50) NOT NULL,
   `consume` decimal(3,1) NOT NULL,
   `autonomy` smallint NOT NULL,
   `enviormental_label` varchar(3) NOT NULL,
   PRIMARY KEY (`ProductID`),
   CONSTRAINT `automovil_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `user_products` (`ProductID`),
   CONSTRAINT `automovil_chk_1` CHECK ((`enviormental_label` in (_utf8mb4'ECO',_utf8mb4'0',_utf8mb4'B',_utf8mb4'C'))),
   CONSTRAINT `automovil_chk_2` CHECK ((`engine` in (_utf8mb4'Gasolina',_utf8mb4'Diesel',_utf8mb4'Electrico',_utf8mb4'Hibrido',_utf8mb4'Hibrido enchufable',_utf8mb4'Hidrogeno',_utf8mb4'Biocombustible')))
 );

 CREATE TABLE `client_services` (
   `ClientID` int NOT NULL,
   `ServiceID` int NOT NULL,
   `Service_date` date NOT NULL,
   `Service_time` time NOT NULL,
   PRIMARY KEY (`ClientID`,`ServiceID`),
   KEY `ServiceID` (`ServiceID`),
   CONSTRAINT `client_services_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
   CONSTRAINT `client_services_ibfk_2` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`)
 );

 CREATE TABLE `employee_services` (
   `EmployeeID` int NOT NULL,
   `ServiceID` int NOT NULL,
   `Service_date` date NOT NULL,
   `Service_time` time NOT NULL,
   PRIMARY KEY (`EmployeeID`,`ServiceID`),
   KEY `ServiceID` (`ServiceID`),
   CONSTRAINT `employee_services_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
   CONSTRAINT `employee_services_ibfk_2` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`)
 );

CREATE TABLE `employee_workshop` (
   `EmployeeID` int NOT NULL,
   `WS_zip_code` char(5) NOT NULL,
   PRIMARY KEY (`EmployeeID`,`WS_zip_code`),
   KEY `WS_zip_code` (`WS_zip_code`),
   CONSTRAINT `employee_workshop_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
   CONSTRAINT `employee_workshop_ibfk_2` FOREIGN KEY (`WS_zip_code`) REFERENCES `workshop` (`WS_zip_code`)
 );

 CREATE TABLE `other` (
   `ProductID` bigint NOT NULL AUTO_INCREMENT,
   `size_of` decimal(7,2) NOT NULL,
   `usedFor` varchar(50) NOT NULL,
   PRIMARY KEY (`ProductID`),
   CONSTRAINT `other_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `user_products` (`ProductID`)
 );

CREATE TABLE `pimage` (
   `ProductID` bigint NOT NULL,
   `pimage` varchar(255) NOT NULL,
   PRIMARY KEY (`ProductID`),
   CONSTRAINT `pimage_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `user_products` (`ProductID`)
 );

CREATE TABLE `product_purchase` (
   `ClientID` int NOT NULL,
   `ProductID` bigint NOT NULL,
   `Purchase_date` date NOT NULL,
   `Purchase_time` time NOT NULL,
   PRIMARY KEY (`ClientID`,`ProductID`),
   KEY `ProductID` (`ProductID`),
   CONSTRAINT `product_purchase_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
   CONSTRAINT `product_purchase_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `user_products` (`ProductID`)
 );

 CREATE TABLE `workshop_products` (
   `WS_zip_code` char(5) NOT NULL,
   `ProductID` bigint NOT NULL,
   PRIMARY KEY (`WS_zip_code`,`ProductID`),
   KEY `ProductID` (`ProductID`),
   CONSTRAINT `workshop_products_ibfk_1` FOREIGN KEY (`WS_zip_code`) REFERENCES `workshop` (`WS_zip_code`),
   CONSTRAINT `workshop_products_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `user_products` (`ProductID`)
 );