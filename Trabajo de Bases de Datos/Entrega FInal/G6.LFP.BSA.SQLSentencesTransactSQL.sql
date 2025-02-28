CREATE DATABASE BSA_Database;
GO

USE BSA_Database;

DROP TABLE IF EXISTS RaitingsTransaction;
DROP TABLE IF EXISTS UserPay;
DROP TABLE IF EXISTS UserTalk;
DROP TABLE IF EXISTS UsersFav;
DROP TABLE IF EXISTS WorUse;
DROP TABLE IF EXISTS DelUse;
DROP TABLE IF EXISTS DelWar;
DROP TABLE IF EXISTS DelTra;
DROP TABLE IF EXISTS TopicChatBot;
DROP TABLE IF EXISTS Automoviles;
DROP TABLE IF EXISTS Other;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Inttra;
DROP TABLE IF EXISTS Vans;
DROP TABLE IF EXISTS Trucks;
DROP TABLE IF EXISTS Nacional;
DROP TABLE IF EXISTS International;
DROP TABLE IF EXISTS Transport;
DROP TABLE IF EXISTS Transport_Partners;
DROP TABLE IF EXISTS ChatBot;
DROP TABLE IF EXISTS Workshop_Employees;
DROP TABLE IF EXISTS Deliverie_Employees;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS WorWar;
DROP TABLE IF EXISTS WareHouses;
DROP TABLE IF EXISTS WorkShops;
DROP TABLE IF EXISTS Contracts;
DROP TABLE IF EXISTS Users;

--Users related tables---------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Users (
	UserID CHAR(7) PRIMARY KEY CHECK (UserID LIKE '[0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'),
	Username NVARCHAR(15) NOT NULL UNIQUE,
	Email NVARCHAR(90) NOT NULL UNIQUE,
	Add_Zip_Code VARCHAR(7) NULL,
	Add_Country CHAR(3) NULL CHECK (Add_Country LIKE '[A-Z][A-Z][A-Z]'),
	Add_Street NVARCHAR(60) NULL,
	Add_Number INT NULL,
	Add_Floor_Num NVARCHAR(5) NULL CHECK (Add_Floor_Num LIKE '[0-9][0-9][0-9][A-Z]'),
	Phone_Number CHAR(16) NULL,
	Log_Date DATE DEFAULT GETDATE(), --TRIGGER
	Conf_Acc_Status BIT NOT NULL DEFAULT(1), --0 inactivo/1 activo
	Conf_Password NVARCHAR(15) NOT NULL,
	Conf_Search_His NVARCHAR(30) NULL,
	Conf_Acc_Type BIT NOT NULL DEFAULT(0), --0 Normal/1 premium
	Avg_Raitings FLOAT(5) NULL DEFAULT(0)--TRIGGER
);

CREATE TABLE UserPay (
	User_Pay_ID CHAR(7),
	UserP_Sell_ID CHAR(7), 
	Payment MONEY NOT NULL,
	PRIMARY KEY (User_Pay_ID, UserP_Sell_ID)
);

CREATE TABLE UserTalk (
	UserT_Ask_ID CHAR(7),
	UserT_Inform_ID CHAR(7),
	Chat NVARCHAR(MAX) NOT NULL,
	PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID)
);

CREATE TABLE UsersFav (
	UserFavID CHAR(7) PRIMARY KEY,
	Fav_Brand VARCHAR(30) NULL 
);

CREATE TABLE RaitingsTransaction (
	Rating FLOAT(5) NULL DEFAULT(0),
	UserR_Pay_ID CHAR(7),
	UserR_Sell_ID CHAR(7),
	PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID)
);

--ChatBot related tables------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ChatBot (
	Num_Query INT,
	CBVersion NVARCHAR(20),
	Work_Emp_Num INT NOT NULL,
	UserID CHAR(7),
	PRIMARY KEY (Num_Query, UserID)
);

CREATE TABLE TopicChatBot (
	Chat_Topic VARCHAR(50) NULL,
	Num_Query INT,
	UserID CHAR(7),
	PRIMARY KEY (Num_Query, UserID)
);

--Employees related tables----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Employees (
	Emp_Num INT PRIMARY KEY IDENTITY(0, 1),
	Emp_Passport VARCHAR(20) NOT NULL UNIQUE,
	SSNumber VARCHAR(20) NOT NULL UNIQUE,
	Email NVARCHAR(90) NOT NULL UNIQUE,
	Fname NVARCHAR(20) NOT NULL,
	Lname NVARCHAR(30) NOT NULL,
	Age INT NULL CHECK (Age >= 16 AND Age <= 70), --TRIGGER
	Add_Zip_Code VARCHAR(7) NULL,
	Add_Country CHAR(3) NULL CHECK (Add_Country LIKE '[A-Z][A-Z][A-Z]'),
	Add_Street NVARCHAR(60) NULL,
	Add_Number INT NULL,
	Add_Floor_Num NVARCHAR(5) NULL CHECK (Add_Floor_Num LIKE '[0-9][0-9][0-9][A-Z]'),
	Birth_Date DATE NOT NULL,
	Dwell_Time INT NULL DEFAULT(0), --TRIGGER
	Category BIT NOT NULL, --0 work/1 deli
	ContractID CHAR(6) NOT NULL
);

CREATE TABLE Workshop_Employees (
	Work_Emp_Num INT PRIMARY KEY,
	Acc_Rate FLOAT NOT NULL DEFAULT(100),
	Specialization VARCHAR(20) NOT NULL,
	WorWarID INT NOT NULL
);

CREATE TABLE Deliverie_Employees (
	Del_Emp_Num INT PRIMARY KEY,
	Del_Route FLOAT NULL,
	Phone_Num CHAR(16) NULL,
	Driving_License NVARCHAR(20) NOT NULL
);

--Contracts related tables----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Contracts (
	ContractID CHAR(6) PRIMARY KEY,
	Sign_Date DATE NOT NULL DEFAULT GETDATE(),
	Holiday_Date DATE NULL,
	Salary MONEY NOT NULL,
	Sch_Days NVARCHAR(18) NOT NULL, --Mon-Wed-Fri
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL
);

--Products related tables-----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Products (
	ZipCode BIGINT PRIMARY KEY,
	Work_Emp_Num INT NULL,
	Del_Emp_Num INT NULL,
	UserID CHAR(7) NOT NULL,
	WareZipCode VARCHAR(7) NULL,
	WorkZipCode VARCHAR(7) NULL,
	IntraID VARCHAR(7) NULL,
	Price MONEY NOT NULL,
	Brand VARCHAR(30) NOT NULL,
	Model VARCHAR(20) NOT NULL,
	PDescription NVARCHAR(600) NULL,
	Discount INT NULL DEFAULT(0),
	Manufact_Year CHAR(4) NOT NULL,
	PLocation GEOGRAPHY NULL,
	Incident NVARCHAR(200) NULL,
	PType BIT NOT NULL, --0 pieza/1 vehículo
	Pimage VARCHAR(300) NULL
);

CREATE TABLE Automoviles (
	Auto_ZipCode BIGINT PRIMARY KEY,
	KM FLOAT(8) NOT NULL DEFAULT(0),
	License_Plate NVARCHAR(12) NOT NULL,
	Gears_Num TINYINT NOT NULL,
	Fuel_Capacity INT NOT NULL,
	Engine VARCHAR(50) NOT NULL,
	Consume FLOAT(3) NOT NULL,
	Horse_Power INT NOT NULL,
	Autonomy INT NULL, --TRIGGER
	Trucks_Pack_Num VARCHAR(20) NULL
);

