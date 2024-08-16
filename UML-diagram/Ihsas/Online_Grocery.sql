create table Customer (
    CusID int auto_increment not null unique,
    fName varchar(50) not null,
    lName varchar(50) not null,
    email varchar(100) unique not null,
    lane varchar(255) not null,
    city varchar(50) not null,
    dob date not null,
    imgUrl varchar(300) null,
    username varchar(50) not null unique,
    password varchar(255) not null,
	
    constraint Customer_PK primary key(CusID)
);



create table Enquiry (
    EnID int auto_increment not null unique,
    subject varchar(150) not null,
    comments text not null,
    response text not null,
    
    constraint Enquiry_PK primary key (EnID)
);

create table Payment (
    PID int auto_increment not null unique,
    payMethod varchar(50) not null,
    payStatus boolean not null,
    
    constraint Payment_PK primary key (PID)
);


CREATE TABLE Manager(
MID int auto_increment not null unique,

Constraint Manager_PK foreign key (MID) references Employee(EmID)
);


CREATE TABLE Admin (
    AID int auto_increment not null unique,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    dob DATE,
    imgUrl varchar(300) null,
    phone int(10) not null,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    
    CONSTRAINT Admin_PK PRIMARY KEY (AID)
);


CREATE TABLE Customer_Enquiry (
    CusID int not null,
    EnID int not null,
    
    Constraint Customer_Enquiry_PK PRIMARY KEY (CusID, EnID),
    Constraint Customer_Fk1 FOREIGN KEY (CusID) REFERENCES Customer(CusID),
    Constraint Enquiry_Fk2 FOREIGN KEY (EnID) REFERENCES Enquiry(EnID)
);

CREATE TABLE Manager_Enquiry (
    MID int not null,
    EnID int not null,
    
    Constraint Manager_Enquiry_PK PRIMARY KEY (MID, EnID),
    Constraint Manager_Fk1 FOREIGN KEY (MID) REFERENCES Manager(MID),
    Constraint Enquiry_Fk2 FOREIGN KEY (EnID) REFERENCES Enquiry(EnID)
);

CREATE TABLE Customer_Admin (
    CusID int not null,
    AID int not null,
    Constraint Customer_Admin_PK  PRIMARY KEY (CusID, AID),
    Constraint Customer_Fk1 FOREIGN KEY (CusID) REFERENCES Customer(CusID),
    Constraint Admin_Fk2 FOREIGN KEY (AID) REFERENCES Admin(AID)
	);


	CREATE TABLE Payment_Manager (
    MID int not null,
    PID int not null,
    
    Constraint  Payment_Manager_PK PRIMARY KEY (MID, PID),
    Constraint Manager_Fk1 FOREIGN KEY (MID) REFERENCES Manager(MID),
    Constraint Payment_Fk1 FOREIGN KEY (PID) REFERENCES Payment(PID)
);


create table Customer_Phone
(
CusID int not null,
phone int(10) not null,

constraint Customer_FK FOREIGN KEY(CusID) REFERENCES Customer(CusID)
);





INSERT INTO Customer (cid , firstName ,lastName ,email,address,city,dob,userName,password) 
VALUES 
 ('C1','mohamed','ihsas','mihsas@gmail.com','123mlane','panadura','2003.10.11','Ihsas','Ihsas2003'),
 ('C2','L','thanushan','thanu1022@gmail.com','4857street','dehiewala','2002.07.17','Thanushan','Thanushan2002'),
 ('C3','mohamed','saabir','saabir2010@gmail.com','325mrode','wellawatta','2003.06.02','Saabir','Saabir2003'),
 ('C4','mohamed','ahdeer','Aadher000@gmail.com','4589mainroad','colombo','2003.08.04','Ahdeer','Ahdeer2003');


INSERT INTO Enquiry (eid,subject, comments, response) 
VALUES 
('E101','Delivery Issue', 'I didnot get my product yet', 'Sorry for the dealay,wee will send in 24 hrs'),
('E102','Order Issue', 'I received the wrong item in my order.', 'We apologize for the mistake. A replacement item has been sent.'),
('E103','Payment Problem', 'My payment was declined, but the funds were deducted.', 'Please check with your bank. The amount should be refunded automatically.'),
('E104','Delivery Delay', 'My order hasn�t arrived yet and it�s past the delivery date.', 'We are looking into the delay. Your order should arrive within the next 24 hours.'),
('E105','Product Inquiry', 'Can you provide more details about the organic apples?', 'Our organic apples are sourced from local farms and are free of pesticides.');



INSERT INTO Customer_Enquiry (cid, eid) 
VALUES ('C1','E101'),
	   ('C2','E102'),
	   ('C3','E103'),
	   ('C1','E104'),
	   ('C3','E105');

INSERT INTO Manager_Enquiry (mid, eid) 
VALUES 
	   ('M1','E101'),
	   ('M2','E102'),
	   ('M1','E103'),
	   ('M3','E104'),
	   ('M2','E105');

INSERT INTO Customer_Admin (cid, aid)
VALUES
	   ('C1','A101'),
	   ('C2','A102'),
	   ('C3','A103'),
	   ('C1','A104'),
	   ('C3','A105');

INSERT INTO Payment (pid,payMethod, payStatus) 
VALUES
('P1','Credit Card', 'Completed'),
('P2','PayPal', 'Pending'),
('P3','Bank Transfer', 'Failed'),
('P4','Debit Card', 'Completed');


INSERT INTO Payment_manager (mid, pid) 
VALUES
       ('M1','P1'),
	   ('M2','P2'),
	   ('M1','P3'),
	   ('M3','P4'),
	   ('M2','P5');

