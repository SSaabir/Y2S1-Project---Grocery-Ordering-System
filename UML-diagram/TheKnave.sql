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
    CONSTRAINT Product_Category_FK FOREIGN KEY (CID)
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
    CONSTRAINT Category_Employee_Category_FK FOREIGN KEY (CID)
        REFERENCES Category (CID),
    CONSTRAINT Category_Employee_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
);

CREATE TABLE Product_Employee (
    PrID INT NOT NULL,
    EmID INT NOT NULL,
    CONSTRAINT Product_Employee_PK PRIMARY KEY (PrID, EmID),
    CONSTRAINT Product_Employee_Product_FK FOREIGN KEY (PrID)
        REFERENCES Product (PrID),
    CONSTRAINT Product_Employee_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
);

-- Using EmID from Employee as a Foreign Key in Manager Table
CREATE TABLE Manager (
    EmID INT NOT NULL UNIQUE,
    CONSTRAINT Manager_PK PRIMARY KEY (EmID),
    CONSTRAINT Manager_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
);

-- Using EmID from Employee as a Foreign Key in DeliveryPerson Table
CREATE TABLE DeliveryPerson (
    EmID INT NOT NULL UNIQUE,
    vehicleNum CHAR(10) NOT NULL,
    drivingLicenseNum VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    CONSTRAINT DeliveryPerson_PK PRIMARY KEY (EmID),
    CONSTRAINT DeliveryPerson_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
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
    EmID INT NOT NULL,
    CONSTRAINT Sale_PK PRIMARY KEY (OID),
    CONSTRAINT Sale_Customer_FK FOREIGN KEY (CusID)
        REFERENCES Customer (CusID),
    CONSTRAINT Sale_Payment_FK FOREIGN KEY (PID)
        REFERENCES Payment (PID),
    CONSTRAINT Sale_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID)
);

CREATE TABLE Product_Sale (
    PrID INT NOT NULL,
    OID INT NOT NULL,
    quantity INT NOT NULL,
    netPrice FLOAT NOT NULL,
    discount INT NULL,
    CONSTRAINT Product_Sale_PK PRIMARY KEY (PrID, OID),
    CONSTRAINT Product_Sale_Product_FK FOREIGN KEY (PrID)
        REFERENCES Product (PrID),
    CONSTRAINT Product_Sale_Sale_FK FOREIGN KEY (OID)
        REFERENCES Sale (OID)
);

CREATE TABLE Feedback (
    FID INT AUTO_INCREMENT NOT NULL UNIQUE,
    comments TEXT NOT NULL,
    rating INT NULL,
    OID INT NOT NULL,
    CONSTRAINT Feedback_PK PRIMARY KEY (FID),
    CONSTRAINT Feedback_Sale_FK FOREIGN KEY (OID)
        REFERENCES Sale (OID)
);

-- Manager Feedback Table
CREATE TABLE Manager_Feedback (
    EmID INT NOT NULL,
    FID INT NOT NULL,
    CONSTRAINT Manager_Feedback_PK PRIMARY KEY (EmID, FID),
    CONSTRAINT Manager_Feedback_Manager_FK FOREIGN KEY (EmID)
        REFERENCES Manager (EmID),
    CONSTRAINT Manager_Feedback_Feedback_FK FOREIGN KEY (FID)
        REFERENCES Feedback (FID)
);

-- Manager Employee Table (linking EmID as a relationship between manager and employees)
CREATE TABLE Manager_Employee (
    EmID_Manager INT NOT NULL,
    EmID_Employee INT NOT NULL,
    CONSTRAINT Manager_Employee_PK PRIMARY KEY (EmID_Manager, EmID_Employee),
    CONSTRAINT Manager_Employee_Manager_FK FOREIGN KEY (EmID_Manager)
        REFERENCES Manager (EmID),
    CONSTRAINT Manager_Employee_Employee_FK FOREIGN KEY (EmID_Employee)
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
    EmID INT NOT NULL,
    AID INT NOT NULL,
    CONSTRAINT Manager_Admin_PK PRIMARY KEY (EmID, AID),
    CONSTRAINT Manager_Admin_Manager_FK FOREIGN KEY (EmID)
        REFERENCES Manager (EmID),
    CONSTRAINT Manager_Admin_Admin_FK FOREIGN KEY (AID)
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
    CONSTRAINT Customer_Enquiry_Customer_FK FOREIGN KEY (CusID)
        REFERENCES Customer (CusID),
    CONSTRAINT Customer_Enquiry_Enquiry_FK FOREIGN KEY (EnID)
        REFERENCES Enquiry (EnID)
);

