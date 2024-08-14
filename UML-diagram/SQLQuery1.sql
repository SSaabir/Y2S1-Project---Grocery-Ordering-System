
create table category 
(

CID char (10),
category_Name varchar (20),
constraint Gategory_PK PRIMARY KEY(CID),

);

create  table Product
(
Product_ID char (10),
CID char (10),
Product_name varchar (20),
Price int,
Quantity int,
Discount int,
unit int,
Description varchar (150),
constraint Product_ID_PK PRIMARY KEY(Product_ID),
constraint category_CID_FK FOREIGN KEY(CID) REFERENCES category (CID ),


);
create table Employee
(
Employee_ID char(10),
Email varchar(50) CHECK (Email LIKE '%_@__%.__%'),
NIC int,
DOB date,
username varchar(20),
password varchar(20),
constraint Employee_PK PRIMARY KEY(Employee_ID)
);

create table Employee_phone
(
Employee_ID char(10),
phone int,
constraint Employee_PK FOREIGN KEY(Employee_ID ) REFERENCES Employee (Employee_ID),

);


create table Gategory_Employee
(
CID char (10),
Employee_ID char (10),
constraint category_CID_FK1 FOREIGN KEY(CID) REFERENCES category (CID),
constraint Employee_Employee_ID_FK2 FOREIGN KEY(Employee_ID) REFERENCES Employee (Employee_ID),

);

create table Product_Employee
(
Product_ID char (10),
Employee_ID char (10),
constraint Product_Product_ID_FK1 FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID),
constraint Employee_Employee_ID_FK2 FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID),


);


