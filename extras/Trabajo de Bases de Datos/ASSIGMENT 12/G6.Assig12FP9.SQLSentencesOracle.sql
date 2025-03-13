REM   Script: BSA_Database
REM   Final project

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY START WITH 0 INCREMENT BY 1 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport_01 UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport_01 UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    Size VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Size NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_country UNIQUE (Add_Country), 
    CONSTRAINT uq_street UNIQUE (Add_Street), 
    CONSTRAINT uq_number UNIQUE (Add_Number), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_country UNIQUE (Add_Country), 
    CONSTRAINT uq_street UNIQUE (Add_Street), 
    CONSTRAINT uq_number UNIQUE (Add_Number), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
	WorWarID INT PRIMARY KEY IDENTITY(0, 1), 
	WareZipCode VARCHAR(7) NOT NULL UNIQUE, 
	WorkZipCode VARCHAR(7) NOT NULL UNIQUE, 
	Inventory INT NOT NULL DEFAULT(0)--TRIGGER 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
	WorWarID INT PRIMARY KEY IDENTITY(0, 1), 
	WareZipCode VARCHAR(7) NOT NULL UNIQUE, 
	WorkZipCode VARCHAR(7) NOT NULL UNIQUE, 
	Inventory INT NOT NULL DEFAULT(0)--TRIGGER 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
	WorWarID INT PRIMARY KEY IDENTITY(0, 1), 
	WareZipCode VARCHAR(7) NOT NULL UNIQUE, 
	WorkZipCode VARCHAR(7) NOT NULL UNIQUE, 
	Inventory INT NOT NULL DEFAULT(0)--TRIGGER 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
	WorWarID INT PRIMARY KEY IDENTITY(0, 1), 
	WareZipCode VARCHAR(7) NOT NULL UNIQUE, 
	WorkZipCode VARCHAR(7) NOT NULL UNIQUE, 
	Inventory INT NOT NULL DEFAULT(0) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
	WorWarID INT PRIMARY KEY IDENTITY(0, 1), 
	WareZipCode VARCHAR(7) NOT NULL UNIQUE, 
	WorkZipCode VARCHAR(7) NOT NULL UNIQUE, 
	Inventory INT NOT NULL DEFAULT(0) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

CREATE TABLE DelTra ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Pack_Num VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deltra PRIMARY KEY (Del_Emp_Num, Pack_Num) 
);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

