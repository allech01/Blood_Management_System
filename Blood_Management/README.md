# BLOOD BANK MANAGEMENT SYSTEM

## Project Overview

This project focuses on the development of a Blood Bank Management System. Blood banks are crucial for collecting, storing, and providing blood to patients in need. The system aims to address the challenges of managing blood quality and tracking donors in existing manual systems, which are often time-consuming and inefficient. The 'Blood Bank Management System' automates the distribution of blood, making it easier to search for available blood and saving significant time compared to manual processes. It is designed to hoard, operate, recover, and analyze information related to administrative and inventory management within a blood bank, aiming for a manageable, time-effective, cost-effective, and flexible solution that requires less manpower. 

## Literature Work

The 'Blood Donation Management System' shares similarities with 'Organ Donation Management System' and 'Charity Management System' databases. 

* **Organ Donation Management System**: This database automates organ donation to patients in need. [cite_start]It is maintained by hospitals and tracks available organs, donors, and acceptors, making it functionally similar to a Blood Bank Management System. 
* **Charity Management System**: This system tracks monetary donations to various organizations. [cite_start]It involves donors (individuals donating money) and acceptors (organizations requesting or receiving money), operating similarly to the Blood Bank Management System in its core functionality. 

## ER Diagram and Relation Between Entities

An Entity-Relationship (ER) Diagram was created using Creately to visualize the entities and their relationships within the Blood Bank Management System. 

### Information of Entities

In total, there are eight entities: 

1.  **Blood_Donor**: Stores information about individuals who donate blood. Attributes include a unique donor ID (primary key), name, age, sex, blood group, phone number, and registration date. 
2.  **Recipient**: Stores information about individuals who receive blood from the blood bank. Attributes include a unique recipient ID (primary key), name, age, sex, needed blood group, needed blood quantity, phone number, and registration date. 
3.  **BB_Manager**: Represents the blood bank manager responsible for available blood samples and handling requests from recipients and hospitals.Attributes include a unique manager ID (primary key), name, and phone number. 
4.  **Recording_Staff**: Records blood donor and recipient information.Attributes include a unique staff ID (primary key), name, and phone number. 
5.  **BloodSpecimen**: Stores information about blood samples available in the blood bank.Attributes include a specimen number and blood group (together forming a primary key), and status (indicating contamination). 
6.  **DiseaseFinder**: Stores information about doctors who check blood for contamination.Attributes include a unique ID (primary key), name, and phone number. 
7.  **Hospital_Info**: Stores information about hospitals.Attributes include hospital ID and needed blood group (together forming a primary key), hospital name, and required blood quantity. 
8.  **City**: Stores information about cities where donors, recipients, and hospitals are located.Attributes include a unique city ID (primary key) and city name. 

### Relationship Between Entities

[cite_start]The relationships between entities are as follows: 

1.  **City and Hospital_Info**: One-to-many relationship ("in").A city can have many hospitals, but one hospital belongs to one city. 
2.  **City and Blood_Donor**: One-to-many relationship ("lives in").Many donors can live in a city, but one donor belongs to one city. 
3.  **City and Recipient**: One-to-many relationship ("lives in").Many recipients can live in a city, but one recipient belongs to one city. 
4.  **Recording_Staff and Donor**: One-to-many relationship ("registers").One recording staff can register many donors, but one donor registers with one recording officer. 
5.  **Recording_Staff and Recipient**: One-to-many relationship ("records").One recording staff can record many recipients, but one recipient is recorded by one recording officer. 
6.  **Hospital_Info and BB_Manager**: One-to-many relationship ("gives order to").One blood bank manager can handle requests from many hospitals, but one hospital places a request to one blood bank manager. 
7.  **BB_Manager and Blood Specimen**: One-to-many relationship ("deals with specimen").One blood bank manager can manage many blood specimens, and one specimen is managed by one manager. 
8.  **Recipient and BB_Manager**: One-to-many relationship ("requests to").One recipient can request blood from one manager, and one manager can handle requests from many recipients. 
9.  **Disease_finder and Blood Specimen**: One-to-many relationship ("checks").A disease finder can check many blood samples, and one blood sample is checked by one disease finder. 

