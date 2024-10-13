CREATE TABLE Category (
    CID INT AUTO_INCREMENT UNIQUE NOT NULL,
    category_Name VARCHAR(100) UNIQUE NOT NULL,
    imgUrl VARCHAR(300) NULL,
    CONSTRAINT Category_PK PRIMARY KEY (CID)
);

CREATE TABLE Product (
    PrID INT AUTO_INCREMENT UNIQUE NOT NULL,
    productName VARCHAR(100) UNIQUE,
    descript VARCHAR(250) NULL,
    price DOUBLE NOT NULL,
    unit VARCHAR(300)  NULL,
    quantity INT NOT NULL,
    imgUrl VARCHAR(300) NULL,
    discount DOUBLE NULL,
    CID INT NOT NULL,
    CONSTRAINT Product_PK PRIMARY KEY (PrID),
    CONSTRAINT Product_Category_FK FOREIGN KEY (CID)
        REFERENCES Category (CID) ON DELETE CASCADE
);

CREATE TABLE Employee (
    EmID INT AUTO_INCREMENT UNIQUE NOT NULL,
    email VARCHAR(50) CHECK (email LIKE '%_@emp.freshco.lk') UNIQUE NOT NULL,
    nic VARCHAR(15) UNIQUE NOT NULL,
    dob DATE NOT NULL,
    imgUrl VARCHAR(300) NULL,
    phone VARCHAR(10) NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT Employee_PK PRIMARY KEY (EmID)
);

CREATE TABLE Category_Employee (
    CID INT NOT NULL,
    EmID INT NULL,
    PRIMARY KEY (CID),  -- Only CID in the primary key
    CONSTRAINT Category_Employee_Category_FK FOREIGN KEY (CID)
        REFERENCES Category (CID) ON DELETE CASCADE,
    CONSTRAINT Category_Employee_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID) ON DELETE SET NULL,
    UNIQUE (CID, EmID)  -- Ensure unique pairs of CID and EmID
);


CREATE TABLE Product_Employee (
    PrID INT NOT NULL,
    EmID INT NULL,
    PRIMARY KEY (PrID),  -- Only PrID in the primary key
    CONSTRAINT Product_Employee_Product_FK FOREIGN KEY (PrID)
        REFERENCES Product (PrID) ON DELETE CASCADE,
    CONSTRAINT Product_Employee_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID) ON DELETE SET NULL,
    UNIQUE (PrID, EmID)  -- Ensure unique pairs of PrID and EmID
);


-- Using EmID from Employee as a Foreign Key in Manager Table
CREATE TABLE Manager (
    EmID INT NOT NULL UNIQUE,  -- EmID must be NOT NULL and UNIQUE
    CONSTRAINT Manager_PK PRIMARY KEY (EmID),
    CONSTRAINT Manager_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID) ON DELETE CASCADE
);


-- Using EmID from Employee as a Foreign Key in DeliveryPerson Table
CREATE TABLE DeliveryPerson (
    EmID INT NOT NULL UNIQUE,
    vehicleNum VARCHAR(300) NOT NULL,
    drivingLicenseNum VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    CONSTRAINT DeliveryPerson_PK PRIMARY KEY (EmID),
    CONSTRAINT DeliveryPerson_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID) ON DELETE CASCADE
);

CREATE TABLE Customer (
    CusID INT AUTO_INCREMENT NOT NULL UNIQUE,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(10) UNIQUE NOT NULL,
    lane VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    imgUrl VARCHAR(300) NULL,
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
    totalAmount DOUBLE NOT NULL,  -- Use DOUBLE for better precision
    orderStatus BOOLEAN NULL,
    address VARCHAR(255) NOT NULL,
    CusID INT NULL,
    PID INT NOT NULL,
    EmID INT NULL,
    CONSTRAINT Sale_PK PRIMARY KEY (OID),
    CONSTRAINT Sale_Customer_FK FOREIGN KEY (CusID)
        REFERENCES Customer (CusID) ON DELETE SET NULL,
    CONSTRAINT Sale_Payment_FK FOREIGN KEY (PID)
        REFERENCES Payment (PID) ON DELETE CASCADE,
    CONSTRAINT Sale_Employee_FK FOREIGN KEY (EmID)
        REFERENCES Employee (EmID) ON DELETE SET NULL
);