CREATE TABLE DelTra ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Pack_Num VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deltra PRIMARY KEY (Del_Emp_Num, Pack_Num) 
);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_user_pay_id FOREIGN KEY (User_Pay_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_userp_sell_id FOREIGN KEY (UserP_Sell_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_ask_id FOREIGN KEY (UserT_Ask_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_inform_id FOREIGN KEY (UserT_Inform_ID) 
REFERENCES Users (UserID);

ALTER TABLE UsersFav 
ADD CONSTRAINT fk_userfavid FOREIGN KEY (UserFavID) 
REFERENCES Users (UserID);

ALTER TABLE RaitingsTransaction 
ADD CONSTRAINT fk_userr_pay_sell_id FOREIGN KEY (UserR_Pay_ID, UserR_Sell_ID) 
REFERENCES UserPay (User_Pay_ID, UserP_Sell_ID);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

CREATE TABLE DelTra ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Pack_Num VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deltra PRIMARY KEY (Del_Emp_Num, Pack_Num) 
);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_user_pay_id FOREIGN KEY (User_Pay_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_userp_sell_id FOREIGN KEY (UserP_Sell_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_ask_id FOREIGN KEY (UserT_Ask_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_inform_id FOREIGN KEY (UserT_Inform_ID) 
REFERENCES Users (UserID);

ALTER TABLE UsersFav 
ADD CONSTRAINT fk_userfavid FOREIGN KEY (UserFavID) 
REFERENCES Users (UserID);

ALTER TABLE RaitingsTransaction 
ADD CONSTRAINT fk_userr_pay_sell_id FOREIGN KEY (UserR_Pay_ID, UserR_Sell_ID) 
REFERENCES UserPay (User_Pay_ID, UserP_Sell_ID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE TopicChatBot 
ADD CONSTRAINT fk_cbt_num_userid FOREIGN KEY (Num_Query, UserID) 
REFERENCES ChatBot (Num_Query, UserID);

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

CREATE TABLE DelTra ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Pack_Num VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deltra PRIMARY KEY (Del_Emp_Num, Pack_Num) 
);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_user_pay_id FOREIGN KEY (User_Pay_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_userp_sell_id FOREIGN KEY (UserP_Sell_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_ask_id FOREIGN KEY (UserT_Ask_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_inform_id FOREIGN KEY (UserT_Inform_ID) 
REFERENCES Users (UserID);

ALTER TABLE UsersFav 
ADD CONSTRAINT fk_userfavid FOREIGN KEY (UserFavID) 
REFERENCES Users (UserID);

ALTER TABLE RaitingsTransaction 
ADD CONSTRAINT fk_userr_pay_sell_id FOREIGN KEY (UserR_Pay_ID, UserR_Sell_ID) 
REFERENCES UserPay (User_Pay_ID, UserP_Sell_ID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE TopicChatBot 
ADD CONSTRAINT fk_cbt_num_userid FOREIGN KEY (Num_Query, UserID) 
REFERENCES ChatBot (Num_Query, UserID);

ALTER TABLE Employees 
ADD CONSTRAINT fk_contractid FOREIGN KEY (ContractID) 
REFERENCES Contracts (ContractID);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_worwarid FOREIGN KEY (WorWarID) 
REFERENCES WorWar (WorWarID);

ALTER TABLE Deliverie_Employees 
ADD CONSTRAINT fk_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Employees (Emp_Num);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

CREATE TABLE DelTra ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Pack_Num VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deltra PRIMARY KEY (Del_Emp_Num, Pack_Num) 
);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_user_pay_id FOREIGN KEY (User_Pay_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_userp_sell_id FOREIGN KEY (UserP_Sell_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_ask_id FOREIGN KEY (UserT_Ask_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_inform_id FOREIGN KEY (UserT_Inform_ID) 
REFERENCES Users (UserID);

ALTER TABLE UsersFav 
ADD CONSTRAINT fk_userfavid FOREIGN KEY (UserFavID) 
REFERENCES Users (UserID);

ALTER TABLE RaitingsTransaction 
ADD CONSTRAINT fk_userr_pay_sell_id FOREIGN KEY (UserR_Pay_ID, UserR_Sell_ID) 
REFERENCES UserPay (User_Pay_ID, UserP_Sell_ID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE TopicChatBot 
ADD CONSTRAINT fk_cbt_num_userid FOREIGN KEY (Num_Query, UserID) 
REFERENCES ChatBot (Num_Query, UserID);

ALTER TABLE Employees 
ADD CONSTRAINT fk_contractid FOREIGN KEY (ContractID) 
REFERENCES Contracts (ContractID);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_worwarid FOREIGN KEY (WorWarID) 
REFERENCES WorWar (WorWarID);

ALTER TABLE Deliverie_Employees 
ADD CONSTRAINT fk_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_warezipcode FOREIGN KEY (WareZipCode) 
REFERENCES WareHouses (WareZipCode);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_intraid FOREIGN KEY (IntraID) 
REFERENCES Inttra (IntraID);

ALTER TABLE Automoviles 
ADD CONSTRAINT fk_auto_zipcode FOREIGN KEY (Auto_ZipCode) 
REFERENCES Products (ZipCode);

ALTER TABLE Automoviles 
ADD CONSTRAINT fk_trucks_pack_num FOREIGN KEY (Trucks_Pack_Num) 
REFERENCES Trucks (Truck_Pack_Num);

ALTER TABLE Other 
ADD CONSTRAINT fk_oth_zipcode FOREIGN KEY (Oth_ZipCode) 
REFERENCES Products (ZipCode);

ALTER TABLE Other 
ADD CONSTRAINT fk_oth_vans_pack_num FOREIGN KEY (Vans_Pack_Num) 
REFERENCES Vans (Vans_Pack_Num);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

CREATE TABLE DelTra ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Pack_Num VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deltra PRIMARY KEY (Del_Emp_Num, Pack_Num) 
);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_user_pay_id FOREIGN KEY (User_Pay_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_userp_sell_id FOREIGN KEY (UserP_Sell_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_ask_id FOREIGN KEY (UserT_Ask_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_inform_id FOREIGN KEY (UserT_Inform_ID) 
REFERENCES Users (UserID);

ALTER TABLE UsersFav 
ADD CONSTRAINT fk_userfavid FOREIGN KEY (UserFavID) 
REFERENCES Users (UserID);

ALTER TABLE RaitingsTransaction 
ADD CONSTRAINT fk_userr_pay_sell_id FOREIGN KEY (UserR_Pay_ID, UserR_Sell_ID) 
REFERENCES UserPay (User_Pay_ID, UserP_Sell_ID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE TopicChatBot 
ADD CONSTRAINT fk_cbt_num_userid FOREIGN KEY (Num_Query, UserID) 
REFERENCES ChatBot (Num_Query, UserID);

ALTER TABLE Employees 
ADD CONSTRAINT fk_contractid FOREIGN KEY (ContractID) 
REFERENCES Contracts (ContractID);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_worwarid FOREIGN KEY (WorWarID) 
REFERENCES WorWar (WorWarID);

ALTER TABLE Deliverie_Employees 
ADD CONSTRAINT fk_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_warezipcode FOREIGN KEY (WareZipCode) 
REFERENCES WareHouses (WareZipCode);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_intraid FOREIGN KEY (IntraID) 
REFERENCES Inttra (IntraID);

ALTER TABLE Automoviles 
ADD CONSTRAINT fk_auto_zipcode FOREIGN KEY (Auto_ZipCode) 
REFERENCES Products (ZipCode);

ALTER TABLE Automoviles 
ADD CONSTRAINT fk_trucks_pack_num FOREIGN KEY (Trucks_Pack_Num) 
REFERENCES Trucks (Truck_Pack_Num);

ALTER TABLE Other 
ADD CONSTRAINT fk_oth_zipcode FOREIGN KEY (Oth_ZipCode) 
REFERENCES Products (ZipCode);

ALTER TABLE Other 
ADD CONSTRAINT fk_oth_vans_pack_num FOREIGN KEY (Vans_Pack_Num) 
REFERENCES Vans (Vans_Pack_Num);

ALTER TABLE WareHouses 
ADD CONSTRAINT fk_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE WorWar 
ADD CONSTRAINT fk_ww_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE WorWar 
ADD CONSTRAINT fk_ww_warezipcode FOREIGN KEY (WareZipCode) 
REFERENCES WareHouses (WareZipCode);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

CREATE TABLE DelTra ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Pack_Num VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deltra PRIMARY KEY (Del_Emp_Num, Pack_Num) 
);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_user_pay_id FOREIGN KEY (User_Pay_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_userp_sell_id FOREIGN KEY (UserP_Sell_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_ask_id FOREIGN KEY (UserT_Ask_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_inform_id FOREIGN KEY (UserT_Inform_ID) 
REFERENCES Users (UserID);

ALTER TABLE UsersFav 
ADD CONSTRAINT fk_userfavid FOREIGN KEY (UserFavID) 
REFERENCES Users (UserID);

ALTER TABLE RaitingsTransaction 
ADD CONSTRAINT fk_userr_pay_sell_id FOREIGN KEY (UserR_Pay_ID, UserR_Sell_ID) 
REFERENCES UserPay (User_Pay_ID, UserP_Sell_ID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE TopicChatBot 
ADD CONSTRAINT fk_cbt_num_userid FOREIGN KEY (Num_Query, UserID) 
REFERENCES ChatBot (Num_Query, UserID);

ALTER TABLE Employees 
ADD CONSTRAINT fk_contractid FOREIGN KEY (ContractID) 
REFERENCES Contracts (ContractID);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_worwarid FOREIGN KEY (WorWarID) 
REFERENCES WorWar (WorWarID);

ALTER TABLE Deliverie_Employees 
ADD CONSTRAINT fk_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_warezipcode FOREIGN KEY (WareZipCode) 
REFERENCES WareHouses (WareZipCode);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_intraid FOREIGN KEY (IntraID) 
REFERENCES Inttra (IntraID);

ALTER TABLE Automoviles 
ADD CONSTRAINT fk_auto_zipcode FOREIGN KEY (Auto_ZipCode) 
REFERENCES Products (ZipCode);

ALTER TABLE Automoviles 
ADD CONSTRAINT fk_trucks_pack_num FOREIGN KEY (Trucks_Pack_Num) 
REFERENCES Trucks (Truck_Pack_Num);

ALTER TABLE Other 
ADD CONSTRAINT fk_oth_zipcode FOREIGN KEY (Oth_ZipCode) 
REFERENCES Products (ZipCode);

ALTER TABLE Other 
ADD CONSTRAINT fk_oth_vans_pack_num FOREIGN KEY (Vans_Pack_Num) 
REFERENCES Vans (Vans_Pack_Num);

ALTER TABLE WareHouses 
ADD CONSTRAINT fk_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE WorWar 
ADD CONSTRAINT fk_ww_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE WorWar 
ADD CONSTRAINT fk_ww_warezipcode FOREIGN KEY (WareZipCode) 
REFERENCES WareHouses (WareZipCode);

ALTER TABLE Nacional 
ADD CONSTRAINT fk_nat_pack_num FOREIGN KEY (Nat_Pack_Num) 
REFERENCES Transport (Pack_Num);

ALTER TABLE International 
ADD CONSTRAINT fk_inter_pack_num FOREIGN KEY (Inter_Pack_Num) 
REFERENCES Transport (Pack_Num);

ALTER TABLE International 
ADD CONSTRAINT fk_company_name FOREIGN KEY (Company_Name) 
REFERENCES Transport_Partners (Company_Name);

ALTER TABLE Inttra 
ADD CONSTRAINT fk_intra_pack_num FOREIGN KEY (Intra_Pack_Num) 
REFERENCES International (Inter_Pack_Num);

ALTER TABLE Inttra 
ADD CONSTRAINT fk_inttra_company_name FOREIGN KEY (Company_Name) 
REFERENCES Transport_Partners (Company_Name);

ALTER TABLE Vans 
ADD CONSTRAINT fk_vans_pack_num FOREIGN KEY (Vans_Pack_Num) 
REFERENCES Nacional (Nat_Pack_Num);

ALTER TABLE Trucks 
ADD CONSTRAINT fk_truck_pack_num FOREIGN KEY (Truck_Pack_Num) 
REFERENCES International (Inter_Pack_Num);

BEGIN 
    FOR t IN ( 
        SELECT table_name  
        FROM user_tables  
        WHERE table_name IN ( 
            'RAITINGSTRANSACTION', 'USERPAY', 'USERTALK', 'USERSFAV', 'WORUSE',  
            'DELUSE', 'DELWAR', 'DELTRA', 'TOPICCHATBOT', 'AUTOMOVILES',  
            'OTHER', 'PRODUCTS', 'INTTRA', 'VANS', 'TRUCKS', 'NACIONAL',  
            'INTERNATIONAL', 'TRANSPORT', 'TRANSPORT_PARTNERS', 'CHATBOT',  
            'WORKSHOP_EMPLOYEES', 'DELIVERIE_EMPLOYEES', 'EMPLOYEES',  
            'WORWAR', 'WAREHOUSES', 'WORKSHOPS', 'CONTRACTS', 'USERS' 
        ) 
    ) LOOP 
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS'; 
    END LOOP; 
END; 
/

CREATE TABLE Users ( 
    UserID CHAR(7) CONSTRAINT pk_user PRIMARY KEY, 
    Username NVARCHAR2(15) CONSTRAINT uq_username UNIQUE NOT NULL, 
    Email NVARCHAR2(90) CONSTRAINT uq_email UNIQUE NOT NULL, 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Phone_Number CHAR(16), 
    Log_Date DATE DEFAULT SYSDATE, 
    Conf_Acc_Status NUMBER(1) DEFAULT 1 NOT NULL, 
    Conf_Password NVARCHAR2(15) NOT NULL, 
    Conf_Search_His NVARCHAR2(30), 
    Conf_Acc_Type NUMBER(1) DEFAULT 0 NOT NULL, 
    Avg_Raitings BINARY_FLOAT DEFAULT 0 
);

CREATE TABLE UserPay ( 
    User_Pay_ID CHAR(7) NOT NULL, 
    UserP_Sell_ID CHAR(7) NOT NULL, 
    Payment NUMBER(15,2) NOT NULL, 
    CONSTRAINT pk_userpay PRIMARY KEY (User_Pay_ID, UserP_Sell_ID) 
);

CREATE TABLE UserTalk ( 
    UserT_Ask_ID CHAR(7) NOT NULL, 
    UserT_Inform_ID CHAR(7) NOT NULL, 
    Chat CLOB NOT NULL, 
    CONSTRAINT pk_usertalk PRIMARY KEY (UserT_Ask_ID, UserT_Inform_ID) 
);

CREATE TABLE UsersFav ( 
    UserFavID CHAR(7) NOT NULL, 
    Fav_Brand VARCHAR2(30), 
    CONSTRAINT pk_usersfav PRIMARY KEY (UserFavID) 
);

CREATE TABLE RaitingsTransaction ( 
    Rating BINARY_FLOAT DEFAULT 0, 
    UserR_Pay_ID CHAR(7) NOT NULL, 
    UserR_Sell_ID CHAR(7) NOT NULL, 
    CONSTRAINT pk_raitings PRIMARY KEY (UserR_Pay_ID, UserR_Sell_ID) 
);

CREATE TABLE ChatBot ( 
    Num_Query NUMBER, 
    CBVersion NVARCHAR2(20), 
    Work_Emp_Num NUMBER NOT NULL, 
    UserID CHAR(7), 
    CONSTRAINT pk_chatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE TopicChatBot ( 
    Chat_Topic VARCHAR2(50), 
    Num_Query NUMBER NOT NULL, 
    UserID CHAR(7) NOT NULL, 
    CONSTRAINT pk_topicchatbot PRIMARY KEY (Num_Query, UserID) 
);

CREATE TABLE Employees ( 
    Emp_Num NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    Emp_Passport VARCHAR2(20) NOT NULL, 
    SSNumber VARCHAR2(20) NOT NULL, 
    Email NVARCHAR2(90) NOT NULL, 
    Fname NVARCHAR2(20) NOT NULL, 
    Lname NVARCHAR2(30) NOT NULL, 
    Age NUMBER CHECK (Age >= 16 AND Age <= 70), 
    Add_Zip_Code VARCHAR2(7), 
    Add_Country CHAR(3), 
    Add_Street NVARCHAR2(60), 
    Add_Number NUMBER, 
    Add_Floor_Num VARCHAR2(5), 
    Birth_Date DATE NOT NULL, 
    Dwell_Time NUMBER DEFAULT 0, 
    Category NUMBER(1) NOT NULL, 
    ContractID CHAR(6) NOT NULL, 
    CONSTRAINT pk_employees PRIMARY KEY (Emp_Num), 
    CONSTRAINT uq_emp_passport UNIQUE (Emp_Passport), 
    CONSTRAINT uq_ssnumber UNIQUE (SSNumber), 
    CONSTRAINT uq_emp_email UNIQUE (Email), 
    CONSTRAINT chk_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')), 
    CONSTRAINT chk_floor CHECK (REGEXP_LIKE(Add_Floor_Num, '^[0-9]{3}[A-Z]$')) 
);

CREATE TABLE Workshop_Employees ( 
    Work_Emp_Num NUMBER NOT NULL, 
    Acc_Rate BINARY_FLOAT DEFAULT 100 NOT NULL, 
    Specialization VARCHAR2(20) NOT NULL, 
    WorWarID NUMBER NOT NULL, 
    CONSTRAINT pk_workshop_employees PRIMARY KEY (Work_Emp_Num) 
);

CREATE TABLE Deliverie_Employees ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Del_Route BINARY_FLOAT, 
    Phone_Num CHAR(16), 
    Driving_License NVARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deliverie_employees PRIMARY KEY (Del_Emp_Num) 
);

CREATE TABLE Contracts ( 
    ContractID CHAR(6) NOT NULL, 
    Sign_Date DATE DEFAULT SYSDATE NOT NULL, 
    Holiday_Date DATE, 
    Salary NUMBER(15,2) NOT NULL, 
    Sch_Days NVARCHAR2(18) NOT NULL, 
    StartTime TIMESTAMP NOT NULL, 
    EndTime TIMESTAMP NOT NULL, 
    CONSTRAINT pk_contracts PRIMARY KEY (ContractID) 
);

CREATE TABLE Products ( 
    ZipCode NUMBER(19) NOT NULL, 
    Work_Emp_Num NUMBER, 
    Del_Emp_Num NUMBER, 
    UserID CHAR(7) NOT NULL, 
    WareZipCode VARCHAR2(7), 
    WorkZipCode VARCHAR2(7), 
    IntraID VARCHAR2(7), 
    Price NUMBER(15,2) NOT NULL, 
    Brand VARCHAR2(30) NOT NULL, 
    Model VARCHAR2(20) NOT NULL, 
    PDescription NVARCHAR2(600), 
    Discount NUMBER(3) DEFAULT 0, 
    Manufact_Year CHAR(4) NOT NULL, 
    PLocation SDO_GEOMETRY, 
    Incident NVARCHAR2(200), 
    PType NUMBER(1) NOT NULL, 
    Pimage VARCHAR2(300), 
    CONSTRAINT pk_products PRIMARY KEY (ZipCode) 
);

CREATE TABLE Automoviles ( 
    Auto_ZipCode NUMBER(19) NOT NULL, 
    KM BINARY_FLOAT DEFAULT 0 NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Gears_Num NUMBER(3) NOT NULL, 
    Fuel_Capacity NUMBER NOT NULL, 
    Engine VARCHAR2(50) NOT NULL, 
    Consume BINARY_FLOAT NOT NULL, 
    Horse_Power NUMBER NOT NULL, 
    Autonomy NUMBER, 
    Trucks_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_automoviles PRIMARY KEY (Auto_ZipCode) 
);

CREATE TABLE Other ( 
    Oth_ZipCode NUMBER(19) NOT NULL, 
    OSize VARCHAR2(11) NOT NULL, 
    Used_for NVARCHAR2(600) NOT NULL, 
    Vans_Pack_Num VARCHAR2(20), 
    CONSTRAINT pk_other PRIMARY KEY (Oth_ZipCode) 
);

CREATE TABLE WorkShops ( 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WSSize NUMBER NOT NULL, 
    Phone_Number CHAR(16) NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_workshops PRIMARY KEY (WorkZipCode), 
    CONSTRAINT uq_ws_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ws_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ws_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ws_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WareHouses ( 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inv_Park_Slots NUMBER DEFAULT 0 NOT NULL, 
    Inv_Pieces_Num NUMBER DEFAULT 0 NOT NULL, 
    Add_Country CHAR(3) NOT NULL, 
    Add_Street NVARCHAR2(60) NOT NULL, 
    Add_Number NUMBER NOT NULL, 
    CONSTRAINT pk_warehouses PRIMARY KEY (WareZipCode), 
    CONSTRAINT uq_ware_country UNIQUE (Add_Country), 
    CONSTRAINT uq_ware_street UNIQUE (Add_Street), 
    CONSTRAINT uq_ware_number UNIQUE (Add_Number), 
    CONSTRAINT chk_ware_country CHECK (REGEXP_LIKE(Add_Country, '^[A-Z]{3}$')) 
);

CREATE TABLE WorWar ( 
    WorWarID NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 0 START WITH 0 INCREMENT BY 1, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    Inventory NUMBER DEFAULT 0 NOT NULL, 
    CONSTRAINT pk_worwar PRIMARY KEY (WorWarID), 
    CONSTRAINT uq_ware_zip UNIQUE (WareZipCode), 
    CONSTRAINT uq_work_zip UNIQUE (WorkZipCode) 
);

CREATE TABLE Transport ( 
    Pack_Num VARCHAR2(20) NOT NULL, 
    Localizer VARCHAR2(34) NOT NULL, 
    TRoute BINARY_FLOAT NOT NULL, 
    Route_Cost BINARY_FLOAT, 
    Destination VARCHAR2(50) NOT NULL, 
    CONSTRAINT pk_transport PRIMARY KEY (Pack_Num), 
    CONSTRAINT uq_localizer UNIQUE (Localizer) 
);

CREATE TABLE Nacional ( 
    Nat_Pack_Num VARCHAR2(20) NOT NULL, 
    Region_Covered VARCHAR2(100) NOT NULL, 
    License_Plate NVARCHAR2(12) NOT NULL, 
    Cargo NUMBER(1) NOT NULL, 
    CONSTRAINT pk_nacional PRIMARY KEY (Nat_Pack_Num) 
);

CREATE TABLE International ( 
    Inter_Pack_Num VARCHAR2(20) NOT NULL, 
    Inter_Licenses NVARCHAR2(20), 
    Countries_Covered VARCHAR2(50) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_international PRIMARY KEY (Inter_Pack_Num) 
);

CREATE TABLE Inttra ( 
    IntraID VARCHAR2(7) NOT NULL, 
    Intra_Pack_Num VARCHAR2(20) NOT NULL, 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_inttra PRIMARY KEY (IntraID), 
    CONSTRAINT uq_intra_pack_num UNIQUE (Intra_Pack_Num), 
    CONSTRAINT uq_company_name UNIQUE (Company_Name), 
    CONSTRAINT chk_intraid_format CHECK (REGEXP_LIKE(IntraID, '^[A-Z]{3}[0-9]{4}$')) 
);

CREATE TABLE Transport_Partners ( 
    Company_Name VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_transport_partners PRIMARY KEY (Company_Name) 
);

CREATE TABLE Vans ( 
    Vans_Pack_Num VARCHAR2(20) NOT NULL, 
    Volume_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_vans PRIMARY KEY (Vans_Pack_Num) 
);

CREATE TABLE Trucks ( 
    Truck_Pack_Num VARCHAR2(20) NOT NULL, 
    Weight_Capacity BINARY_FLOAT NOT NULL, 
    CONSTRAINT pk_trucks PRIMARY KEY (Truck_Pack_Num) 
);

CREATE TABLE WorUse ( 
    UserID CHAR(7) NOT NULL, 
    WorkZipCode VARCHAR2(7) NOT NULL, 
    WUDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_woruse PRIMARY KEY (UserID, WorkZipCode) 
);

CREATE TABLE DelUse ( 
    UserID CHAR(7) NOT NULL, 
    Del_Emp_Num NUMBER NOT NULL, 
    DuDate DATE DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT pk_deluse PRIMARY KEY (UserID, Del_Emp_Num) 
);

CREATE TABLE DelWar ( 
    Del_Emp_Num NUMBER NOT NULL, 
    WareZipCode VARCHAR2(7) NOT NULL, 
    CONSTRAINT pk_delwar PRIMARY KEY (Del_Emp_Num, WareZipCode) 
);

CREATE TABLE DelTra ( 
    Del_Emp_Num NUMBER NOT NULL, 
    Pack_Num VARCHAR2(20) NOT NULL, 
    CONSTRAINT pk_deltra PRIMARY KEY (Del_Emp_Num, Pack_Num) 
);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_user_pay_id FOREIGN KEY (User_Pay_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserPay 
ADD CONSTRAINT fk_userp_sell_id FOREIGN KEY (UserP_Sell_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_ask_id FOREIGN KEY (UserT_Ask_ID) 
REFERENCES Users (UserID);

ALTER TABLE UserTalk 
ADD CONSTRAINT fk_usert_inform_id FOREIGN KEY (UserT_Inform_ID) 
REFERENCES Users (UserID);

ALTER TABLE UsersFav 
ADD CONSTRAINT fk_userfavid FOREIGN KEY (UserFavID) 
REFERENCES Users (UserID);

ALTER TABLE RaitingsTransaction 
ADD CONSTRAINT fk_userr_pay_sell_id FOREIGN KEY (UserR_Pay_ID, UserR_Sell_ID) 
REFERENCES UserPay (User_Pay_ID, UserP_Sell_ID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE ChatBot 
ADD CONSTRAINT fk_cb_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE TopicChatBot 
ADD CONSTRAINT fk_cbt_num_userid FOREIGN KEY (Num_Query, UserID) 
REFERENCES ChatBot (Num_Query, UserID);

ALTER TABLE Employees 
ADD CONSTRAINT fk_contractid FOREIGN KEY (ContractID) 
REFERENCES Contracts (ContractID);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Workshop_Employees 
ADD CONSTRAINT fk_worwarid FOREIGN KEY (WorWarID) 
REFERENCES WorWar (WorWarID);

ALTER TABLE Deliverie_Employees 
ADD CONSTRAINT fk_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Employees (Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_work_emp_num FOREIGN KEY (Work_Emp_Num) 
REFERENCES Workshop_Employees (Work_Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_warezipcode FOREIGN KEY (WareZipCode) 
REFERENCES WareHouses (WareZipCode);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE Products 
ADD CONSTRAINT fk_prod_intraid FOREIGN KEY (IntraID) 
REFERENCES Inttra (IntraID);

ALTER TABLE Automoviles 
ADD CONSTRAINT fk_auto_zipcode FOREIGN KEY (Auto_ZipCode) 
REFERENCES Products (ZipCode);

ALTER TABLE Automoviles 
ADD CONSTRAINT fk_trucks_pack_num FOREIGN KEY (Trucks_Pack_Num) 
REFERENCES Trucks (Truck_Pack_Num);

ALTER TABLE Other 
ADD CONSTRAINT fk_oth_zipcode FOREIGN KEY (Oth_ZipCode) 
REFERENCES Products (ZipCode);

ALTER TABLE Other 
ADD CONSTRAINT fk_oth_vans_pack_num FOREIGN KEY (Vans_Pack_Num) 
REFERENCES Vans (Vans_Pack_Num);

ALTER TABLE WareHouses 
ADD CONSTRAINT fk_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE WorWar 
ADD CONSTRAINT fk_ww_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE WorWar 
ADD CONSTRAINT fk_ww_warezipcode FOREIGN KEY (WareZipCode) 
REFERENCES WareHouses (WareZipCode);

ALTER TABLE Nacional 
ADD CONSTRAINT fk_nat_pack_num FOREIGN KEY (Nat_Pack_Num) 
REFERENCES Transport (Pack_Num);

ALTER TABLE International 
ADD CONSTRAINT fk_inter_pack_num FOREIGN KEY (Inter_Pack_Num) 
REFERENCES Transport (Pack_Num);

ALTER TABLE International 
ADD CONSTRAINT fk_company_name FOREIGN KEY (Company_Name) 
REFERENCES Transport_Partners (Company_Name);

ALTER TABLE Inttra 
ADD CONSTRAINT fk_intra_pack_num FOREIGN KEY (Intra_Pack_Num) 
REFERENCES International (Inter_Pack_Num);

ALTER TABLE Inttra 
ADD CONSTRAINT fk_inttra_company_name FOREIGN KEY (Company_Name) 
REFERENCES Transport_Partners (Company_Name);

ALTER TABLE Vans 
ADD CONSTRAINT fk_vans_pack_num FOREIGN KEY (Vans_Pack_Num) 
REFERENCES Nacional (Nat_Pack_Num);

ALTER TABLE Trucks 
ADD CONSTRAINT fk_truck_pack_num FOREIGN KEY (Truck_Pack_Num) 
REFERENCES International (Inter_Pack_Num);

ALTER TABLE WorUse 
ADD CONSTRAINT fk_wu_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE WorUse 
ADD CONSTRAINT fk_wu_workzipcode FOREIGN KEY (WorkZipCode) 
REFERENCES WorkShops (WorkZipCode);

ALTER TABLE DelUse 
ADD CONSTRAINT fk_du_userid FOREIGN KEY (UserID) 
REFERENCES Users (UserID);

ALTER TABLE DelUse 
ADD CONSTRAINT fk_du_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE DelWar 
ADD CONSTRAINT fk_dw_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE DelWar 
ADD CONSTRAINT fk_dw_warezipcode FOREIGN KEY (WareZipCode) 
REFERENCES WareHouses (WareZipCode);

ALTER TABLE DelTra 
ADD CONSTRAINT fk_dt_del_emp_num FOREIGN KEY (Del_Emp_Num) 
REFERENCES Deliverie_Employees (Del_Emp_Num);

ALTER TABLE DelTra 
ADD CONSTRAINT fk_dt_pack_num FOREIGN KEY (Pack_Num) 
REFERENCES Transport (Pack_Num);