## Relational Schemas

The following tables represent the relational schemas: 

### Donor Table

| Attribute Name | Description        | Type    |
| :------------- | :----------------- | :------ |
| bd\_id         | Blood Donor's Id   | int     |
| bd\_Name       | Blood Donor's Name | varchar |
| bd\_age        | Blood Donor's Age  | int     |
| bd\_sex        | Blood Donor's Sex  | char    |
| bd\_bgrp       | Blood Donor's blood group | varchar |
| bd\_regdate    | Registration Date of Donor | date    |
| reco\_id       | Id of Recording Staff | int     |
| city\_id       | City Id            | int     |

The `reco_id` (from Recording Staff) and `city_id` (from City) are used as foreign keys due to their one-to-many relationships with the Donor table. 

### Recipient Table

| Attributes Name | Description             | Type    |
| :-------------- | :---------------------- | :------ |
| reci\_id        | Recipient's Id          | int     |
| reci\_Name      | Recipient's Name        | varchar |
| reci\_age       | Recipient's age         | int     |
| reci\_sex       | Recipient's sex         | char    |
| reci\_bgrp      | Recipient's blood group | varchar |
| reci\_bqnty     | Recipient's blood quantity | int     |
| reci\_reg\_date | Recipient's registration date | date    |
| reco\_id        | Recording Staff's Id    | int     |
| city\_id        | City's unique Id        | int     |
| M\_id           | Blood Bank Manager's Id | int     |

The `reco_id` (from Recording Staff), `city_id` (from City), and `M_id` (from Blood Bank Manager) are used as foreign keys due to their one-to-many relationships with the Recipient table. 

### City Table

| Attributes Name | Description     | Type    |
| :-------------- | :-------------- | :------ |
| city\_id        | City's unique id | int     |
| city\_name      | City's name     | varchar |

The primary key of the City table (`city_id`) is used as a foreign key in the Recipient, Donor, and Hospital Info tables due to their one-to-many relationships. 

### Recording Staff Table

| Attributes Name | Description            | Type     |
| :-------------- | :--------------------- | :------- |
| reco\_id        | Recording Staff's id   | int      |
| reco\_name      | Recording Staff's Name | Varchar  |
| reco\_PhNo      | Recording Staff's Phone number | bigint |

The primary key of the Recording Staff table (`reco_id`) is used as a foreign key in the Blood Donor and Recipient tables due to their one-to-many relationships. 

### Blood Specimen Table

| Attributes Name | Description            | Type    |
| :-------------- | :--------------------- | :------ |
| specimen\_No    | Blood Sample's unique id | int     |
| b\_grp          | Blood Group            | varchar |
| status          | Whether blood is pure or not? | int     |
| M\_id           | Blood Bank Manager's id | int     |
| dfind\_id       | Disease Finder's unique id | int     |

The `dfind_id` (from Disease Finder) and `M_id` (from Blood Bank Manager) are used as foreign keys due to their one-to-many relationships with the Blood Specimen table. 

### Disease Finder Table

| Attributes Name | Description            | Type    |
| :-------------- | :--------------------- | :------ |
| dfind\_id       | Disease Finder's unique id | Int     |
| dfind\_name     | Disease Finder's name  | varchar |
| dfind\_phNo     | Disease Finder's phone number | bigint |

The primary key of the Disease Finder table (`dfind_id`) is used as a foreign key in the Blood Specimen table due to its one-to-many relationship. 

### Blood Bank Manager Table

| Attributes Name | Description           | Type    |
| :-------------- | :-------------------- | :------ |
| M\_id           | Blood Bank Manager's id | int     |
| m\_name         | Blood Bank Manager's name | varchar |
| m\_phNo         | Blood Bank Manager's phone no | bigint |