CREATE TABLE Product_Sale (
    PrID INT NOT NULL,  -- Removed UNIQUE constraint
    OID INT NOT NULL,
    quantity INT NOT NULL,
    netPrice DOUBLE NOT NULL,
    CONSTRAINT Product_Sale_PK PRIMARY KEY (PrID, OID),  -- Composite primary key
    CONSTRAINT Product_Sale_Product_FK FOREIGN KEY (PrID)
        REFERENCES Product (PrID) ON DELETE CASCADE,  -- Changed to ON DELETE CASCADE
    CONSTRAINT Product_Sale_Sale_FK FOREIGN KEY (OID)
        REFERENCES Sale (OID) ON DELETE CASCADE
);


	CREATE TABLE Feedback (
    FID INT AUTO_INCREMENT NOT NULL,
    comments TEXT NOT NULL,
    rating INT NULL,
    OID INT NOT NULL,
    CONSTRAINT Feedback_PK PRIMARY KEY (FID),
    CONSTRAINT Feedback_Sale_FK FOREIGN KEY (OID)
        REFERENCES Sale (OID) ON DELETE CASCADE
);


	-- Manager Feedback Table
	CREATE TABLE Manager_Feedback (
    EmID INT NOT NULL,  -- Changed to NOT NULL if every feedback must have a manager
    FID INT NOT NULL,
    CONSTRAINT Manager_Feedback_PK PRIMARY KEY (EmID, FID),
    CONSTRAINT Manager_Feedback_Manager_FK FOREIGN KEY (EmID)
        REFERENCES Manager (EmID) ON DELETE CASCADE,  -- Changed to ON DELETE CASCADE for consistent behavior
    CONSTRAINT Manager_Feedback_Feedback_FK FOREIGN KEY (FID)
        REFERENCES Feedback (FID) ON DELETE CASCADE
);


-- Manager Employee Table (linking EmID as a relationship between manager and employees)
CREATE TABLE Manager_Employee (
    EmID_Manager INT NOT NULL,  -- Changed to NOT NULL if every employee must have a manager
    EmID_Employee INT NOT NULL,
    CONSTRAINT Manager_Employee_PK PRIMARY KEY (EmID_Manager, EmID_Employee),
    CONSTRAINT Manager_Employee_Manager_FK FOREIGN KEY (EmID_Manager)
        REFERENCES Manager (EmID) ON DELETE CASCADE,  -- Changed to ON DELETE CASCADE
    CONSTRAINT Manager_Employee_Employee_FK FOREIGN KEY (EmID_Employee)
        REFERENCES Employee (EmID) ON DELETE CASCADE
);


CREATE TABLE Admin (
    AID INT AUTO_INCREMENT NOT NULL UNIQUE,
    fName VARCHAR(50) NOT NULL,
    lName VARCHAR(50) NOT NULL,
    email VARCHAR(50) CHECK (email LIKE '%_@adm.freshco.lk') UNIQUE NOT NULL,
    lane VARCHAR(255) NULL,
    city VARCHAR(50) NULL,
    dob DATE NULL,
    imgUrl VARCHAR(300) NULL,
    phone VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT Admin_PK PRIMARY KEY (AID)
);

CREATE TABLE Enquiry (
    EnID INT AUTO_INCREMENT NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(150) NOT NULL,
    comments TEXT NOT NULL,
    response TEXT NULL,
    CONSTRAINT Enquiry_PK PRIMARY KEY (EnID)
);

CREATE TABLE Manager_Enquiry (
    EmID INT NOT NULL,  -- Changed to NOT NULL if every enquiry must have a manager
    EnID INT NOT NULL,
    CONSTRAINT Manager_Enquiry_PK PRIMARY KEY (EmID, EnID),
    CONSTRAINT Manager_Enquiry_Manager_FK FOREIGN KEY (EmID)
        REFERENCES Manager (EmID) ON DELETE CASCADE,  -- Changed to ON DELETE CASCADE for consistent behavior
    CONSTRAINT Manager_Enquiry_Enquiry_FK FOREIGN KEY (EnID)
        REFERENCES Enquiry (EnID) ON DELETE CASCADE
);


