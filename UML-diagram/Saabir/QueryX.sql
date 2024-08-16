create table DeliveryPerson (
DPID int auto_increment not null unique,
vehicleNum char(10) not null,
drivingLicenseNum varchar(10) not null,
city varchar(10) not null,

constraint DeliveryPerson_PK primary key (DPID)
);

create table Feedback (
FID int auto_increment not null unique,
comments text not null,
rating int(5) null,
OID int not null,

constraint Feedback_PK primary key (FID),
constraint Order_FK foreign key (OID) references Sale (OID)	
);

create table Sale(
OID int auto_increment not null unique,
orderDate date not null,
totalAmount float not null,
orderStatus boolean null,
CusID int not null,
PID int not null,
DPID int not null,

constraint Sale_PK primary key (OID),
constraint Customer_FK1 foreign key (CusID) references Customer (CusID),
constraint Payment_FK2 foreign key (PID) references Payment (PID),
constraint DeliveryPerson_FK3 foreign key (DPID) references DeliveryPerson (DPID)
);

create table Product_Sale(
PrID int not null,
OID int not null,

constraint Product_Order_PK primary key (PrID, OID),
constraint Product_FK1 foreign key(PrID) references Product (PrID),
constraint Sale_PK2 foreign key (OID)references Sale(OID)
);

create table Manager_Feedback(
MID int not null,
FID int not null,

constraint Manager_Feedback_PK primary key (MID, FID),
constraint Manager_FK1 foreign key(MID) references Manager(MID),
constraint Feedback_PK2 foreign key (FID)references Feedback(FID)
);

create table Manager_Employee(
MID int not null,
EmID int not null,

constraint Manager_Feedback_PK primary key (MID, EmID),
constraint Manager_FK1 foreign key(MID) references Manager(MID),
constraint Employee_FK2 foreign key (EmID)references Employee(EmID)
);

create table Manager_Admin(
MID int not null,
AID int not null,

constraint Manager_Feedback_PK primary key (MID, FID),
constraint Manager_FK1 foreign key(MID) references Manager(MID),
constraint Admin_FK2 foreign key (AID)references Admin(AID)
);