CREATE TABLE Other (
	Oth_ZipCode BIGINT PRIMARY KEY,
	Size VARCHAR(11) NOT NULL,
	Used_for NVARCHAR(600) NOT NULL,
	Vans_Pack_Num VARCHAR(20) NULL
);

--WorWar related tables-------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE WorkShops (
	WorkZipCode VARCHAR(7) PRIMARY KEY,
	Size INT NOT NULL,
	Phone_Number CHAR(16) NOT NULL,
	Add_Country CHAR(3) NOT NULL CHECK (Add_Country LIKE '[A-Z][A-Z][A-Z]') UNIQUE,
	Add_Street NVARCHAR(60) NOT NULL UNIQUE,
	Add_Number INT NOT NULL UNIQUE
);

CREATE TABLE WareHouses (
	WareZipCode VARCHAR(7) PRIMARY KEY,
	WorkZipCode VARCHAR(7) NOT NULL,
	Inv_Park_Slots INT NOT NULL DEFAULT(0),
	Inv_Pieces_Num INT NOT NULL DEFAULT(0),
	Add_Country CHAR(3) NOT NULL CHECK (Add_Country LIKE '[A-Z][A-Z][A-Z]') UNIQUE,
	Add_Street NVARCHAR(60) NOT NULL UNIQUE,
	Add_Number INT NOT NULL UNIQUE
);

CREATE TABLE WorWar (
	WorWarID INT PRIMARY KEY IDENTITY(0, 1),
	WareZipCode VARCHAR(7) NOT NULL UNIQUE,
	WorkZipCode VARCHAR(7) NOT NULL UNIQUE,
	Inventory INT NOT NULL DEFAULT(0)--TRIGGER
);

--Transport related tables----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Transport (
	Pack_Num VARCHAR(20) PRIMARY KEY,
	Localizer VARCHAR(34) NOT NULL UNIQUE,
	TRoute FLOAT NOT NULL,
	Route_Cost FLOAT(6) NULL, --TRIGGER
	Destination VARCHAR(50) NOT NULL
);

CREATE TABLE Nacional (
	Nat_Pack_Num VARCHAR(20) PRIMARY KEY,
	Region_Covered VARCHAR(100) NOT NULL,
	License_Plate NVARCHAR(12) NOT NULL,
	Cargo BIT NOT NULL --0 Trucks, 1 Vans
);

CREATE TABLE International (
	Inter_Pack_Num VARCHAR(20) PRIMARY KEY,
	Inter_Licenses NVARCHAR(20) NULL,
	Countries_Covered VARCHAR(50) NOT NULL,
	Company_Name VARCHAR(20) NOT NULL
);