-- Create Triggers to Enforce Constraints
DELIMITER //
CREATE TRIGGER before_insert_product
BEFORE INSERT ON Product
FOR EACH ROW
BEGIN
    IF LEFT(NEW.imgUrl, 2) != './' THEN
        SET NEW.imgUrl = CONCAT('./', NEW.imgUrl);
    END IF;
END;


CREATE TRIGGER before_insert_category
BEFORE INSERT ON Category
FOR EACH ROW
BEGIN
    IF LEFT(NEW.imgUrl, 2) != './' THEN
        SET NEW.imgUrl = CONCAT('./', NEW.imgUrl);
    END IF;
END;


CREATE TRIGGER before_insert_employee
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF LEFT(NEW.imgUrl, 2) != './' THEN
        SET NEW.imgUrl = CONCAT('./', NEW.imgUrl);
    END IF;
END;


CREATE TRIGGER before_insert_customer
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    IF LEFT(NEW.imgUrl, 2) != './' THEN
        SET NEW.imgUrl = CONCAT('./', NEW.imgUrl);
    END IF;
END;


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


INSERT INTO Employee (email, nic, dob, imgUrl, phone, password) VALUES 
('john.doe@emp.freshco.lk', 'NIC123456', '1990-01-01', './image/john.jpg', '1234567890', 'password1'), -- EmID 1
('jane.smith@emp.freshco.lk', 'NIC654321', '1985-02-02', './image/jane.jpg', '0987654321', 'password2'), -- EmID 2
('mark.jones@emp.freshco.lk', 'NIC789456', '1992-03-03', './image/mark.jpg', '1357924680', 'password3'), -- EmID 3
('lucy.brown@emp.freshco.lk', 'NIC159753', '1988-04-04', './image/lucy.jpg', '2468135790', 'password4'), -- EmID 4
('alex.wilson@emp.freshco.lk', 'NIC753159', '1995-05-05', './image/alex.jpg', '3692581470', 'password5'), -- EmID 5
('emma.johnson@emp.freshco.lk', 'NIC951753', '1987-06-06', './image/emma.jpg', '1472583690', 'password6'), -- EmID 6
('william.thompson@emp.freshco.lk', 'NIC852456', '1993-07-07', './image/william.jpg', '2583691470', 'password7'), -- EmID 7
('olivia.martinez@emp.freshco.lk', 'NIC456789', '1986-08-08', './image/olivia.jpg', '9632587410', 'password8'), -- EmID 8
('james.anderson@emp.freshco.lk', 'NIC654987', '1982-09-09', './image/james.jpg', '7894561230', 'password9'), -- EmID 9
('isabella.jackson@emp.freshco.lk', 'NIC321654', '1994-10-10', './image/isabella.jpg', '3216549870', 'password10'), -- EmID 10
('benjamin.harris@emp.freshco.lk', 'NIC789123', '1983-11-11', './image/benjamin.jpg', '1473692580', 'password11'), -- EmID 11
('sophia.miller@emp.freshco.lk', 'NIC258963', '1991-12-12', './image/sophia.jpg', '2583691470', 'password12'), -- EmID 12
('elijah.wilson@emp.freshco.lk', 'NIC951456', '1996-01-13', './image/elijah.jpg', '1237894560', 'password13'), -- EmID 13
('ava.moore@emp.freshco.lk', 'NIC753468', '1990-02-14', './image/ava.jpg', '7891234560', 'password14'), -- EmID 14
('noah.taylor@emp.freshco.lk', 'NIC951369', '1997-03-15', './image/noah.jpg', '4561237890', 'password15'); -- EmID 15


-- Insert records into Category
INSERT INTO Category (category_Name, imgUrl)
VALUES
    ('Fruits', './image/cat-1.png'), 
    ('Vegitables', './image/cat-3.png'), 
    ('Drinks', './image/cat-4.png'), 
    ('Meats', './image/cat-2.png'), 
    ('Spices', './image/cat-6.png');


