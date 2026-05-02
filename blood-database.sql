CREATE DATABASE IF NOT EXISTS BloodBankManagementSystem;

USE BloodBankManagementSystem;

-- Table: BB_Manager
CREATE TABLE IF NOT EXISTS BB_Manager (
    M_id INT NOT NULL,
    mName VARCHAR(255) NOT NULL,
    m_phNo BIGINT,
    PRIMARY KEY (M_id)
);

-- Table: Recording_Staff
CREATE TABLE IF NOT EXISTS Recording_Staff (
    reco_ID INT NOT NULL,
    reco_Name VARCHAR(100) NOT NULL,
    reco_phNo BIGINT,
    PRIMARY KEY (reco_ID)
);

CREATE TABLE IF NOT EXISTS City (
    City_ID INT NOT NULL,
    City_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (City_ID)
);
-- Table: Blood_Donor
CREATE TABLE IF NOT EXISTS Blood_Donor (
    bd_ID INT NOT NULL,
    bd_name VARCHAR(100) NOT NULL,
    bd_age INT,
    bd_sex CHAR(1),
    bd_Bgroup VARCHAR(3),
    bd_reg_date DATE,
    reco_ID INT NOT NULL,
    City_ID INT NOT NULL,
    PRIMARY KEY (bd_ID),
    FOREIGN KEY (reco_ID) REFERENCES Recording_Staff(reco_ID),
    FOREIGN KEY (City_ID) REFERENCES City(City_ID)
);


-- Table: DiseaseFinder
CREATE TABLE IF NOT EXISTS DiseaseFinder (
    dfind_ID INT NOT NULL,
    dfind_name VARCHAR(100) NOT NULL,
    dfind_PhNo BIGINT,
    PRIMARY KEY (dfind_ID)
);

-- Table: BloodSpecimen
CREATE TABLE IF NOT EXISTS BloodSpecimen (
    specimen_number INT NOT NULL,
    b_group VARCHAR(10) NOT NULL,
    status INT,
    dfind_ID INT NOT NULL,
    M_id INT NOT NULL,
    PRIMARY KEY (specimen_number),
    FOREIGN KEY (dfind_ID) REFERENCES DiseaseFinder(dfind_ID),
    FOREIGN KEY (M_id) REFERENCES BB_Manager(M_id)
);








-- Table: Hospital_Info_1 (not included in the provided SQL)
CREATE TABLE IF NOT EXISTS Hospital_Info_1 (
    hosp_ID INT NOT NULL,
    hosp_name VARCHAR(100) NOT NULL,
    City_ID INT NOT NULL,
    M_id INT NOT NULL,
    PRIMARY KEY (hosp_ID),
    FOREIGN KEY (City_ID) REFERENCES City(City_ID),
    FOREIGN KEY (M_id) REFERENCES BB_Manager(M_id)
);

-- Table: Hospital_Info_2 (not included in the provided SQL)
CREATE TABLE IF NOT EXISTS Hospital_Info_2 (
    hosp_ID INT NOT NULL,
    hosp_name VARCHAR(100) NOT NULL,
    hosp_needed_Bgrp VARCHAR(10),
    hosp_needed_qnty INT,
    PRIMARY KEY (hosp_ID, hosp_needed_Bgrp),
    FOREIGN KEY (hosp_ID) REFERENCES Hospital_Info_1(hosp_ID)
);

-- Table: Recipient (not included in the provided SQL)
CREATE TABLE IF NOT EXISTS Recipient (
    reci_ID INT NOT NULL,
    reci_name VARCHAR(100) NOT NULL,
    reci_age INT,
    reci_Brgp VARCHAR(10),
    reci_Bqnty FLOAT,
    reco_ID INT NOT NULL,
    City_ID INT NOT NULL,
    M_id INT NOT NULL,
    reci_sex VARCHAR(1),
    reci_reg_date DATE,
    PRIMARY KEY (reci_ID),
    FOREIGN KEY (reco_ID) REFERENCES Recording_Staff(reco_ID),
    FOREIGN KEY (City_ID) REFERENCES City(City_ID),
    FOREIGN KEY (M_id) REFERENCES BB_Manager(M_id)
);

-- Insert into BB_Manager
INSERT INTO BB_Manager (M_id, mName, m_phNo)
VALUES 
    (1, 'Ali', 923001234567),
    (2, 'Ahmed', 923451234567),
    (3, 'Sana', 923221234567),
    (4, 'Fatima', 923331234567),
    (5, 'Kamran', 923441234567),
    (6, 'Saima', 923551234567),
    (7, 'Bilal', 923661234567),
    (8, 'Zara', 923771234567),
    (9, 'Imran', 923881234567),
    (10, 'Sarah', 923991234567),
    (11, 'Hassan', 923101234567),
    (12, 'Ayesha', 923111234567),
    (13, 'Usman', 923121234567),
    (14, 'Amina', 923131234567),
    (15, 'Omar', 923141234567);

