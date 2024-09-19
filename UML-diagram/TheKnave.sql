-- Create Tables

CREATE TABLE Category (
    CID INT AUTO_INCREMENT UNIQUE NOT NULL,
    category_Name VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT Category_PK PRIMARY KEY (CID)
);

CREATE TABLE Product (
    PrID INT AUTO_INCREMENT UNIQUE NOT NULL,
    productName VARCHAR(100) UNIQUE,
    descript VARCHAR(250) NULL,
    price INT NOT NULL,
    unit VARCHAR(5) NOT NULL,
    quantity INT NOT NULL,
    imgUrl VARCHAR(300) NULL,
    discount INT NULL,
    CID INT NOT NULL,
    CONSTRAINT Product_PK PRIMARY KEY (PrID),
    CONSTRAINT Category_FK1 FOREIGN KEY (CID)
        REFERENCES Category (CID)
);

CREATE TABLE Employee (
    EmID INT AUTO_INCREMENT UNIQUE NOT NULL,
    email VARCHAR(50) CHECK (email LIKE '%_@__%.__%'),
    nic VARCHAR(15) UNIQUE NOT NULL,
    dob DATE NOT NULL,
    imgUrl VARCHAR(300) NULL,
    phone VARCHAR(15) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT Employee_PK PRIMARY KEY (EmID)
);

CREATE TABLE Category_Employee (
    CID INT NOT NULL,
    EmID INT NOT NULL,
    CONSTRAINT Category_Employee_PK PRIMARY KEY (CID, EmID),
    CONSTRAINT Category_FK2 FOREIGN KEY (CID)
        REFERENCES Category (CID),
    CONSTRAINT Employee_FK1 FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
);

CREATE TABLE Product_Employee (
    PrID INT NOT NULL,
    EmID INT NOT NULL,
    CONSTRAINT Product_Employee_PK PRIMARY KEY (PrID, EmID),
    CONSTRAINT Product_FK2 FOREIGN KEY (PrID)
        REFERENCES Product (PrID),
    CONSTRAINT Employee_FK2 FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
);

CREATE TABLE DeliveryPerson (
    DPID INT AUTO_INCREMENT NOT NULL UNIQUE,
    vehicleNum CHAR(10) NOT NULL,
    drivingLicenseNum VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    CONSTRAINT DeliveryPerson_PK PRIMARY KEY (DPID)
);

CREATE TABLE Customer (
    CusID INT AUTO_INCREMENT NOT NULL UNIQUE,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    lane VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    imgUrl VARCHAR(300) NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT Customer_PK PRIMARY KEY (CusID)
);

CREATE TABLE Payment (
    PID INT AUTO_INCREMENT NOT NULL UNIQUE,
    payMethod VARCHAR(50) NOT NULL,
    payStatus BOOLEAN NOT NULL,
    CONSTRAINT Payment_PK PRIMARY KEY (PID)
);

CREATE TABLE Sale (
    OID INT AUTO_INCREMENT NOT NULL UNIQUE,
    orderDate DATE NOT NULL,
    totalAmount FLOAT NOT NULL,
    orderStatus BOOLEAN NULL,
    CusID INT NOT NULL,
    PID INT NOT NULL,
    DPID INT NOT NULL,
    CONSTRAINT Sale_PK PRIMARY KEY (OID),
    CONSTRAINT Customer_FK1 FOREIGN KEY (CusID)
        REFERENCES Customer (CusID),
    CONSTRAINT Payment_FK1 FOREIGN KEY (PID)
        REFERENCES Payment (PID),
    CONSTRAINT DeliveryPerson_FK1 FOREIGN KEY (DPID)
        REFERENCES DeliveryPerson (DPID)
);

CREATE TABLE Product_Sale (
    PrID INT NOT NULL,
    OID INT NOT NULL,
    quantity INT NOT NULL,
    netPrice FLOAT NOT NULL,
    discount INT NULL,
    CONSTRAINT Product_Sale_PK PRIMARY KEY (PrID, OID),
    CONSTRAINT Product_FK1 FOREIGN KEY (PrID)
        REFERENCES Product (PrID),
    CONSTRAINT Sale_FK1 FOREIGN KEY (OID)
        REFERENCES Sale (OID)
);

CREATE TABLE Feedback (
    FID INT AUTO_INCREMENT NOT NULL UNIQUE,
    comments TEXT NOT NULL,
    rating INT NULL,
    OID INT NOT NULL,
    CONSTRAINT Feedback_PK PRIMARY KEY (FID),
    CONSTRAINT Sale_FK2 FOREIGN KEY (OID)
        REFERENCES Sale (OID)
);

CREATE TABLE Manager (
    MID INT AUTO_INCREMENT NOT NULL UNIQUE,
    EmID INT NOT NULL,
    CONSTRAINT Manager_PK PRIMARY KEY (MID),
    CONSTRAINT Manager_FK1 FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
);