-- Insert records into Product
INSERT INTO Product (productName, descript, price, unit, quantity, imgUrl, discount, CID)
VALUES
    ('Apple', 'Fresh red apples', 1.99, 'kg', 200, './image/fruits-1.png', 5, 1), -- Fruits
    ('Carrot', 'Organic carrots', 0.99, 'kg', 300, './image/vegita-3.png', 0, 2), -- Vegetables
    ('Orange Juice', 'Fresh orange juice', 3.49, 'bottle', 150, './image/Drink-7.png', 10, 3), -- Drinks
    ('Chicken ', 'Boneless chicken ', 6.99, 'kg', 100, './image/meats-2.png', 0, 4), -- Meats
    ('Cinnamon', 'Ground cinnamon', 2.49, 'pack', 250, './image/spices-5.png', 5, 5); -- Spices

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
INSERT INTO Customer (fName, lName, email, phone, lane, city, dob, imgUrl, password)
VALUES
    ('John', 'Doe', 'johndoe@example.com', '1234567890', 'Main Street', 'Colombo', '1990-01-01', './image/johhny.jpg', 'password123'),
    ('Jane', 'Smith', 'janesmith@example.com', '9876543210', 'Park Avenue', 'Kandy', '1995-02-02', './image/janes.jpg', 'password456'),
    ('Alice', 'Johnson', 'alicejohnson@example.com', '1112223330', '1st Street', 'Galle', '1985-03-03', './image/alisis.jpg', 'password789'),
    ('Bob', 'Williams', 'bobwilliams@example.com', '4445556660', '2nd Street', 'Jaffna', '1975-04-04', './image/bobby.jpg', 'password000'),
    ('Charlie', 'Brown', 'charliebrown@example.com', '7778889990', '3rd Street', 'Kurunegala', '1965-05-05', './image/charles.jpg', 'password111');

-- Insert records into Payment
INSERT INTO Payment (payMethod, payStatus)
VALUES
    ('Credit Card', TRUE),
    ('Cash on Delivery', FALSE),
    ('PayPal', TRUE),
    ('Bank Transfer', FALSE),
    ('Mobile Payment', TRUE);

-- Insert records into Sale
INSERT INTO Sale (orderDate, totalAmount, orderStatus, address, CusID, PID, EmID)
VALUES
    ('2023-12-31', 100.00, TRUE,'a', 1, 1, 1),
    ('2024-01-01', 50.00, FALSE,'a', 2, 2, 2),
    ('2024-01-02', 75.00, TRUE,'b', 3, 3, 3),
    ('2024-01-03', 25.00, FALSE,'b', 4, 4, 4),
    ('2024-01-04', 150.00, TRUE,'c', 5, 5, 5);

-- Insert records into Product_Sale
INSERT INTO Product_Sale (PrID, OID, quantity)
VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 5);

-- Insert records into Feedback
INSERT INTO Feedback (comments, rating, OID)
VALUES
    ('Great product!', '5', 1),
    ('Good service', '4', 2),
    ('Excellent value', '5', 3),
    ('Fast delivery', '4', 4),
    ('Happy customer', '5', 5);

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

INSERT INTO Enquiry (email, subject, comments, response)
VALUES 
('goodsden54@gmail.com', 'Product Availability', 'Is the new model of the phone available in stock?', NULL),
('goodsdn54@gmail.com', 'Shipping Inquiry', 'What are the shipping charges to New York?', NULL),
('goodsen54@gmail.com', 'Warranty Details', 'Could you provide details on the warranty for the laptop?', NULL),
('goodden54@gmail.com', 'Discount Offers', 'Are there any discount offers for bulk purchases?', NULL),
('goosden54@gmail.com', 'Return Policy', 'What is the return policy for electronics?', NULL);

-- Insert records into Manager_Enquiry
INSERT INTO Manager_Enquiry (EmID, EnID)
VALUES
    (6, 1),
    (7, 2),
    (8, 3),
    (9, 4),
    (10, 5);

