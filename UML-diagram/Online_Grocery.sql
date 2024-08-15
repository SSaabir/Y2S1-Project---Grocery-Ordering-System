CREATE TABLE Customer (
    cid char (10) ,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    dob DATE,
    userName VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
	Constraint Customer_PK PRIMARY KEY(cid)
);



CREATE TABLE Enquiry (
    eid char (10),
    subject VARCHAR(255) NOT NULL,
    comments TEXT,
    response TEXT,
	Constraint Enquiry_PK PRIMARY KEY (eid)
);

CREATE TABLE Payment (
    pid char (10),
    payMethod VARCHAR(50),
    payStatus VARCHAR(50),
	Constraint Payment_PK PRIMARY KEY (pid)
);


CREATE TABLE Manager(
mid char (10)
Constraint Manager_PK PRIMARY KEY (mid)
);


CREATE TABLE Admin(
 aid char (10),
 firstName VARCHAR(50) NOT NULL,
 lastName VARCHAR(50) NOT NULL,
 email VARCHAR(100) UNIQUE NOT NULL,
 address VARCHAR(255),
 city VARCHAR(50),
 dob DATE,
 userName VARCHAR(50) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 Constraint Admin_PK PRIMARY KEY (aid)
);


CREATE TABLE Customer_Enquiry (
    cid char (10),
    eid char (10),
    Constraint Customer_Enquiry_PK PRIMARY KEY (cid, eid),
    Constraint Customer_Fk1 FOREIGN KEY (cid) REFERENCES Customer(cid),
    Constraint Enquiry_Fk2 FOREIGN KEY (eid) REFERENCES Enquiry(eid)
);

CREATE TABLE Manager_Enquiry (
    mid char (10),
    eid char (10),
    Constraint Manager_Enquiry_PK PRIMARY KEY (mid, eid),
    Constraint Manager_Fk1 FOREIGN KEY (mid) REFERENCES Manager(mid),
    Constraint Enquiry_Fk FOREIGN KEY (eid) REFERENCES Enquiry(eid)
);

CREATE TABLE Customer_Admin (
    cid char (10),
    aid char (10),
    Constraint Customer_Admin_PK  PRIMARY KEY (cid, aid),
    Constraint Customer_Fk1 FOREIGN KEY (cid) REFERENCES Customer(cid),
    Constraint Admin_Fk2 FOREIGN KEY (aid) REFERENCES Admin(aid)
	);


	CREATE TABLE Payment_Manager (
    mid char (10),
    pid char (10),
    Constraint  Payment_Manager_PK PRIMARY KEY (mid, pid),
    Constraint Manager_Fk1 FOREIGN KEY (mid) REFERENCES Manager(mid),
    Constraint Payment_Fk1 FOREIGN KEY (pid) REFERENCES Payment(pid)
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
('E104','Delivery Delay', 'My order hasn’t arrived yet and it’s past the delivery date.', 'We are looking into the delay. Your order should arrive within the next 24 hours.'),
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

