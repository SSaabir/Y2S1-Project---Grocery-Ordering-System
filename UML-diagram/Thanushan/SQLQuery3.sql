create table Category 
(
CID int auto_increment unique not null,
category_Name varchar (100) unique not null,

constraint Category_PK PRIMARY KEY(CID)
);

create  table Product
(
PrID int auto_increment unique not null,
productName varchar (100) unique,
descript varchar (250) null,
price int not null,
unit varchar(5) not null,
quantity int not null,
imgUrl varchar(300) null,
discount int null,
CID int not null,

constraint Product_PK PRIMARY KEY(PrID),
constraint Category_FK FOREIGN KEY(CID) REFERENCES Category (CID)


);
create table Employee
(
EmID int auto_increment unique not null,
email varchar(50) CHECK (Email LIKE '%_@__%.__%'),
nic int unique not null,
dob date not null,
phone int(10) not null
username varchar(50) unique not null,
password varchar(255) not null,

constraint Employee_PK PRIMARY KEY(EmID)
);




create table Category_Employee
(
CID int not null,
EmID int not null,

CONSTRAINT Category_Employee PRIMARY KEY (CID, EmID),
constraint Category_FK1 FOREIGN KEY(CID) REFERENCES Category (CID),
constraint Employee_FK2 FOREIGN KEY(EmID) REFERENCES Employee (EmID)
);

create table Product_Employee
(
PrID int not null,
EmID int not null,

CONSTRAINT Category_Employee PRIMARY KEY (PrID, EmID),
constraint Product_FK1 FOREIGN KEY(PrD) REFERENCES Product(PrID),
constraint Employee_FK2 FOREIGN KEY(EmID) REFERENCES Employee(EmID)
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

    