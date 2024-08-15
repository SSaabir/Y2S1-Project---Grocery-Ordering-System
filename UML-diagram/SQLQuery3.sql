create table Category 
(
CID char (10),
category_Name varchar (20),
constraint Category_PK PRIMARY KEY(CID),

);

create  table Product
(
Product_ID char (10),
CID char (10),
Product_name varchar (20),
Price int,
Quantity int ,
Discount varchar (20),
unit int,
Description varchar (150),
constraint Product_ID_PK PRIMARY KEY(Product_ID),
constraint Category_CID_FK FOREIGN KEY(CID) REFERENCES Category (CID ),


);
create table Employee
(
Employee_ID char(10),
Email varchar(50) CHECK (Email LIKE '%_@__%.__%'),
NIC char (15),
DOB date,
username varchar(20),
password varchar(20),
constraint Employee_PK PRIMARY KEY(Employee_ID)
);

create table Employee_phone
(
Employee_ID char(10),
phone int,
constraint Employee_FK FOREIGN KEY(Employee_ID ) REFERENCES Employee (Employee_ID),

);


create table Category_Employee
(
CID char (10),
Employee_ID char (10),
constraint Category_CID_FK1 FOREIGN KEY(CID) REFERENCES Category (CID),
constraint Employee_Employee_ID_FK2 FOREIGN KEY(Employee_ID) REFERENCES Employee (Employee_ID),

);

create table Product_Employee
(
Product_ID char (10),
Employee_ID char (10),
constraint Product_Product_ID_FK1 FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID),
constraint Product_Employee_Employee_ID_FK2 FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID),


);




insert into Category values('C100001','vegetables');
insert into Category values('C100002','meat');
insert into Category values('C100003','snacks');
insert into Category values('C100004','bakery');
insert into Category values('C100005','fruits');

insert into Product values('P100001','C100001','mango','100','1','5','','fresh fruits');
insert into Product values('P100002','C100002','orange','200','1','5','','fresh fruits');
insert into Product values('P100003','C100003','apple','200','1','5','','fresh fruits');
insert into Product values('P100004','C100004','fish','100','1','5','','fresh fruits');
insert into Product values('P100005','C100005','chicken','2000','1','10','','fresh meats');


insert into Category_Employee values('C100001','E001');
insert into Category_Employee values('C100002','E002');
insert into Category_Employee values('C100003','E003');
insert into Category_Employee values('C100004','E004');
insert into Category_Employee values('C100005','E005');


insert into Product_Employee values('P100001','E001');
insert into Product_Employee values('P100002','E002');
insert into Product_Employee values('P100003','E003');
insert into Product_Employee values('P100004','E004');
insert into Product_Employee values('P100005','E005');

insert into Employee values('E001','thanu1022@gmail.com','200129602687','2001.10.22','thanushan','thanu2001');
insert into Employee values('E002','ishas10001@gmail.com','20034552687','2001.10.22','ishas','ishas0320');
insert into Employee values('E003','saabir2010@gmail.com','200229602687','2001.10.22','saabir','saabir12');
insert into Employee values('E004','Aadher000@gmail.com','200329602687','2001.10.22','Aadhir','Aadhir000');
insert into Employee values('E005','sanujan2@gmail.com','200329602687','2001.10.22','shanujan','shanujan2002');

insert into Employee_phone values('E001','0743187254');
insert into Employee_phone values('E002','0703187254');
insert into Employee_phone values('E003','0753187254');
insert into Employee_phone values('E004','0723187254');
insert into Employee_phone values('E005','0763187254');