CREATE TABLE Inttra (
	IntraID VARCHAR(7) PRIMARY KEY CHECK (IntraID LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]'),
	Intra_Pack_Num VARCHAR(20) NOT NULL UNIQUE,
	Company_Name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Transport_Partners (
	Company_Name VARCHAR(20) PRIMARY KEY
);

CREATE TABLE Vans (
	Vans_Pack_Num VARCHAR(20) PRIMARY KEY,
	Volume_Capacity FLOAT NOT NULL
);

CREATE TABLE Trucks (
	Truck_Pack_Num VARCHAR(20) PRIMARY KEY,
	Weight_Capacity FLOAT NOT NULL
);

--Relations related tables----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE WorUse (
	UserID CHAR(7),
	WorkZipCode VARCHAR(7),
	WUDate DATE NOT NULL DEFAULT GETDATE(),
	PRIMARY KEY (UserID, WorkZipCode)
);

CREATE TABLE DelUse (
	UserID CHAR(7),
	Del_Emp_Num INT,
	PRIMARY KEY (UserID, Del_Emp_Num),
	DuDate DATE NOT NULL DEFAULT GETDATE()
);

CREATE TABLE DelWar (
	Del_Emp_Num INT,
	WareZipCode VARCHAR(7),
	PRIMARY KEY (Del_Emp_Num, WareZipCode)
);

CREATE TABLE DelTra (
	Del_Emp_Num INT,
	Pack_Num VARCHAR(20),
	PRIMARY KEY (Del_Emp_Num, Pack_Num)
);


--Foreign keys-----------------------------------------------------------------------------------------------------------------------------------
--Users related tables---------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE UserPay
ADD CONSTRAINT FK_User_Pay_ID FOREIGN KEY (User_Pay_ID) REFERENCES Users (UserID);

ALTER TABLE UserPay
ADD CONSTRAINT FK_UserP_Sell_ID FOREIGN KEY (UserP_Sell_ID) REFERENCES Users (UserID);

ALTER TABLE UserTalk
ADD CONSTRAINT FK_UserT_Ask_ID FOREIGN KEY (UserT_Ask_ID) REFERENCES Users (UserID);

ALTER TABLE UserTalk
ADD CONSTRAINT FK_UserT_Inform_ID FOREIGN KEY (UserT_Inform_ID) REFERENCES Users (UserID);

ALTER TABLE UsersFav
ADD CONSTRAINT FK_UserFavID FOREIGN KEY (UserFavID) REFERENCES Users (UserID);

ALTER TABLE RaitingsTransaction
ADD CONSTRAINT FK_UserR_Pay_Sell_ID FOREIGN KEY (UserR_Pay_ID, UserR_Sell_ID) REFERENCES UserPay (User_Pay_ID, UserP_Sell_ID);

--ChatBot related tables------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE ChatBot
ADD CONSTRAINT FK_CBUserID FOREIGN KEY (UserID) REFERENCES Users (UserID);

ALTER TABLE ChatBot
ADD CONSTRAINT FK_CBWork_Emp_Num FOREIGN KEY (Work_Emp_Num) REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE TopicChatBot
ADD CONSTRAINT FK_CBTNum_UserID FOREIGN KEY (Num_Query, UserID) REFERENCES ChatBot (Num_Query, UserID);

--Employees related tables----------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Employees
ADD CONSTRAINT FK_ContractID FOREIGN KEY (ContractID) REFERENCES Contracts (ContractID);

ALTER TABLE Workshop_Employees
ADD CONSTRAINT FK_Work_Emp_Num FOREIGN KEY (Work_Emp_Num) REFERENCES Employees (Emp_Num);

ALTER TABLE Workshop_Employees
ADD CONSTRAINT FK_WorWarID FOREIGN KEY (WorWarID) REFERENCES WorWar (WorWarID);

ALTER TABLE Deliverie_Employees
ADD CONSTRAINT FK_Del_Emp_Num FOREIGN KEY (Del_Emp_Num) REFERENCES Employees (Emp_Num);

--Products related tables-----------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Products
ADD CONSTRAINT FK_Prod_Work_Emp_Num FOREIGN KEY (Work_Emp_Num) REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE Products
ADD CONSTRAINT FK_Prod_Del_Emp_Num FOREIGN KEY (Del_Emp_Num) REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE Products
ADD CONSTRAINT FK_Prod_UserID FOREIGN KEY (UserID) REFERENCES Users (UserID);

ALTER TABLE Products
ADD CONSTRAINT FK_Prod_WareZipCode FOREIGN KEY (WareZipCode) REFERENCES WareHouses (WareZipCode);

ALTER TABLE Products
ADD CONSTRAINT FK_Prod_WorkZipCode FOREIGN KEY (WorkZipCode) REFERENCES WorkShops (WorkZipCode);

ALTER TABLE Products
ADD CONSTRAINT FK_Prod_IntraID FOREIGN KEY (IntraID) REFERENCES Inttra (IntraID);

ALTER TABLE Automoviles
ADD CONSTRAINT FK_Auto_ZipCode FOREIGN KEY (Auto_ZipCode) REFERENCES Products (ZipCode);

ALTER TABLE Automoviles
ADD CONSTRAINT FK_Trucks_Pack_Num FOREIGN KEY (Trucks_Pack_Num) REFERENCES Trucks (Truck_Pack_Num);

ALTER TABLE Other
ADD CONSTRAINT FK_Oth_ZipCode FOREIGN KEY (Oth_ZipCode) REFERENCES Products (ZipCode);

ALTER TABLE Other
ADD CONSTRAINT FK_Oth_Vans_Pack_Num FOREIGN KEY (Vans_Pack_Num) REFERENCES Vans (Vans_Pack_Num);

--WorWar related tables-------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE WareHouses
ADD CONSTRAINT FK_WorkZipCode FOREIGN KEY (WorkZipCode) REFERENCES WorkShops (WorkZipCode);

ALTER TABLE WorWar
ADD CONSTRAINT FK_WW_WorkZipCode FOREIGN KEY (WorkZipCode) REFERENCES WorkShops (WorkZipCode);

ALTER TABLE WorWar
ADD CONSTRAINT FK_WW_WareZipCode FOREIGN KEY (WareZipCode) REFERENCES WareHouses (WareZipCode);

--Transport related tables----------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Nacional
ADD CONSTRAINT FK_Nat_Pack_Num FOREIGN KEY (Nat_Pack_Num) REFERENCES Transport (Pack_Num);

ALTER TABLE International
ADD CONSTRAINT FK_Inter_Pack_Num FOREIGN KEY (Inter_Pack_Num) REFERENCES Transport (Pack_Num);

ALTER TABLE International
ADD CONSTRAINT FK_Company_Name FOREIGN KEY (Company_Name) REFERENCES Transport_Partners (Company_Name);

ALTER TABLE Inttra
ADD CONSTRAINT FK_Intra_Pack_Num FOREIGN KEY (Intra_Pack_Num) REFERENCES International (Inter_Pack_Num);

ALTER TABLE Inttra
ADD CONSTRAINT FK_INTTRA_Company_Name FOREIGN KEY (Company_Name) REFERENCES Transport_Partners (Company_Name);

ALTER TABLE Vans
ADD CONSTRAINT FK_Vans_Pack_Num FOREIGN KEY (Vans_Pack_Num) REFERENCES Nacional (Nat_Pack_Num);

ALTER TABLE Trucks
ADD CONSTRAINT FK_Truck_Pack_Num FOREIGN KEY (Truck_Pack_Num) REFERENCES International (Inter_Pack_Num);

--Relations related tables----------------------------------------------------------------------------------------------------------------------------

ALTER TABLE WorUse
ADD CONSTRAINT FK_WU_UserID FOREIGN KEY (UserID) REFERENCES Users (UserID);

ALTER TABLE WorUse
ADD CONSTRAINT FK_WU_WorkZipCode FOREIGN KEY (WorkZipCode) REFERENCES WorkShops (WorkZipCode);

ALTER TABLE DelUse
ADD CONSTRAINT FK_DU_UserID FOREIGN KEY (UserID) REFERENCES Users (UserID);

ALTER TABLE DelUse
ADD CONSTRAINT FK_DU_Del_Emp_Num FOREIGN KEY (Del_Emp_Num) REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE DelWar
ADD CONSTRAINT FK_DW_Del_Emp_Num FOREIGN KEY (Del_Emp_Num) REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE DelWar
ADD CONSTRAINT FK_DW_WareZipCode FOREIGN KEY (WareZipCode) REFERENCES WareHouses (WareZipCode);

ALTER TABLE DelTra
ADD CONSTRAINT FK_DT_Del_Emp_Num FOREIGN KEY (Del_Emp_Num) REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE DelTra
ADD CONSTRAINT FK_DT_Pack_Num FOREIGN KEY (Pack_Num) REFERENCES Transport (Pack_Num);

--Triggers--------------------------------------------------------------------------------------------------------------------------------------------
--TRIGGER para calcula el coste de la ruta de reparto---------------------------------------------------------------------------------
GO
CREATE TRIGGER trg_CalcRtCst
ON Transport
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Transport
    SET Route_Cost = Transport.TRoute * 0.4
    FROM Transport
	INNER JOIN inserted i ON Transport.Pack_Num = i.Pack_Num;
END;

--TRIGGER para actualizar la fecha de registro de un usuario que ha modificado su username-------------------------------------------------------------
GO
CREATE TRIGGER trg_UpdateLogDate
ON Users
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Users
    SET Log_Date = GETDATE()
    FROM Users AS U
    INNER JOIN inserted AS I ON U.UserID = I.UserID;
END;
GO

--TRIGGER para calcular la edad de un empleado---------------------------------------------------------------------------------------------------------
GO
CREATE TRIGGER trg_CalculateAgeOnEmployees
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Employees
	SET Age = DATEDIFF(YEAR, Employees.Birth_Date, GETDATE())- 
              CASE 
                  WHEN MONTH(Employees.Birth_Date) > MONTH(GETDATE()) OR 
                       (MONTH(Employees.Birth_Date) = MONTH(GETDATE()) AND DAY(Employees.Birth_Date) > DAY(GETDATE())) 
                  THEN 1 
                  ELSE 0 
              END
    FROM Employees
    INNER JOIN inserted i ON Employees.Emp_Num = i.Emp_Num;
END;
GO
--TRIGGER para calcular el raiting promedio de un usuario---------------------------------------------------------------------------------------------
GO
CREATE OR ALTER TRIGGER trg_UpdateAvgRating
ON RaitingsTransaction
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar el Avg_Raitings de cada usuario basado en las calificaciones
    UPDATE u
    SET Avg_Raitings = (
        SELECT 
            CASE 
                WHEN COUNT(rt.Rating) = 1 THEN MAX(rt.Rating)  -- Si hay una calificación, tomarla directamente
                ELSE AVG(rt.Rating)  -- Si hay más de una, calcular el promedio
            END
        FROM RaitingsTransaction rt
        WHERE rt.UserR_Sell_ID = u.UserID
    )
    FROM Users u
    WHERE u.UserID IN (
        SELECT UserR_Sell_ID FROM inserted  -- Afectados por insert o update
        UNION
        SELECT UserR_Sell_ID FROM deleted   -- Afectados por delete
    );
END;
GO

--TRIGGER para calcular la antigüedad de un empleado en la empresa------------------------------------------------------------------------------------
GO
CREATE TRIGGER trg_CalculateDwellTime
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Evitar que el trigger se ejecute recursivamente
    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    -- Actualización de Dwell_Time solo si es diferente al valor actual
    UPDATE e
    SET Dwell_Time = DATEDIFF(YEAR, c.Sign_Date, GETDATE())
    FROM Employees e
    INNER JOIN Contracts c
        ON e.ContractID = c.ContractID
    WHERE e.Emp_Num IN (SELECT Emp_Num FROM inserted)
    AND e.Dwell_Time != DATEDIFF(YEAR, c.Sign_Date, GETDATE());
END;
GO

--TRIGGER para calcular la autonomía de un coche-------------------------------------------------------------------------------------------------------
GO
CREATE TRIGGER trg_update_autonomy
ON Automoviles
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update the autonomy directly based on the new fuel capacity and consumption
    UPDATE Automoviles
    SET Autonomy = (i.Fuel_Capacity / i.Consume) * 100
	FROM Automoviles a
	INNER JOIN INSERTED i
		on a.Auto_ZipCode = i.Auto_ZipCode
END;
GO

--TRIGGER para calcular el Inventory del WorWar en función del parking slot y number of pieces del warehouse-------------------------------------------
GO
CREATE OR ALTER TRIGGER trg_UpdateWorWarInventory
ON WorWar
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar el inventario en WorWar sumando park slots y piezas
    UPDATE w
    SET w.Inventory = wh.Inv_Park_Slots + wh.Inv_Pieces_Num
    FROM WorWar w
    INNER JOIN WareHouses wh
        ON w.WareZipCode = wh.WareZipCode
    WHERE w.WorWarID IN (SELECT WorWarID FROM inserted);
END;
GO

--Inserts----------------------------------------------------------------------------------------------------------------------------------------------
--Users related tables---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Users (UserID, Username, Email, Add_Zip_Code, Add_Country, Add_Street, Add_Number, Add_Floor_Num, Phone_Number, Log_Date, Conf_Password, Conf_Search_His, Conf_Acc_Type)
VALUES
('1234ABC', 'StarFox7', 'galaxyhunter23@maildomain.com', '12345', 'USA', 'Main St', 101, '001A', '+123456789012345', '2024-12-18', 'Ax7!pLm$3rKq', 'used SUVs under $20k', 0),
('1235DEF', 'PixelRush', 'pixelninja82@exampledomain.net', '54321', 'CAN', 'Second St', 202, '002B', '+123456789012346', '2024-12-17', 'ZkP9#xFgT2&h', 'best car audio systems', 0),
('1236GHI', 'DarkFlame', 'quantumfalcon@coolmail.org', '67890', 'MEX', 'Third St', 303, '003C', '+123456789012347', '2024-12-16', 'R3vM@8Lp!x7t', 'alloy wheels for sale', 1),
('1237JKL', 'SkyRaider', 'mysticvoyager77@webmailservice.com', '98765', 'FRA', 'Fourth St', 404, '004D', '+123456789012348', '2024-12-15', 'Qz6*T9pLk@Xy', 'top-rated car batteries', 0),
('1238MNO', 'GhostWolf', 'turbospeed99@fastmailprovider.co.uk', '11223', 'GER', 'Fifth St', 505, '005E', '+123456789012349', '2024-12-14', 'Mx8%2kRq!7Zp', 'buy a used Tesla Model 3', 1),
('1239PQR', 'TurboX99', 'novablazer@techhub.io', '33211', 'ESP', 'Sixth St', 606, '006F', '+123456789012350', '2024-12-13', 'Pq5!LxM9@K7T', 'discount car floor mats', 0),
('1240STU', 'NeoHawk', 'cyberwolf21@securemailservice.com', '44556', 'ITA', 'Seventh St', 707, '007G', '+123456789012351', '2024-12-12', 'T7@xRpK%2LzM', 'hybrid cars for 2024', 1),
('1241VWX', 'BlazeKing', 'shadowphoenixx@bestemail.net', '77889', 'BRA', 'Eighth St', 808, '008H', '+123456789012352', '2024-12-11', 'Lk3!Mx9&Zp2t', 'leather seat covers', 0),
('1242YZA', 'CyberNinja', 'hyperlynx45@mywebemailprovider.com', '99000', 'ARG', 'Ninth St', 909, '009I', '+123456789012353', '2024-12-10', 'R9@Lk!3pT6*Xq', 'cheap sports cars online', 1),
('1243BCD', 'SolarAce', 'solarwarrior77@quickmail.org', '12321', 'CHL', 'Tenth St', 100, '010J', '+123456789012354', '2024-12-09', 'Zx@7Tq!L9%Mp2', 'selling a 2020 Ford F-150', 0);

INSERT INTO UserPay (User_Pay_ID, UserP_Sell_ID, Payment)
VALUES
('1234ABC', '1235DEF', 15000.50), -- Usuario '1234ABC' paga a '1235DEF'
('1236GHI', '1237JKL', 2000.75), -- Usuario '1236GHI' paga a '1237JKL'
('1238MNO', '1239PQR', 1250.00), -- Usuario '1238MNO' paga a '1239PQR'
('1240STU', '1241VWX', 30000.25), -- Usuario '1240STU' paga a '1241VWX'
('1242YZA', '1243BCD', 500.00),  -- Usuario '1242YZA' paga a '1243BCD'
('1235DEF', '1234ABC', 750.50),  -- Usuario '1235DEF' paga a '1234ABC'
('1237JKL', '1236GHI', 1000.00), -- Usuario '1237JKL' paga a '1236GHI'
('1239PQR', '1238MNO', 4500.75), -- Usuario '1239PQR' paga a '1238MNO'
('1241VWX', '1240STU', 2750.00), -- Usuario '1241VWX' paga a '1240STU'
('1243BCD', '1242YZA', 60.50);  -- Usuario '1243BCD' paga a '1242YZA'

INSERT INTO UserTalk (UserT_Ask_ID, UserT_Inform_ID, Chat)
VALUES
('1234ABC', '1235DEF', 'Is the car manual or automatic?'),
('1236GHI', '1237JKL', 'Can I schedule a visit to see it?'),
('1238MNO', '1239PQR', 'Does it come with a maintenance history?'),
('1240STU', '1241VWX', 'Is the price negotiable?'),
('1242YZA', '1243BCD', 'How old are the tires?'),
('1235DEF', '1240STU', 'What’s the fuel efficiency?'),
('1237JKL', '1242YZA', 'Does it have a backup camera?'),
('1239PQR', '1243BCD', 'Are there any scratches or dents?'),
('1241VWX', '1234ABC', 'How many previous owners did it have?'),
('1243BCD', '1236GHI', 'Can you provide the VIN for a check?');

INSERT INTO UsersFav (UserFavID, Fav_Brand)
VALUES
('1234ABC', 'Toyota'),
('1235DEF', 'Ford'),
('1236GHI', 'Chevrolet'),
('1237JKL', 'Mercedes-Benz'),
('1238MNO', 'BMW'),
('1239PQR', 'Honda'),
('1240STU', 'Volkswagen'),
('1241VWX', 'Nissan'),
('1242YZA', 'Hyundai'),
('1243BCD', 'Audi');

INSERT INTO RaitingsTransaction (Rating, UserR_Pay_ID, UserR_Sell_ID)
VALUES
(4.5, '1234ABC', '1235DEF'),
(3.8, '1236GHI', '1237JKL'),
(4.9, '1238MNO', '1239PQR'),
(2.5, '1240STU', '1241VWX'),
(5.0, '1242YZA', '1243BCD'),
(3.7, '1235DEF', '1234ABC'),
(4.2, '1237JKL', '1236GHI'),
(4.8, '1239PQR', '1238MNO'),
(3.0, '1241VWX', '1240STU'),
(4.1, '1243BCD', '1242YZA');

--Contracts related tables----------------------------------------------------------------------------------------------------------------------------

INSERT INTO Contracts (ContractID, Sign_Date, Holiday_Date, Salary, Sch_Days, StartTime, EndTime)
VALUES
('C12345', '2022-03-05', NULL, 5500.00, 'Fri-Sat', '14:00', '22:00'),
('C12346', '2021-12-01', '2024-12-25', 5000.00, 'Mon-Wed-Fri', '09:00', '17:00'),
('C12347', '2020-11-15', NULL, 4500.00, 'Tue-Thu', '08:00', '16:00'),
('C12348', '2023-10-10', '2024-12-31', 5200.00, 'Mon-Fri', '09:00', '18:00'),
('C12349', '2021-09-01', NULL, 4700.00, 'Mon-Wed', '10:00', '19:00'),
('C12350', '2022-08-20', '2024-12-24', 4800.00, 'Tue-Fri', '08:30', '16:30'),
('C12351', '2021-07-15', NULL, 5300.00, 'Mon-Thu', '07:00', '15:00'),
('C12352', '2019-06-10', '2024-12-15', 4900.00, 'Mon-Wed-Fri', '11:00', '20:00'),
('C12353', '2018-05-01', NULL, 4600.00, 'Tue-Thu-Sat', '06:00', '14:00'),
('C12354', '2022-04-10', '2024-11-30', 5400.00, 'Mon-Wed', '12:00', '21:00');

--WorWar related tables-------------------------------------------------------------------------------------------------------------------------------

INSERT INTO WorkShops (WorkZipCode, Size, Phone_Number, Add_Country, Add_Street, Add_Number)
VALUES
('12345', 250, '+123456789012345', 'USA', 'Main St', 101),
('54321', 300, '+234567890123456', 'CAN', 'Second Ave', 202),
('67890', 400, '+345678901234567', 'MEX', 'Third Blvd', 303),
('98765', 150, '+456789012345678', 'FRA', 'Fourth Dr', 404),
('11223', 350, '+567890123456789', 'GER', 'Fifth Lane', 505),
('33211', 500, '+678901234567890', 'ESP', 'Sixth Rd', 606),
('44556', 275, '+789012345678901', 'ITA', 'Seventh Way', 707),
('77889', 320, '+890123456789012', 'BRA', 'Eighth Ct', 808),
('99000', 450, '+901234567890123', 'ARG', 'Ninth Plaza', 909),
('12321', 600, '+012345678901234', 'CHL', 'Tenth Sq', 100);

INSERT INTO WareHouses (WareZipCode, WorkZipCode, Inv_Park_Slots, Inv_Pieces_Num, Add_Country, Add_Street, Add_Number)
VALUES
('W12345', '12345', 50, 1000, 'USA', 'Main St Warehouse', 201),
('W54321', '54321', 30, 800, 'CAN', 'Second Ave Depot', 301),
('W67890', '67890', 70, 1200, 'MEX', 'Third Blvd Storage', 401),
('W98765', '98765', 40, 900, 'FRA', 'Fourth Dr Facility', 501),
('W11223', '11223', 60, 1100, 'GER', 'Fifth Lane Center', 601),
('W33211', '33211', 80, 1300, 'ESP', 'Sixth Rd Depot', 701),
('W44556', '44556', 25, 700, 'ITA', 'Seventh Way Storage', 801),
('W77889', '77889', 90, 1400, 'BRA', 'Eighth Ct Facility', 901),
('W99000', '99000', 0, 1500, 'ARG', 'Ninth Plaza Warehouse', 101),
('W12321', '12321', 45, 850, 'CHL', 'Tenth Sq Depot', 111);

INSERT INTO WorWar (WareZipCode, WorkZipCode)
VALUES
('W12345', '12345'), -- Almacén asociado al taller con código postal 12345
('W54321', '54321'), -- Almacén asociado al taller con código postal 54321
('W67890', '67890'), -- Almacén asociado al taller con código postal 67890
('W98765', '98765'), -- Almacén asociado al taller con código postal 98765
('W11223', '11223'), -- Almacén asociado al taller con código postal 11223
('W33211', '33211'), -- Almacén asociado al taller con código postal 33211
('W44556', '44556'), -- Almacén asociado al taller con código postal 44556
('W77889', '77889'), -- Almacén asociado al taller con código postal 77889
('W99000', '99000'), -- Almacén asociado al taller con código postal 99000
('W12321', '12321'); -- Almacén asociado al taller con código postal 12321

--Employees related tables----------------------------------------------------------------------------------------------------------------------------

INSERT INTO Employees (Emp_Passport, SSNumber, Email, Fname, Lname, Age, Add_Zip_Code, Add_Country, Add_Street, Add_Number, Add_Floor_Num, Birth_Date, Category, ContractID)
VALUES
('P12345678', 'SSN001234', 'john.doe@companymail.com', 'John', 'Doe', 28, '12345', 'USA', 'Main St', 101, '001A', '1996-04-15', 0, 'C12345'),
('P87654321', 'SSN002345', 'jane.smith@workplace.net', 'Jane', 'Smith', 35, '54321', 'CAN', 'Second Ave', 202, '002B', '1989-09-20', 1, 'C12346'),
('P11223344', 'SSN003456', 'mark.jones@corporate.org', 'Mark', 'Jones', 40, '67890', 'MEX', 'Third Blvd', 303, '003C', '1984-12-01', 0, 'C12347'),
('P44332211', 'SSN004567', 'lucy.brown@teammail.com', 'Lucy', 'Brown', 22, '98765', 'FRA', 'Fourth Dr', 404, '004D', '2002-07-10', 1, 'C12348'),
('P55667788', 'SSN005678', 'anna.green@businessemail.net', 'Anna', 'Green', 29, '11223', 'GER', 'Fifth Lane', 505, '005E', '1995-03-25', 0, 'C12349'),
('P66778899', 'SSN006789', 'paul.white@officenet.org', 'Paul', 'White', 31, '33211', 'ESP', 'Sixth Rd', 606, '006F', '1993-08-15', 1, 'C12350'),
('P77889900', 'SSN007890', 'emma.black@cooperativemail.com', 'Emma', 'Black', 27, '44556', 'ITA', 'Seventh Way', 707, '007G', '1997-01-30', 0, 'C12351'),
('P88990011', 'SSN008901', 'oliver.blue@enterprise.net', 'Oliver', 'Blue', 45, '77889', 'BRA', 'Eighth Ct', 808, '008H', '1979-11-11', 0, 'C12352'),
('P99001122', 'SSN009012', 'mia.red@professional.org', 'Mia', 'Red', 50, '99000', 'ARG', 'Ninth Plaza', 909, '009I', '1974-06-05', 1, 'C12353'),
('P00112233', 'SSN010123', 'noah.yellow@groupmail.com', 'Noah', 'Yellow', 33, '12321', 'CHL', 'Tenth Sq', 100, '010J', '1991-02-19', 0, 'C12354');
	
INSERT INTO Deliverie_Employees (Del_Emp_Num, Del_Route, Phone_Num, Driving_License)
VALUES
(1, 150.5, '+123456789012345', 'B1234DL'), -- Jane Smith
(3, 200.0, '+234567890123456', 'C5678DL'), -- Lucy Brown
(5, 120.7, '+345678901234567', 'D9012DL'), -- Paul White
(7, 180.3, '+456789012345678', 'E3456DL'); -- Mia Red

INSERT INTO Workshop_Employees (Work_Emp_Num, Acc_Rate, Specialization, WorWarID)
VALUES
(0, 98.5, 'Mechanic', 0), -- John Doe asociado a la primera relación en WorWar
(2, 95.0, 'Electrician', 1), -- Mark Jones asociado a la segunda relación en WorWar
(4, 92.3, 'Technician', 2), -- Anna Green asociado a la tercera relación en WorWar
(6, 97.8, 'Bodywork', 3), -- Emma Black asociado a la cuarta relación en WorWar
(8, 94.5, 'Painter', 4), -- Oliver Blue asociado a la quinta relación en WorWar
(9, 96.0, 'Supervisor', 5); -- Noah Yellow asociado a la sexta relación en WorWar

--ChatBot related tables------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ChatBot (Num_Query, CBVersion, Work_Emp_Num, UserID)
VALUES
(1, 'v3.7.0', 0, '1234ABC'), -- John Doe responde a una consulta del usuario 1234ABC
(2, 'v3.7.0', 2, '1235DEF'), -- Mark Jones responde a una consulta del usuario 1235DEF
(3, 'v3.7.0', 4, '1236GHI'), -- Anna Green responde a una consulta del usuario 1236GHI
(4, 'v3.7.0', 6, '1237JKL'), -- Emma Black responde a una consulta del usuario 1237JKL
(5, 'v3.7.0', 8, '1238MNO'), -- Oliver Blue responde a una consulta del usuario 1238MNO
(6, 'v3.7.0', 9, '1239PQR'), -- Noah Yellow responde a una consulta del usuario 1239PQR
(7, 'v3.7.0', 0, '1240STU'), -- John Doe responde a una consulta adicional del usuario 1240STU
(8, 'v3.7.0', 4, '1241VWX'), -- Anna Green responde a una consulta del usuario 1241VWX
(9, 'v3.7.0', 6, '1242YZA'), -- Emma Black responde a una consulta del usuario 1242YZA
(10, 'v3.7.0', 2, '1243BCD'); -- Mark Jones responde a una consulta del usuario 1243BCD

INSERT INTO TopicChatBot (Chat_Topic, Num_Query, UserID)
VALUES
('Car Availability', 1, '1234ABC'), -- Relacionado con la consulta 1 del usuario 1234ABC
('Payment Methods', 2, '1235DEF'), -- Relacionado con la consulta 2 del usuario 1235DEF
('Maintenance Tips', 3, '1236GHI'), -- Relacionado con la consulta 3 del usuario 1236GHI
('Workshop Locations', 4, '1237JKL'), -- Relacionado con la consulta 4 del usuario 1237JKL
('Warranty Information', 5, '1238MNO'), -- Relacionado con la consulta 5 del usuario 1238MNO
('Car Specs', 6, '1239PQR'), -- Relacionado con la consulta 6 del usuario 1239PQR
('Discount Offers', 7, '1240STU'), -- Relacionado con la consulta 7 del usuario 1240STU
('Vehicle History', 8, '1241VWX'), -- Relacionado con la consulta 8 del usuario 1241VWX
('Spare Parts', 9, '1242YZA'), -- Relacionado con la consulta 9 del usuario 1242YZA
('Service Scheduling', 10, '1243BCD'); -- Relacionado con la consulta 10 del usuario 1243BCD

--Transport related tables----------------------------------------------------------------------------------------------------------------------------

INSERT INTO Transport (Pack_Num, Localizer, TRoute, Route_Cost, Destination)
VALUES
('PKG123456', 'LOC1234567890123456789012345678901', 500.0, 250.00, 'Barcelona, España'), -- Trayecto nacional desde Madrid
('PKG123457', 'LOC2234567890123456789012345678902', 620.0, 310.00, 'Valencia, España'),  -- Trayecto nacional desde Madrid
('PKG123458', 'LOC3234567890123456789012345678903', 720.0, 360.00, 'Sevilla, España'),   -- Trayecto nacional desde Barcelona
('PKG123459', 'LOC4234567890123456789012345678904', 4000.0, 2000.00, 'París, Francia'),  -- Internacional cercano
('PKG123460', 'LOC5234567890123456789012345678905', 12000.0, 6000.00, 'Nueva York, EE.UU.'), -- Internacional largo
('PKG123461', 'LOC6234567890123456789012345678906', 13000.0, 6500.00, 'Buenos Aires, Argentina'), -- Internacional largo
('PKG123462', 'LOC7234567890123456789012345678907', 9500.0, 4750.00, 'Tokio, Japón'),    -- Internacional largo
('PKG123463', 'LOC8234567890123456789012345678908', 5000.0, 2500.00, 'El Cairo, Egipto'), -- Internacional medio
('PKG123464', 'LOC9234567890123456789012345678909', 3000.0, 1500.00, 'Londres, Reino Unido'), -- Internacional cercano
('PKG123465', 'LOC0234567890123456789012345678900', 2000.0, 1000.00, 'Lisboa, Portugal'); -- Internacional cercano

INSERT INTO Transport_Partners (Company_Name)
VALUES
('DHL'),
('FedEx'),
('UPS'),
('TNT'),
('XPO Logistics'),
('Schneider'),
('DB Schenker'),
('Ryder'),
('Kuehne + Nagel'),
('Maersk');

INSERT INTO Nacional (Nat_Pack_Num, Region_Covered, License_Plate, Cargo)
VALUES
('PKG123456', 'Comunidad de Madrid, Castilla-La Mancha, Cataluña', '1234ABC', 1), -- Barcelona, España
('PKG123457', 'Comunidad de Madrid, Castilla-La Mancha, Comunidad Valenciana', '5678DEF', 1), -- Valencia, España
('PKG123458', 'Cataluña, Aragón, Castilla-La Mancha, Andalucía', '9012GHI', 1); -- Sevilla, España

INSERT INTO International (Inter_Pack_Num, Inter_Licenses, Countries_Covered, Company_Name)
VALUES
('PKG123459', 'EU123456789', 'España, Francia', 'DHL'), -- París, Francia
('PKG123460', 'INT987654321', 'España, Estados Unidos', 'FedEx'), -- Nueva York, EE.UU.
('PKG123461', 'ARG456123789', 'España, Argentina', 'UPS'), -- Buenos Aires, Argentina
('PKG123462', 'JP789456123', 'España, Japón', 'TNT'), -- Tokio, Japón
('PKG123463', 'EG654789321', 'España, Egipto', 'XPO Logistics'), -- El Cairo, Egipto
('PKG123464', 'UK321654987', 'España, Reino Unido', 'Schneider'), -- Londres, Reino Unido
('PKG123465', 'PT987123654', 'España, Portugal', 'DB Schenker'); -- Lisboa, Portugal

INSERT INTO Vans (Vans_Pack_Num, Volume_Capacity)
VALUES
('PKG123456', 15000), -- Barcelona, España (15 m³ -> 15000 litros)
('PKG123457', 12500), -- Valencia, España (12.5 m³ -> 12500 litros)
('PKG123458', 18000); -- Sevilla, España (18 m³ -> 18000 litros)

INSERT INTO Trucks (Truck_Pack_Num, Weight_Capacity)
VALUES
('PKG123459', 15000), -- París, Francia
('PKG123460', 20000), -- Nueva York, EE.UU.
('PKG123461', 18000), -- Buenos Aires, Argentina
('PKG123462', 25000), -- Tokio, Japón
('PKG123463', 22000), -- El Cairo, Egipto
('PKG123464', 12000), -- Londres, Reino Unido
('PKG123465', 10000); -- Lisboa, Portugal

INSERT INTO Inttra (IntraID, Intra_Pack_Num, Company_Name)
VALUES
('INT1234', 'PKG123459', 'DHL'), -- París, Francia
('INT1235', 'PKG123460', 'FedEx'), -- Nueva York, EE.UU.
('INT1236', 'PKG123461', 'UPS'), -- Buenos Aires, Argentina
('INT1237', 'PKG123462', 'TNT'), -- Tokio, Japón
('INT1238', 'PKG123463', 'XPO Logistics'), -- El Cairo, Egipto
('INT1239', 'PKG123464', 'Schneider'), -- Londres, Reino Unido
('INT1240', 'PKG123465', 'DB Schenker'); -- Lisboa, Portugal

--Products related tables-----------------------------------------------------------------------------------------------------------------------------

INSERT INTO Products (
    ZipCode, Work_Emp_Num, Del_Emp_Num, UserID, WareZipCode, WorkZipCode, IntraID,
    Price, Brand, Model, PDescription, Discount, Manufact_Year, PLocation, Incident, PType, Pimage
)
VALUES
-- Producto tipo vehículo (PType = 1) con transporte internacional
(1000001, NULL, NULL, '1234ABC', NULL, NULL, 'INT1234', 25000.00, 'Toyota', 'Corolla', 
 'Vehículo en excelente estado, motor híbrido.', 5, '2020', geography::Point(40.4168, -3.7038, 4326), NULL, 1, NULL),

-- Producto tipo pieza (PType = 0) almacenado en un taller
(1000002, 0, NULL, '1235DEF', NULL, '12345', NULL, 150.00, 'Bosch', 'Filtro de aceite', 
 'Filtro compatible con motores diésel.', 10, '2022', NULL, 'Incidencia menor: rayón en el empaque.', 0, NULL),

-- Producto tipo pieza (PType = 0) almacenado en un almacén
(1000003, NULL, NULL, '1236GHI', 'W12345', NULL, NULL, 200.00, 'Michelin', 'Neumático 205/55R16', 
 'Neumático de alto rendimiento.', 15, '2021', NULL, NULL, 0, NULL),

-- Producto tipo vehículo (PType = 1) entregado por un empleado de taller
(1000004, 2, NULL, '1237JKL', NULL, NULL, NULL, 30000.00, 'Ford', 'Focus', 
 'Vehículo seminuevo con garantía.', 0, '2019', geography::Point(41.3851, 2.1734, 4326), 'Entrega prioritaria solicitada.', 1,
 NULL),

-- Producto tipo vehículo (PType = 1) con transporte internacional
(1000005, NULL, NULL, '1238MNO', NULL, NULL, 'INT1235', 45000.00, 'BMW', 'Serie 3', 
 'Sedán premium con interiores de lujo.', 10, '2023', geography::Point(37.7749, -122.4194, 4326), NULL, 1,
 NULL),

-- Producto tipo pieza (PType = 0) entregado por un empleado de reparto
(1000006, NULL, 1, '1239PQR', 'W54321', NULL, NULL, 75.00, 'Valeo', 'Alternador', 
 'Alternador de alta eficiencia.', 20, '2022', NULL, NULL, 0, NULL),

-- Producto tipo pieza (PType = 0) almacenado en un taller
(1000007, 4, NULL, '1240STU', NULL, '54321', NULL, 120.00, 'Castrol', 'Aceite 5W-30', 
 'Aceite sintético para motores de alto rendimiento.', 5, '2023', NULL, NULL, 0, NULL),

-- Producto tipo vehículo (PType = 1) con transporte internacional
(1000008, NULL, NULL, '1241VWX', NULL, NULL, 'INT1236', 38000.00, 'Mercedes-Benz', 'GLA', 
 'SUV compacto con tracción integral.', 8, '2023', geography::Point(48.8566, 2.3522, 4326), NULL, 1, NULL),

-- Producto tipo pieza (PType = 0) almacenado en un almacén
(1000009, NULL, NULL, '1242YZA', 'W67890', NULL, NULL, 180.00, 'NGK', 'Bujía Iridium', 
 'Bujía de alto rendimiento para motores gasolina.', 12, '2022', NULL, NULL, 0, NULL),

-- Producto tipo vehículo (PType = 1) entregado por un empleado de taller
(1000010, 6, NULL, '1243BCD', NULL, NULL, NULL, 32000.00, 'Honda', 'Civic', 
 'Vehículo eficiente con bajo consumo.', 0, '2020', geography::Point(35.6895, 139.6917, 4326), NULL, 1, 
 'https://www.motortrend.com/uploads/sites/5/2020/05/2020-Honda-Civic-Type-R-front-three-quarter-hero.jpg'),

-- Producto para transporte nacional (Barcelona)
(2000001, 0, NULL, '1234ABC', NULL, '12345', NULL, 15000.00, 'Peugeot', '208', 
 'Compacto urbano en perfecto estado.', 10, '2020', geography::Point(41.3851, 2.1734, 4326), NULL, 1, NULL),

-- Producto para transporte nacional (Valencia)
(2000002, 2, NULL, '1235DEF', NULL, '54321', NULL, 120.00, 'Bosch', 'Filtro de aire', 
 'Pieza nueva compatible con múltiples modelos.', 15, '2022', NULL, NULL, 0, 
 'https://th.bing.com/th/id/OIP.Z68mW_CfchlfwcZeISwWywAAAA?rs=1&pid=ImgDetMain'),

-- Producto para transporte nacional (Sevilla)
(2000003, 4, NULL, '1236GHI', NULL, '67890', NULL, 80.00, 'Michelin', 'Neumático 195/65R15', 
 'Neumático económico con excelente durabilidad.', 5, '2021', NULL, NULL, 0,
 'https://th.bing.com/th/id/OIP.-rEd0uP96_VTvPhKt37RjwHaHb?rs=1&pid=ImgDetMain'),

-- Producto para transporte internacional (París, Francia)
(2000004, NULL, NULL, '1237JKL', NULL, NULL, 'INT1234', 25000.00, 'Renault', 'Clio', 
 'Vehículo compacto listo para exportación.', 8, '2019', geography::Point(48.8566, 2.3522, 4326), NULL, 1, NULL),

-- Producto para transporte internacional (Nueva York, EE.UU.)
(2000005, NULL, NULL, '1238MNO', NULL, NULL, 'INT1235', 45000.00, 'Tesla', 'Model 3', 
 'Sedán eléctrico con autonomía extendida.', 5, '2023', geography::Point(40.7128, -74.0060, 4326), NULL, 1, NULL),

-- Producto para transporte internacional (Buenos Aires, Argentina)
(2000006, NULL, NULL, '1239PQR', NULL, NULL, 'INT1236', 60000.00, 'Toyota', 'Hilux', 
 'Camioneta robusta lista para exportación.', 0, '2022', geography::Point(-34.6037, -58.3816, 4326), NULL, 1, NULL),

-- Producto para transporte internacional (Tokio, Japón)
(2000007, NULL, NULL, '1240STU', NULL, NULL, 'INT1237', 30000.00, 'Audi', 'S5', 
 'Vehículo agresivo con gran agarre en carretera.', 10, '2010', geography::Point(35.6895, 139.6917, 4326), NULL, 1,
 'https://www.jonathanmotorcars.com/imagetag/156/3/l/Used-2010-Audi-S5-42-quattro-Prestige-1508171647.jpg'),

-- Producto para transporte internacional (El Cairo, Egipto)
(2000008, NULL, NULL, '1241VWX', NULL, NULL, 'INT1238', 15000.00, 'Hyundai', 'Accent', 
 'Sedán compacto a un excelente precio.', 12, '2020', geography::Point(30.0444, 31.2357, 4326), NULL, 1,
 NULL),

-- Producto para transporte internacional (Londres, Reino Unido)
(2000009, NULL, NULL, '1242YZA', NULL, NULL, 'INT1239', 30000.00, 'Ford', 'Focus', 
 'Vehículo seminuevo con garantía.', 0, '2023', geography::Point(51.5074, -0.1278, 4326), NULL, 1, NULL),

-- Producto para transporte internacional (Lisboa, Portugal)
(2000010, NULL, NULL, '1243BCD', NULL, NULL, 'INT1240', 18000.00, 'Volkswagen', 'Golf', 
 'Vehículo compacto y versátil.', 8, '2021', geography::Point(38.7169, -9.1390, 4326), NULL, 1, NULL);

INSERT INTO Automoviles (
    Auto_ZipCode, KM, License_Plate, Gears_Num, Fuel_Capacity, Engine, Consume, Horse_Power, Trucks_Pack_Num
)
VALUES
(2000004, 15000.0, 'FR134AB', 6, 50, 'Gasolina 1.2L Turbo', 6.5, 130, 'PKG123459'), -- Renault Clio (París, Francia)
(2000005, 2000.0, 'MDM1234', 10, 75, '3.5 EcoBoost', 14.7, 450, 'PKG123460'), -- Ford Raptor (Nueva York, EE.UU.)
(2000006, 50000.0, 'AG759LH', 5, 80, 'Diesel 2.8L', 8.0, 177, 'PKG123461'), -- Toyota Hilux (Buenos Aires, Argentina)
(2000007, 10000.0, '9518JDH', 7, 65, 'Gasolina 3.0L V6', 10.5, 260, 'PKG123462'), -- Audi S5 (León, España)
(2000008, 30000.0, 'EG7890MN', 5, 45, 'Gasolina 1.6L', 7.5, 123, 'PKG123463'), -- Hyundai Accent (El Cairo, Egipto)
(2000009, 8000.0, 'UK2345QR', 6, 55, 'Gasolina 1.5L EcoBoost', 6.8, 150, 'PKG123464'), -- Ford Focus (Londres, Reino Unido)
(2000010, 25000.0, 'PT6789ST', 5, 60, 'Gasolina 2.0L', 7.2, 155, 'PKG123465'); -- Volkswagen Golf (Lisboa, Portugal)

INSERT INTO Other (
    Oth_ZipCode, Size, Used_for, Vans_Pack_Num
)
VALUES
(1000002, '30x10x5', 'Filtro de aceite compatible con motores diésel.', 'PKG123456'), -- Bosch (Filtro de aceite)
(1000003, '70x70x25', 'Neumático diseñado para alto rendimiento en carreteras.', 'PKG123457'), -- Michelin (Neumático 205/55R16)
(1000006, '40x30x20', 'Alternador de alta eficiencia, ideal para vehículos modernos.', 'PKG123458'), -- Valeo (Alternador)
(1000007, '20x10x10', 'Aceite sintético para motores de alto rendimiento.', 'PKG123456'), -- Castrol (Aceite 5W-30)
(1000009, '15x15x5', 'Bujía de alto rendimiento para motores a gasolina.', 'PKG123457'), -- NGK (Bujía Iridium)
(2000002, '35x15x10', 'Filtro de aire compatible con múltiples modelos.', 'PKG123456'), -- Bosch (Filtro de aire)
(2000003, '70x70x25', 'Neumático económico con excelente durabilidad.', 'PKG123457'); -- Michelin (Neumático 195/65R15)

--Relations related tables----------------------------------------------------------------------------------------------------------------------------

INSERT INTO DelTra (Del_Emp_Num, Pack_Num)
VALUES
(1, 'PKG123456'), -- Jane Smith entrega el paquete a Barcelona, España
(1, 'PKG123457'), -- Jane Smith entrega el paquete a Valencia, España
(1, 'PKG123458'), -- Jane Smith entrega el paquete a Sevilla, España
(3, 'PKG123459'), -- Lucy Brown entrega el paquete a París, Francia
(3, 'PKG123460'), -- Lucy Brown entrega el paquete a Nueva York, EE.UU.
(5, 'PKG123461'), -- Paul White entrega el paquete a Buenos Aires, Argentina
(5, 'PKG123462'), -- Paul White entrega el paquete a Tokio, Japón
(7, 'PKG123463'), -- Mia Red entrega el paquete a El Cairo, Egipto
(7, 'PKG123464'), -- Mia Red entrega el paquete a Londres, Reino Unido
(7, 'PKG123465'); -- Mia Red entrega el paquete a Lisboa, Portugal

INSERT INTO DelWar (Del_Emp_Num, WareZipCode)
VALUES
(1, 'W12345'), -- Jane Smith asignada al almacén en Barcelona
(1, 'W54321'), -- Jane Smith asignada al almacén en Valencia
(3, 'W67890'), -- Lucy Brown asignada al almacén en Sevilla
(3, 'W98765'), -- Lucy Brown asignada al almacén en París
(5, 'W11223'), -- Paul White asignado al almacén en Nueva York
(5, 'W33211'), -- Paul White asignado al almacén en Buenos Aires
(7, 'W44556'), -- Mia Red asignada al almacén en Tokio
(7, 'W77889'), -- Mia Red asignada al almacén en El Cairo
(7, 'W99000'), -- Mia Red asignada al almacén en Londres
(7, 'W12321'); -- Mia Red asignada al almacén en Lisboa

INSERT INTO DelUse (UserID, Del_Emp_Num)
VALUES
('1234ABC', 1), -- Usuario asignado al empleado Jane Smith
('1235DEF', 1), -- Usuario asignado al empleado Jane Smith
('1236GHI', 1), -- Usuario asignado al empleado Jane Smith
('1237JKL', 3), -- Usuario asignado al empleado Lucy Brown
('1238MNO', 3), -- Usuario asignado al empleado Lucy Brown
('1239PQR', 5), -- Usuario asignado al empleado Paul White
('1240STU', 5), -- Usuario asignado al empleado Paul White
('1241VWX', 7), -- Usuario asignado al empleado Mia Red
('1242YZA', 7), -- Usuario asignado al empleado Mia Red
('1243BCD', 7); -- Usuario asignado al empleado Mia Red

INSERT INTO WorUse (UserID, WorkZipCode, WUDate)
VALUES
('1234ABC', '12345', '2024-01-15'), -- Usuario asignado al taller de Barcelona
('1235DEF', '54321', '2024-02-10'), -- Usuario asignado al taller de Valencia
('1236GHI', '67890', '2024-03-05'), -- Usuario asignado al taller de Sevilla
('1237JKL', '98765', '2024-01-20'), -- Usuario asignado al taller de París
('1238MNO', '11223', '2024-02-25'), -- Usuario asignado al taller de Nueva York
('1239PQR', '33211', '2024-01-30'), -- Usuario asignado al taller de Buenos Aires
('1240STU', '44556', '2024-03-15'), -- Usuario asignado al taller de Tokio
('1241VWX', '77889', '2024-02-18'), -- Usuario asignado al taller de El Cairo
('1242YZA', '99000', '2024-01-25'), -- Usuario asignado al taller de Londres
('1243BCD', '12321', '2024-03-12'); -- Usuario asignado al taller de Lisboa

SELECT * FROM RaitingsTransaction;
SELECT * FROM UserPay;
SELECT * FROM UserTalk;
SELECT * FROM UsersFav;
SELECT * FROM WorUse;
SELECT * FROM DelUse;
SELECT * FROM DelWar;
SELECT * FROM DelTra;
SELECT * FROM TopicChatBot;
SELECT * FROM Automoviles;
SELECT * FROM Other;
SELECT * FROM Products;
SELECT * FROM Inttra;
SELECT * FROM Vans;
SELECT * FROM Trucks;
SELECT * FROM Nacional;
SELECT * FROM International;
SELECT * FROM Transport;
SELECT * FROM Transport_Partners;
SELECT * FROM ChatBot;
SELECT * FROM Workshop_Employees;
SELECT * FROM Deliverie_Employees;
SELECT * FROM Employees;
SELECT * FROM WorWar;
SELECT * FROM WareHouses;
SELECT * FROM WorkShops;
SELECT * FROM Contracts;
SELECT * FROM Users;
