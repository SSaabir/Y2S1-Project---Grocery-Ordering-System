CREATE TABLE Admin (
    aid char(10),
    name VARCHAR(100),
    email VARCHAR(100),
    mobile VARCHAR(15),
    nic VARCHAR(20),
    dob DATE,
    userName VARCHAR(50),
    password VARCHAR(100)
	Constraint Admin_PK PRIMARY KEY(aid)
);



CREATE TABLE Admin_Customer (
    aid char (10),
    cid char (10),
    Constraint Admin_Customer_PK PRIMARY KEY (aid, cid),
    Constraint Admin_FK1 FOREIGN KEY (aid) REFERENCES Admin(aid),
    Constraint Customer_FK2 FOREIGN KEY (cid) REFERENCES Customer(cid)
);

CREATE TABLE Admin_Manager (
    aid char (10),
    mid char (10),
    Constraint Admin_Manager_PK PRIMARY KEY (aid, mid),
    Constraint Admin_FK1 FOREIGN KEY (aid) REFERENCES Admin(aid),
    Constraint Manager_FK2 FOREIGN KEY (mid) REFERENCES Manager(mid)
);


CREATE TABLE Feedback (
    fid char (10),
    comments TEXT,
    rating INT,
    status VARCHAR(20),
    oid INT,
	constraint Feedback_PK PRIMARY KEY (fid),
    Constraint Orders_FK FOREIGN KEY (oid) REFERENCES Orders(oid)

);

CREATE TABLE Feedback_Manager (
    fid char (10),
    mid char (10),
    constraint Feedback_Manager_PK PRIMARY KEY (fid, mid),
    constraint Feedback_FK1 FOREIGN KEY (fid) REFERENCES Feedback(fid),
    constraint Manager_FK FOREIGN KEY (mid) REFERENCES Manager(mid)
);

CREATE TABLE Orders (
    oid char (10),
    ordeCode VARCHAR(50),
    orderStatus VARCHAR(50),
    totalAmount DECIMAL(10, 2),
    createDate DATE,
    cid char (10),
    did char (10),
	Constraint Orders_PK PRIMARY KEY (oid),
    Constraint Customer_FK1 FOREIGN KEY (cid) REFERENCES Customer(cid),
    Constraint Customer_FK2 FOREIGN KEY (did) REFERENCES Delivery_Person(did)
);


CREATE TABLE Product_Order (
    oid char (10),
    pid char (10),
    Constraint Product_Order PRIMARY KEY (oid, pid),
    Constraint Orders_FK1  FOREIGN KEY (oid) REFERENCES Orders(oid),
    Constraint Product_FK2 FOREIGN KEY (pid) REFERENCES Product(pid)
);



INSERT INTO Admin (aid, name, email, mobile, nic, dob, username, password)
VALUES 
    ('A1', 'hafeel', 'hafeeel1@gmail.com', '1234567890', 'NIC12345', '1990-01-01', 'adminUser', 'password123');
    ('A2', 'danooshan', 'danooshan2@gmail.com', '1234567890', 'NIC12345', '1990-01-01', 'adminUser', 'password123');
    ('A3', 'saabir', 'saabir3@gmail.com', '1234567890', 'NIC12345', '1990-01-01', 'adminUser', 'password123');
    ('A4', 'ahdheer', 'ahdheer4.com', '1234567890', 'NIC12345', '1990-01-01', 'adminUser', 'password123');
    ('A5', 'ihsas', 'ihsas5@gmail.com', '1234567890', 'NIC12345', '1990-01-01', 'adminUser', 'password123');



INSERT INTO Orders (oid, order_code, order_status, total_amount, create_date, cid, did)
VALUES ('O1', 'ORD001', 'Pending', 100.50, '2024-08-15', 1, 1);
       ('O2', 'ORD002', 'Pending', 110.50, '2024-02-15', 2, 2);
       ('O3', 'ORD003', 'Pending', 120.50, '2024-03-15', 3, 3);
       ('O4', 'ORD004', 'Pending', 130.50, '2024-12-15', 4, 4);
       ('O5', 'ORD005', 'Pending', 140.50, '2024-01-15', 5, 5);

INSERT INTO Feedback (FID, comments, rating, status, OID)
VALUES (1, 'Great product!', 5, 'Approved', 1);
       (2, 'good product!', 4, 'Approved', 2);
       (3, 'not bad product!', 2, 'Approved', 3);
       (4, 'bad product!', 1, 'Approved', 4);
       (5, 'expired product!', 0, 'Approved', 5); 


INSERT INTO Admin_Customer (aid, cid)
VALUES ('A1', 'C1');
       ('A2', 'C2');
       ('A3', 'C3');
       ('A4', 'C4');
       ('A5', 'C5'); 

INSERT INTO Admin_Manager (aid, cid)
VALUES ('A1', 'M1');
       ('A2', 'M2');
       ('A3', 'M3');
       ('A4', 'M4');
       ('A5', 'M5'); 

INSERT INTO Feedback_Manager (fid, mid)
VALUES ('F1', 'M1');
       ('F2', 'M2');
       ('F3', 'M3');
       ('F4', 'M4');
       ('F5', 'M5'); 

INSERT INTO Product_Order (oid, pid)
VALUES ('O1', 'P1');
       ('O2', 'P2');
       ('O3', 'P3');
       ('O4', 'P4');
       ('O5', 'P5'); 