CREATE TABLE Manager_Enquiry (
    EmID INT NOT NULL,
    EnID INT NOT NULL,
    CONSTRAINT Manager_Enquiry_PK PRIMARY KEY (EmID, EnID),
    CONSTRAINT Manager_Enquiry_Manager_FK FOREIGN KEY (EmID)
        REFERENCES Manager (EmID),
    CONSTRAINT Manager_Enquiry_Enquiry_FK FOREIGN KEY (EnID)
        REFERENCES Enquiry (EnID)
);

CREATE TABLE Customer_Admin (
    CusID INT NOT NULL,
    AID INT NOT NULL,
    CONSTRAINT Customer_Admin_PK PRIMARY KEY (CusID, AID),
    CONSTRAINT Customer_Admin_Customer_FK FOREIGN KEY (CusID)
        REFERENCES Customer (CusID),
    CONSTRAINT Customer_Admin_Admin_FK FOREIGN KEY (AID)
        REFERENCES Admin (AID)
);

CREATE TABLE Payment_Manager (
    EmID INT NOT NULL,
    PID INT NOT NULL,
    CONSTRAINT Payment_Manager_PK PRIMARY KEY (EmID, PID),
    CONSTRAINT Payment_Manager_Manager_FK FOREIGN KEY (EmID)
        REFERENCES Manager (EmID),
    CONSTRAINT Payment_Manager_Payment_FK FOREIGN KEY (PID)
        REFERENCES Payment (PID)
);

CREATE TABLE Customer_Phone (
    CusID INT NOT NULL,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT Customer_Phone_PK PRIMARY KEY (CusID, phone),
    CONSTRAINT Customer_Phone_Customer_FK FOREIGN KEY (CusID)
        REFERENCES Customer (CusID)
);

-- Create Triggers to Enforce Constraints
DELIMITER //

CREATE TRIGGER before_insert_manager
BEFORE INSERT ON Manager
FOR EACH ROW
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count FROM DeliveryPerson WHERE EmID = NEW.EmID;
    IF emp_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee cannot be both a Manager and a Delivery Person';
    END IF;
END; //

CREATE TRIGGER before_insert_deliveryperson
BEFORE INSERT ON DeliveryPerson
FOR EACH ROW
BEGIN
    DECLARE emp_count INT;
    SELECT COUNT(*) INTO emp_count FROM Manager WHERE EmID = NEW.EmID;
    IF emp_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee cannot be both a Delivery Person and a Manager';
    END IF;
END; //

DELIMITER ;


INSERT INTO Employee (email, nic, dob, imgUrl, phone, username, password) VALUES 
('john.doe@example.com', 'NIC123456', '1990-01-01', 'john.jpg', '1234567890', 'johndoe', 'password1'), -- EmID 1
('jane.smith@example.com', 'NIC654321', '1985-02-02', 'jane.jpg', '0987654321', 'janesmith', 'password2'), -- EmID 2
('mark.jones@example.com', 'NIC789456', '1992-03-03', 'mark.jpg', '1357924680', 'markjones', 'password3'), -- EmID 3
('lucy.brown@example.com', 'NIC159753', '1988-04-04', 'lucy.jpg', '2468135790', 'lucybrown', 'password4'), -- EmID 4
('alex.wilson@example.com', 'NIC753159', '1995-05-05', 'alex.jpg', '3692581470', 'alexwilson', 'password5'), -- EmID 5
('emma.johnson@example.com', 'NIC951753', '1987-06-06', 'emma.jpg', '1472583690', 'emmajohnson', 'password6'), -- EmID 6
('william.thompson@example.com', 'NIC852456', '1993-07-07', 'william.jpg', '2583691470', 'williamthompson', 'password7'), -- EmID 7
('olivia.martinez@example.com', 'NIC456789', '1986-08-08', 'olivia.jpg', '9632587410', 'oliviamartinez', 'password8'), -- EmID 8
('james.anderson@example.com', 'NIC654987', '1982-09-09', 'james.jpg', '7894561230', 'jamesanderson', 'password9'), -- EmID 9
('isabella.jackson@example.com', 'NIC321654', '1994-10-10', 'isabella.jpg', '3216549870', 'isabellajackson', 'password10'), -- EmID 10
('benjamin.harris@example.com', 'NIC789123', '1983-11-11', 'benjamin.jpg', '1473692580', 'benjaminharris', 'password11'), -- EmID 11
('sophia.miller@example.com', 'NIC258963', '1991-12-12', 'sophia.jpg', '2583691470', 'sophiamiller', 'password12'), -- EmID 12
('elijah.wilson@example.com', 'NIC951456', '1996-01-13', 'elijah.jpg', '1237894560', 'elijahwilson', 'password13'), -- EmID 13
('ava.moore@example.com', 'NIC753468', '1990-02-14', 'ava.jpg', '7891234560', 'avamoore', 'password14'), -- EmID 14
('noah.taylor@example.com', 'NIC951369', '1997-03-15', 'noah.jpg', '4561237890', 'noahtaylor', 'password15'); -- EmID 15