-- Insert into Recording_Staff
INSERT INTO Recording_Staff (reco_ID, reco_Name, reco_phNo)
VALUES 
    (101, 'Khalid', 923001111111),
    (102, 'Nadia', 923451111111),
    (103, 'Junaid', 923221111111),
    (104, 'Ayesha', 923331111111),
    (105, 'Tahir', 923441111111),
    (106, 'Rabia', 923551111111),
    (107, 'Arif', 923661111111),
    (108, 'Fizza', 923771111111),
    (109, 'Saad', 923881111111),
    (110, 'Maryam', 923991111111),
    (111, 'Bilal', 923101111111),
    (112, 'Sara', 923111111111),
    (113, 'Ali', 923121111111),
    (114, 'Sadia', 923131111111),
    (115, 'Amir', 923141111111);

-- Insert into City
INSERT INTO City (City_ID, City_name)
VALUES 
    (1, 'Karachi'),
    (2, 'Lahore'),
    (3, 'Islamabad'),
    (4, 'Rawalpindi'),
    (5, 'Faisalabad'),
    (6, 'Multan'),
    (7, 'Hyderabad'),
    (8, 'Quetta'),
    (9, 'Peshawar'),
    (10, 'Sialkot'),
    (11, 'Gujranwala'),
    (12, 'Bahawalpur'),
    (13, 'Sargodha'),
    (14, 'Sukkur'),
    (15, 'Jhelum');

-- Insert into Blood_Donor
INSERT INTO Blood_Donor (bd_ID, bd_name, bd_age, bd_sex, bd_Bgroup, bd_reg_date, reco_ID, City_ID)
VALUES 
    (1001, 'Ali', 25, 'M', 'B+', '2022-01-15', 101, 1),
    (1002, 'Ahmed', 30, 'M', 'A+', '2022-02-20', 102, 2),
    (1003, 'Sana', 28, 'F', 'O+', '2022-03-10', 103, 3),
    (1004, 'Fatima', 33, 'F', 'AB+', '2022-04-05', 104, 4),
    (1005, 'Kamran', 27, 'M', 'B-', '2022-05-12', 105, 5),
    (1006, 'Saima', 32, 'F', 'A-', '2022-06-18', 106, 6),
    (1007, 'Bilal', 29, 'M', 'O-', '2022-07-22', 107, 7),
    (1008, 'Zara', 26, 'F', 'AB-', '2022-08-30', 108, 8),
    (1009, 'Imran', 31, 'M', 'B+', '2022-09-14', 109, 9),
    (1010, 'Sarah', 30, 'F', 'A+', '2022-10-19', 110, 10),
    (1011, 'Hassan', 29, 'M', 'O+', '2022-11-25', 111, 11),
    (1012, 'Ayesha', 27, 'F', 'AB+', '2022-12-03', 112, 12),
    (1013, 'Usman', 28, 'M', 'B-', '2023-01-08', 113, 13),
    (1014, 'Amina', 30, 'F', 'A-', '2023-02-14', 114, 14),
    (1015, 'Omar', 32, 'M', 'O-', '2023-03-20', 115, 15);

-- Insert into DiseaseFinder
INSERT INTO DiseaseFinder (dfind_ID, dfind_name, dfind_PhNo)
VALUES 
    (1, 'Dr. Ali', 923001234567),
    (2, 'Dr. Ahmed', 923451234567),
    (3, 'Dr. Sana', 923221234567),
    (4, 'Dr. Fatima', 923331234567),
    (5, 'Dr. Kamran', 923441234567),
    (6, 'Dr. Saima', 923551234567),
    (7, 'Dr. Bilal', 923661234567),
    (8, 'Dr. Zara', 923771234567),
    (9, 'Dr. Imran', 923881234567),
    (10, 'Dr. Sarah', 923991234567),
    (11, 'Dr. Hassan', 923101234567),
    (12, 'Dr. Ayesha', 923111234567),
    (13, 'Dr. Usman', 923121234567),
    (14, 'Dr. Amina', 923131234567),
    (15, 'Dr. Omar', 923141234567);

-- Insert into BloodSpecimen
INSERT INTO BloodSpecimen (specimen_number, b_group, status, dfind_ID, M_id)
VALUES 
    (1, 'B+', 1, 1, 1),
    (2, 'A+', 1, 2, 2),
    (3, 'O+', 0, 3, 3),
    (4, 'AB+', 1, 4, 4),
    (5, 'B-', 1, 5, 5),
    (6, 'A-', 0, 6, 6),
    (7, 'O-', 1, 7, 7),
    (8, 'AB-', 1, 8, 8),
    (9, 'B+', 1, 9, 9),
    (10, 'A+', 0, 10, 10),
    (11, 'O+', 1, 11, 11),
    (12, 'AB+', 1, 12, 12),
    (13, 'B-', 0, 13, 13),
    (14, 'A-', 1, 14, 14),
    (15, 'O-', 1, 15, 15);