CREATE TABLE Manager_Feedback (
    MID INT NOT NULL,
    FID INT NOT NULL,
    CONSTRAINT Manager_Feedback_PK PRIMARY KEY (MID, FID),
    CONSTRAINT Manager_FK2 FOREIGN KEY (MID)
        REFERENCES Manager (MID),
    CONSTRAINT Feedback_FK1 FOREIGN KEY (FID)
        REFERENCES Feedback (FID)
);

CREATE TABLE Manager_Employee (
    MID INT NOT NULL,
    EmID INT NOT NULL,
    CONSTRAINT Manager_Employee_PK PRIMARY KEY (MID, EmID),
    CONSTRAINT Manager_FK3 FOREIGN KEY (MID)
        REFERENCES Manager (MID),
    CONSTRAINT Employee_FK3 FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
);

CREATE TABLE Admin (
    AID INT AUTO_INCREMENT NOT NULL UNIQUE,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255) NULL,
    city VARCHAR(50) NULL,
    dob DATE NULL,
    imgUrl VARCHAR(300) NULL,
    phone VARCHAR(15) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT Admin_PK PRIMARY KEY (AID)
);

CREATE TABLE Manager_Admin (
    MID INT NOT NULL,
    AID INT NOT NULL,
    CONSTRAINT Manager_Admin_PK PRIMARY KEY (MID, AID),
    CONSTRAINT Manager_FK4 FOREIGN KEY (MID)
        REFERENCES Manager (MID),
    CONSTRAINT Admin_FK1 FOREIGN KEY (AID)
        REFERENCES Admin (AID)
);

CREATE TABLE Enquiry (
    EnID INT AUTO_INCREMENT NOT NULL UNIQUE,
    subject VARCHAR(150) NOT NULL,
    comments TEXT NOT NULL,
    response TEXT NULL,
    CONSTRAINT Enquiry_PK PRIMARY KEY (EnID)
);

CREATE TABLE Customer_Enquiry (
    CusID INT NOT NULL,
    EnID INT NOT NULL,
    CONSTRAINT Customer_Enquiry_PK PRIMARY KEY (CusID, EnID),
    CONSTRAINT Customer_FK2 FOREIGN KEY (CusID)
        REFERENCES Customer (CusID),
    CONSTRAINT Enquiry_FK1 FOREIGN KEY (EnID)
        REFERENCES Enquiry (EnID)
);

CREATE TABLE Manager_Enquiry (
    MID INT NOT NULL,
    EnID INT NOT NULL,
    CONSTRAINT Manager_Enquiry_PK PRIMARY KEY (MID, EnID),
    CONSTRAINT Manager_FK5 FOREIGN KEY (MID)
        REFERENCES Manager (MID),
    CONSTRAINT Enquiry_FK2 FOREIGN KEY (EnID)
        REFERENCES Enquiry (EnID)
);

CREATE TABLE Customer_Admin (
    CusID INT NOT NULL,
    AID INT NOT NULL,
    CONSTRAINT Customer_Admin_PK PRIMARY KEY (CusID, AID),
    CONSTRAINT Customer_FK3 FOREIGN KEY (CusID)
        REFERENCES Customer (CusID),
    CONSTRAINT Admin_FK2 FOREIGN KEY (AID)
        REFERENCES Admin (AID)
);

CREATE TABLE Payment_Manager (
    MID INT NOT NULL,
    PID INT NOT NULL,
    CONSTRAINT Payment_Manager_PK PRIMARY KEY (MID, PID),
    CONSTRAINT Manager_FK6 FOREIGN KEY (MID)
        REFERENCES Manager (MID),
    CONSTRAINT Payment_FK2 FOREIGN KEY (PID)
        REFERENCES Payment (PID)
);

CREATE TABLE Customer_Phone (
    CusID INT NOT NULL,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT Customer_Phone_PK PRIMARY KEY (CusID, phone),
    CONSTRAINT Customer_FK4 FOREIGN KEY (CusID)
        REFERENCES Customer (CusID)
);

-- Insert Records

INSERT INTO Category (category_Name) VALUES 
('Vegetables'),
('Meat'),
('Snacks'),
('Bakery'),
('Fruits');

INSERT INTO Product (productName, descript, price, unit, quantity, imgUrl, discount, CID) VALUES 
('Mango', 'Fresh tropical mangoes', 100, 'kg', 50, NULL, 5, 5),
('Chicken', 'Fresh chicken meat', 2000, 'kg', 20, NULL, 10, 2),
('Fish', 'Fresh fish', 1000, 'kg', 30, NULL, 5, 2),
('Bread', 'Freshly baked bread', 50, 'pcs', 100, NULL, 2, 4),
('Apple', 'Juicy red apples', 200, 'kg', 60, NULL, 5, 5);

INSERT INTO Employee (email, nic, dob, imgUrl, phone, username, password) VALUES 
('thanu1022@gmail.com', '2001296268', '2001-10-22', NULL, '0743187254', 'thanushan', 'thanu2001'),
('ishas10001@gmail.com', '2003452687', '2001-10-22', NULL, '0703187254', 'ishas', 'ishas0320'),
('saabir2010@gmail.com', '2002960687', '2001-10-22', NULL, '0753187254', 'saabir', 'saabir12'),
('Aadher000@gmail.com', '2039602687', '2001-10-22', NULL, '0723187254', 'Aadhir', 'Aadhir000'),
('sanujan2@gmail.com', '2003602687', '2001-10-22', NULL, '0763187254', 'shanujan', 'shanujan2002');