-- Insert records into Category
INSERT INTO Category (category_Name)
VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home Appliances'),
    ('Books'),
    ('Toys');

-- Insert records into Product
INSERT INTO Product (productName, descript, price, unit, quantity, imgUrl, discount, CID)
VALUES
    ('Smartphone', 'Latest model smartphone', 599.99, 'unit', 100, 'smartphone.jpg', 10, 1),
    ('T-shirt', 'Cotton T-shirt', 19.99, 'piece', 500, 'tshirt.jpg', 5, 2),
    ('Refrigerator', '2-door refrigerator', 799.99, 'unit', 50, 'refrigerator.jpg', 15, 3),
    ('Novel', 'Bestselling novel', 14.99, 'book', 200, 'novel.jpg', 0, 4),
    ('Toy Car', 'Toy car for kids', 19.99, 'piece', 100, 'toycar.jpg', 10, 5);

-- Insert records into Manager
INSERT INTO Manager (EmID)
VALUES
    (6),
    (7),
    (8),
    (9),
    (10);

-- Insert records into DeliveryPerson
INSERT INTO DeliveryPerson (EmID, vehicleNum, drivingLicenseNum, city)
VALUES
    (2, 'DP001', 'DL12345', 'Colombo'),
    (3, 'DP002', 'DL67890', 'Kandy'),
    (11, 'DP003', 'DL11111', 'Galle'),
    (12, 'DP004', 'DL22222', 'Jaffna'),
    (13, 'DP005', 'DL33333', 'Kurunegala');

-- Insert records into Customer
INSERT INTO Customer (fName, lName, email, lane, city, dob, username, password)
VALUES
    ('John', 'Doe', 'johndoe@example.com', 'Main Street', 'Colombo', '1990-01-01', 'johndoe', 'password123'),
    ('Jane', 'Smith', 'janesmith@example.com', 'Park Avenue', 'Kandy', '1995-02-02', 'janesmith', 'password456'),
    ('Alice', 'Johnson', 'alicejohnson@example.com', '1st Street', 'Galle', '1985-03-03', 'alicejohnson', 'password789'),
    ('Bob', 'Williams', 'bobwilliams@example.com', '2nd Street', 'Jaffna', '1975-04-04', 'bobwilliams', 'password000'),
    ('Charlie', 'Brown', 'charliebrown@example.com', '3rd Street', 'Kurunegala', '1965-05-05', 'charliebrown', 'password111');

-- Insert records into Payment
INSERT INTO Payment (payMethod, payStatus)
VALUES
    ('Credit Card', TRUE),
    ('Cash on Delivery', FALSE),
    ('PayPal', TRUE),
    ('Bank Transfer', FALSE),
    ('Mobile Payment', TRUE);