The primary key of the Blood Bank Manager table (`M_id`) is used as a foreign key in the Blood Specimen, Recipient, and Hospital Info tables due to their one-to-many relationships. 

### Hospital Info Table

| Attributes Name    | Description              | Type    |
| :----------------- | :----------------------- | :------ |
| hosp\_id           | Hospital’s unique id     | int     |
| hosp\_name         | Hospital’s name          | varchar |
| hosp\_needed\_Bgrp | Blood group needed by hospital | varchar |
| hosp\_needed\_qnty | Quantity of blood group needed | int     |
| city\_id           | City’s unique id         | int     |
| M\_id              | Blood Bank Manger’s id   | int     |

The `city_id` (from City) and `M_id` (from Blood Bank Manager) are used as foreign keys due to their one-to-many relationships with the Hospital Info table. 

## Normalization

Normalization rules are divided into First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF). 

* **First Normal Form (1NF)**: A table is in 1NF if it has only single (atomic) valued attributes/columns, values in a column are of the same domain, all columns have unique names, and the order of data storage does not matter. 
* **Second Normal Form (2NF)**: A table is in 2NF if it is in 1NF and does not have Partial Dependency. 
* **Third Normal Form (3NF)**: A table is in 3NF if it is in 2NF and does not have Transitive Dependency. 

The document details the normalization of each table, ensuring they meet 3NF where applicable. [cite_start]For instance, the `Hospital_Info` table was split into `Hospital_1` and `Hospital_2` to achieve 2NF. 

## SQL Implementation

The SQL implementation includes `CREATE TABLE` and `INSERT` statements for all entities: `BB_Manager`, `Blood_Donor`, `BloodSpecimen`, `City`, `DiseaseFinder`, `Hospital_Info_1`, `Hospital_Info_2`, `Recipient`, and `Recording_Staff`. 

## Sample SQL Queries

The document provides examples of SQL queries: 

1.  **Create a View of recipients and donors names having the same blood group registered on the same date.** 
    ```sql
    CREATE VIEW Blood_Recipient_SameBGrp AS
    SELECT Blood_Donor.bd_name, Recipient.reci_name, Recording_Staff.reco_Name
    FROM Recording_Staff
    INNER JOIN Blood_Donor ON Recording_Staff.reco_ID = Blood_Donor.reco_ID
    INNER JOIN Recipient ON Recording_Staff.reco_ID = Recipient.reco_ID
    WHERE Blood_Donor.bd_Bgroup = Recipient.reci_Brgp
    AND Blood_Donor.bd_reg_date = Recipient.reci_reg_date;
    ```
    Output: `SELECT * FROM Blood_Recipient_SameBGrp;` 

2.  **Show the blood specimen verified by disease finder which are pure (status=1).** 
    ```sql
    SELECT specimen_number, b_group
    FROM BloodSpecimen, DiseaseFinder
    WHERE BloodSpecimen.dfind_ID = DiseaseFinder.dfind_ID
    AND DiseaseFinder.dfind_name = 'Mark'
    AND status = 1;
    ```


3.  **Show the pure blood specimen handled by BB_Manager who also handles a recipient needing the same blood group along with the details of the BB_Manager and Recipient.** 
    ```sql
    SELECT BB_Manager.M_id, mName, Recipient.reci_name, Recipient.reci_Brgp, b_group
    FROM BB_Manager, Recipient, BloodSpecimen
    WHERE BB_Manager.M_id = Recipient.M_id
    AND BB_Manager.M_id = BloodSpecimen.M_id
    AND BloodSpecimen.b_group = Recipient.reci_Brgp
    AND BloodSpecimen.status = 1;
    ```


---
**Note:** The conclusion section was mentioned in the table of contents but its content was not included in the provided document.