INSERT INTO Category_Employee (CID, EmID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Product_Employee (PrID, EmID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO DeliveryPerson (vehicleNum, drivingLicenseNum, city) VALUES 
('ABC1234', 'D123456789', 'Colombo'),
('XYZ5678', 'D987654321', 'Kandy'),
('LMN4321', 'D456789123', 'Galle'),
('PQR8765', 'D321654987', 'Jaffna'),
('STU9876', 'D789456123', 'Kurunegala');

INSERT INTO Customer (fName, lName, email, lane, city, dob, imgUrl, username, password) VALUES 
('John', 'Doe', 'johndoe@example.com', '123 Main St', 'Colombo', '1990-01-01', NULL, 'johndoe', 'password1'),
('Jane', 'Smith', 'janesmith@example.com', '456 Market St', 'Kandy', '1992-02-02', NULL, 'janesmith', 'password2'),
('Alice', 'Brown', 'alicebrown@example.com', '789 High St', 'Galle', '1988-03-03', NULL, 'alicebrown', 'password3'),
('Bob', 'Jones', 'bobjones@example.com', '101 Low St', 'Jaffna', '1985-04-04', NULL, 'bobjones', 'password4'),
('Charlie', 'Davis', 'charliedavis@example.com', '202 Hill St', 'Kurunegala', '1995-05-05', NULL, 'charliedavis', 'password5');

INSERT INTO Payment (payMethod, payStatus) VALUES 
('Credit Card', TRUE),
('Debit Card', TRUE),
('Cash on Delivery', FALSE),
('PayPal', TRUE),
('Bank Transfer', FALSE);

INSERT INTO Sale (orderDate, totalAmount, orderStatus, CusID, PID, DPID) VALUES 
('2024-01-01', 500.00, TRUE, 1, 1, 1),
('2024-02-02', 1500.00, TRUE, 2, 2, 2),
('2024-03-03', 200.00, TRUE, 3, 3, 3),
('2024-04-04', 50.00, TRUE, 4, 4, 4),
('2024-05-05', 600.00, TRUE, 5, 5, 5);

INSERT INTO Product_Sale (PrID, OID, quantity, netPrice, discount) VALUES 
(1, 1, 5, 500.00, 10),
(2, 2, 3, 3000.00, 5),
(3, 3, 10, 10000.00, NULL),
(4, 4, 7, 350.00, 2),
(5, 5, 2, 400.00, 5);

INSERT INTO Feedback (comments, rating, OID) VALUES 
('Great product!', 5, 1),
('Very satisfied', 4, 2),
('Not as expected', 2, 3),
('Excellent quality', 5, 4),
('Good value for money', 4, 5);

INSERT INTO Manager (EmID) VALUES 
(1),
(2),
(3),
(4),
(5);

INSERT INTO Manager_Feedback (MID, FID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Manager_Employee (MID, EmID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Admin (fName, lName, email, address, city, dob, imgUrl, phone, username, password) VALUES 
('Admin1', 'One', 'admin1@example.com', 'Admin St', 'Colombo', '1970-01-01', NULL, '0771234567', 'admin1', 'adminpass1'),
('Admin2', 'Two', 'admin2@example.com', 'Admin St', 'Kandy', '1972-02-02', NULL, '0772345678', 'admin2', 'adminpass2'),
('Admin3', 'Three', 'admin3@example.com', 'Admin St', 'Galle', '1974-03-03', NULL, '0773456789', 'admin3', 'adminpass3'),
('Admin4', 'Four', 'admin4@example.com', 'Admin St', 'Jaffna', '1976-04-04', NULL, '0774567890', 'admin4', 'adminpass4'),
('Admin5', 'Five', 'admin5@example.com', 'Admin St', 'Kurunegala', '1978-05-05', NULL, '0775678901', 'admin5', 'adminpass5');

INSERT INTO Manager_Admin (MID, AID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Enquiry (subject, comments, response) VALUES 
('Product Inquiry', 'Can you provide more details on the mangoes?', 'Yes, they are organic.'),
('Payment Issue', 'My payment didn’t go through', 'Please try again or contact support.'),
('Delivery Question', 'When will my order arrive?', 'Your order will arrive within 2 days.'),
('Product Quality', 'The apples were bruised', 'We apologize and will replace them.'),
('Order Cancelation', 'Can I cancel my order?', 'Your order has been canceled.');

INSERT INTO Customer_Enquiry (CusID, EnID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Manager_Enquiry (MID, EnID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Customer_Admin (CusID, AID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Payment_Manager (MID, PID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Customer_Phone (CusID, phone) VALUES 
(1, '0779876543'),
(2, '0788765432'),
(3, '0797654321'),
(4, '0716543210'),
(5, '0725432109');