-- Insert records into Sale
INSERT INTO Sale (orderDate, totalAmount, orderStatus, CusID, PID, EmID)
VALUES
    ('2023-12-31', 100.00, TRUE, 1, 1, 1),
    ('2024-01-01', 50.00, FALSE, 2, 2, 2),
    ('2024-01-02', 75.00, TRUE, 3, 3, 3),
    ('2024-01-03', 25.00, FALSE, 4, 4, 4),
    ('2024-01-04', 150.00, TRUE, 5, 5, 5);

-- Insert records into Product_Sale
INSERT INTO Product_Sale (PrID, OID, quantity, netPrice, discount)
VALUES
    (1, 1, 2, 90.00, 10),
    (2, 2, 1, 45.00, 5),
    (3, 3, 3, 60.00, 15),
    (4, 4, 2, 20.00, 0),
    (5, 5, 5, 120.00, 20);

-- Insert records into Feedback
INSERT INTO Feedback (comments, rating, OID)
VALUES
    ('Great product!', 5, 1),
    ('Good service', 4, 2),
    ('Excellent value', 5, 3),
    ('Fast delivery', 4, 4),
    ('Happy customer', 5, 5);

-- Insert records into Category_Employee
INSERT INTO Category_Employee (CID, EmID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert records into Product_Employee
INSERT INTO Product_Employee (PrID, EmID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert records into Manager_Feedback
INSERT INTO Manager_Feedback (EmID, FID)
VALUES
    (6, 1),
    (7, 2),
    (8, 3),
    (9, 4),
    (10, 5);

-- Insert records into Manager_Employee
INSERT INTO Manager_Employee (EmID_Manager, EmID_Employee)
VALUES
	(10,11),
    (6, 2),
    (7, 3),
    (8, 4),
    (9, 5);

INSERT INTO Enquiry (subject, comments, response)
VALUES 
('Product Availability', 'Is the new model of the phone available in stock?', NULL),
('Shipping Inquiry', 'What are the shipping charges to New York?', NULL),
('Warranty Details', 'Could you provide details on the warranty for the laptop?', NULL),
('Discount Offers', 'Are there any discount offers for bulk purchases?', NULL),
('Return Policy', 'What is the return policy for electronics?', NULL);

-- Insert records into Customer_Enquiry
INSERT INTO Customer_Enquiry (CusID, EnID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert records into Manager_Enquiry
INSERT INTO Manager_Enquiry (EmID, EnID)
VALUES
    (6, 1),
    (7, 2),
    (8, 3),
    (9, 4),
    (10, 5);

INSERT INTO Admin (fName, lName, email, address, city, dob, imgUrl, phone, username, password)
VALUES 
('John', 'Doe', 'johndoe@example.com', '123 Main St', 'Springfield', '1985-04-12', 'http://example.com/images/johndoe.jpg', '123-456-7890', 'johndoe', 'hashed_password_1'),
('Jane', 'Smith', 'janesmith@example.com', '456 Elm St', 'Shelbyville', '1990-07-22', 'http://example.com/images/janesmith.jpg', '098-765-4321', 'janesmith', 'hashed_password_2'),
('Alice', 'Johnson', 'alicejohnson@example.com', '789 Oak St', 'Ogdenville', '1988-09-15', 'http://example.com/images/alicejohnson.jpg', '555-123-4567', 'alicejohnson', 'hashed_password_3'),
('Bob', 'Brown', 'bobbrown@example.com', '321 Pine St', 'Capitol City', '1979-11-05', 'http://example.com/images/bobbrown.jpg', '444-987-6543', 'bobbrown', 'hashed_password_4'),
('Charlie', 'Davis', 'charliedavis@example.com', '654 Maple St', 'North Haverbrook', '1983-03-30', 'http://example.com/images/charliedavis.jpg', '333-456-7890', 'charliedavis', 'hashed_password_5');

-- Insert records into Customer_Admin
INSERT INTO Customer_Admin (CusID, AID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert records into Payment_Manager
INSERT INTO Payment_Manager (EmID, PID)
VALUES
    (6, 1),
    (7, 2),
    (8, 3),
    (9, 4),
    (10, 5);

-- Insert records into Customer_Phone
INSERT INTO Customer_Phone (CusID, phone)
VALUES
    (1, '1234567890'),
    (2, '9876543210'),
    (3, '1112223330'),
    (4, '4445556660'),
    (5, '7778889990');