INSERT INTO Admin (fName, lName, email, lane, city, dob, imgUrl, phone, password)
VALUES 
    ('John', 'Doe', 'johndoe@adm.freshco.lk', '123 Main St', 'Springfield', '1985-04-12', './image/johndoe.jpg', '123-456-7890', 'hashed_password_1'),
    ('Jane', 'Smith', 'janesmith@adm.freshco.lk', '456 Elm St', 'Shelbyville', '1990-07-22', './image/janesmith.jpg', '098-765-4321', 'hashed_password_2'),
    ('Alice', 'Johnson', 'alicejohnson@adm.freshco.lk', '789 Oak St', 'Ogdenville', '1988-09-15', './image/alicejohnson.jpg', '555-123-4567', 'hashed_password_3'),
    ('Bob', 'Brown', 'bobbrown@adm.freshco.lk', '321 Pine St', 'Capitol City', '1979-11-05', './image/bobbrown.jpg', '444-987-6543', 'hashed_password_4'),
    ('Charlie', 'Davis', 'charliedavis@adm.freshco.lk', '654 Maple St', 'North Haverbrook', '1983-03-30', './image/charliedavis.jpg', '333-456-7890', 'hashed_password_5');


CREATE VIEW EmployeeRoleView AS
SELECT 
    e.EmID,
    e.email,
    e.nic,
    e.dob,
    e.imgUrl,
    e.phone,
    e.password,
    CASE
        WHEN m.EmID IS NOT NULL THEN 'Manager'
        WHEN dp.EmID IS NOT NULL THEN 'DeliveryPerson'
        ELSE 'Normal Employee'
    END AS Role,
    -- Delivery Person specific fields, NULL for non-DeliveryPersons
    dp.vehicleNum,
    dp.drivingLicenseNum,
    dp.city
FROM 
    Employee e
LEFT JOIN 
    Manager m ON e.EmID = m.EmID
LEFT JOIN 
    DeliveryPerson dp ON e.EmID = dp.EmID;

CREATE VIEW Manager_Sales_View AS
SELECT 
    S.OID AS OrderID,
    S.orderDate,
    S.totalAmount,
    CASE
        WHEN S.orderStatus IS NULL THEN 'Pending'      -- NULL = Pending
        WHEN S.orderStatus = 0 THEN 'On Delivery'      -- 0 = On Delivery
        WHEN S.orderStatus = 1 THEN 'Completed'        -- 1 = Completed
        ELSE 'Unknown'                                 -- Handle unexpected cases
    END AS orderStatus,
    S.address,
    C.CusID,
    C.fName,
    C.lName,
    C.email,
    P.PID AS PaymentID,
    P.payMethod,
    CASE
        WHEN P.payStatus = 0 THEN 'Pending'            -- 0 = Pending
        WHEN P.payStatus = 1 THEN 'Paid'               -- 1 = Paid
        ELSE 'Unknown'                                 -- Handle unexpected cases
    END AS payStatus,                                  -- Display human-readable status
    F.FID AS FeedbackID,
    F.comments,
    F.rating,
    S.EmID AS DeliveryPersonID                         -- Include DPID from Sale table
FROM 
    Sale S
LEFT JOIN 
    Customer C ON S.CusID = C.CusID
LEFT JOIN 
    Payment P ON S.PID = P.PID
LEFT JOIN 
    Feedback F ON S.OID = F.OID;

CREATE VIEW SaleDetails AS
SELECT 
    s.OID AS OrderID,
    s.orderDate AS OrderDate,
    s.totalAmount AS TotalAmount,
    s.orderStatus AS OrderStatus,
    s.address AS Address,
    s.CusID AS CustomerID,
    ps.PrID AS ProductID,
    p.productName AS ProductName,
    p.price AS ProductPrice,
    ps.quantity AS Quantity,
    p.discount AS ProductDiscount,
    p.imgUrl AS ProductImageURL
FROM 
    Sale s
LEFT JOIN 
    Product_Sale ps ON s.OID = ps.OID
LEFT JOIN 
    Product p ON ps.PrID = p.PrID;