-- Insert into Hospital_Info_1
INSERT INTO Hospital_Info_1 (hosp_ID, hosp_name, City_ID, M_id)
VALUES 
    (1, 'Aga Khan Hospital', 1, 1),
    (2, 'Shaukat Khanum Hospital', 2, 2),
    (3, 'Pakistan Institute of Medical Sciences (PIMS)', 3, 3),
    (4, 'Rawalpindi General Hospital', 4, 4),
    (5, 'Faisalabad Allied Hospital', 5, 5),
    (6, 'Nishtar Hospital Multan', 6, 6),
    (7, 'Liaquat University Hospital Hyderabad', 7, 7),
    (8, 'Civil Hospital Quetta', 8, 8),
    (9, 'Lady Reading Hospital Peshawar', 9, 9),
    (10, 'Allama Iqbal Memorial Hospital Sialkot', 10, 10),
    (11, 'District Headquarters Hospital Gujranwala', 11, 11),
    (12, 'Bahawal Victoria Hospital Bahawalpur', 12, 12),
    (13, 'DHQ Teaching Hospital Sargodha', 13, 13),
    (14, 'Ghulam Muhammad Mahar Medical College Hospital Sukkur', 14, 14),
    (15, 'District Headquarters Hospital Jhelum', 15, 15);

-- Insert into Hospital_Info_2
INSERT INTO Hospital_Info_2 (hosp_ID, hosp_name, hosp_needed_Bgrp, hosp_needed_qnty)
VALUES 
    (1, 'Aga Khan Hospital', 'A+', 20),
    (1, 'Aga Khan Hospital', 'AB+', 0),
    (1, 'Aga Khan Hospital', 'A-', 40),
    (1, 'Aga Khan Hospital', 'B-', 10),
    (1, 'Aga Khan Hospital', 'AB-', 20),
    (2, 'Shaukat Khanum Hospital', 'A+', 40),
    (2, 'Shaukat Khanum Hospital', 'AB+', 20),
    (2, 'Shaukat Khanum Hospital', 'A-', 10),
    (2, 'Shaukat Khanum Hospital', 'B-', 30),
    (2, 'Shaukat Khanum Hospital', 'B+', 0),
    (2, 'Shaukat Khanum Hospital', 'AB-', 10),
    (3, 'Pakistan Institute of Medical Sciences (PIMS)', 'A+', 0),
    (3, 'Pakistan Institute of Medical Sciences (PIMS)', 'AB+', 0),
    (3, 'Pakistan Institute of Medical Sciences (PIMS)', 'A-', 0),
    (3, 'Pakistan Institute of Medical Sciences (PIMS)', 'B-', 20);

-- Insert into Recipient
INSERT INTO Recipient (reci_ID, reci_name, reci_age, reci_Brgp, reci_Bqnty, reco_ID, City_ID, M_id, reci_sex, reci_reg_date)
VALUES 
    (10001, 'Maha', 25, 'B+', 1.5, 101, 1, 1, 'F', '2015-12-17'),
    (10002, 'Dawn', 60, 'A+', 1, 102, 1, 2, 'M', '2015-12-16'),
    (10003, 'Stave', 35, 'AB+', 0.5, 103, 1, 3, 'M', '2015-10-17'),
    (10004, 'Lion', 66, 'B+', 1, 104, 1, 4, 'M', '2016-11-17'),
    (10005, 'Janson', 53, 'B-', 1, 105, 1, 5, 'M', '2015-04-17'),
    (10006, 'Anum', 55, 'A+', 1, 106, 1, 6, 'F', '2015-05-17'),
    (10007, 'Adeel', 56, 'B+', 2, 107, 1, 7, 'M', '2014-03-17'),
    (10008, 'Arman', 57, 'AB+', 1, 108, 1, 8, 'M', '2013-02-17'),
    (10009, 'Anaya', 29, 'B-', 1, 109, 1, 9, 'F', '2017-02-17'),
    (10010, 'Daniyal', 30, 'A+', 1, 110, 1, 10, 'M', '2016-01-17'),
    (10011, 'Junaid', 33, 'B+', 2, 111, 1, 11, 'M', '2019-02-17'),
    (10012, 'Sana', 31, 'AB+', 1, 112, 1, 12, 'F', '2020-12-17'),
    (10013, 'Anusha', 28, 'B-', 1, 113, 1, 13, 'F', '2021-12-17'),
    (10014, 'Ali', 27, 'A+', 1, 114, 1, 14, 'M', '2018-12-17'),
    (10015, 'Hassan', 25, 'AB+', 2, 115, 1, 15, 'M', '2017-12-17');
