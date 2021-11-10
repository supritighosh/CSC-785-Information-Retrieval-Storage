CREATE DATABASE hotel_management_system;

use hotel_management_system;

CREATE TABLE Customer
(ID int(10) primary key,
fname varchar(10),
lname varchar(10),
address varchar(40),
phone int(20),
email varchar(30)
);

INSERT INTO Customer VALUES('001','Eva','Nwanya','apt 105','62680','eva@gmail.com'),
('002','Ena','Sanya','apt 104','54321','ena@gmail.com'), ('003','Emu','Rick','apt 103','53107','emu@gmail.com'),
('004','Ela','Del','apt 102','89709','ela@gmail.com'), ('005','Era','Neya','apt 108','62690','era@gmail.com'),
('006','Elop','Jule','apt 109','626650','elop@gmail.com');

CREATE TABLE Room
(RoomID int(10) primary key,
RoomType varchar(10),
price_per_day int(20),
RoomName varchar(40)
);

INSERT INTO Room VALUES('121','small','450','single'),
('122','medium','550','double'), ('123','big','650','quad'), ('124','small','450','single'),
('125','medium','550','double'),('126','big','650','quad');

CREATE TABLE Food
(FoodID int(10) primary key,
FoodName varchar(40),
FoodType varchar(10),
availability boolean,
price int(20)
);

INSERT INTO Food VALUES('121','burger','meat',true,'100'),
('122','chicken','meat',true,'200'), ('123','vegetarian','veg',true,'300'),
('124','sandwitch','non_veg',false,'400'), ('125','coke','drinks',true,'550'), ('126','rice','drinks',false,'450');

CREATE TABLE HR
(EmpID int(10) primary key,
EmpName varchar(10),
EmpAge int(10),
EmpContact int(20),
EmpAddress varchar(40),
EmpDesignation varchar(40),
EmpDept varchar(30)
);

INSERT INTO HR VALUES('212','Eva',20,'62680','apt 105','manager','management'), 
('213','Ena',21,'54321','apt 104','employee','office'), ('214','Emu',22,'53107','apt 103','waiter','resturant'),
('215','Ela',23,'89709','apt 102','house_keeper','cleaning'),
('216','Era',24,'62690','apt 108','cook','food'),
('217','Elop',25,'626650','apt 109','cleaner','cleaning');

CREATE TABLE Services
(ServiceProviderId int(10),
ServiceType varchar(10),
ServiceName varchar(20)
);

INSERT INTO Services VALUES('321','room service','room serv'),
('322','food','food'), ('323','cleaning','cleanliness'),
('324','information','info'), ('325','medicine','treatment'), ('326','other','other');





#Objectives
ALTER TABLE hotel_management_system ADD customerId int,

ADD constraint FOREIGN KEY (customerId) REFERENCES Customer(ID);

CREATE TABLE Booking (
    bookingId int NOT NULL,
    bookedFrom DATETIME,
    bookedTo DATETIME,

    roomId int NOT NULL,
    customerId int NOT NULL,
	bookingType varchar(40),
    PRIMARY KEY (bookingId),
    FOREIGN KEY (roomId) REFERENCES Room(RoomID),
    FOREIGN KEY (customerId) REFERENCES Customer(ID)
);

INSERT INTO Booking (bookingId, bookedFrom, bookedTo, roomId, customerId, bookingType) VALUES 
('1', '2021-03-05', '2021-03-07', '124', '1', 'Online'), 
('2', '2021-03-05', '2021-03-07', '126', '5', 'Online'), 
('3', '2021-04-21', '2021-04-29', '125', '2', 'Cash'), 
('4', '2021-07-12', '2021-07-15', '123', '4', 'Online');


CREATE TABLE Orders (
    OrderId int NOT NULL,
    customerId int NOT NULL,
    foodId int NOT NULL,
	quantity int NOT NULL,    
    PRIMARY KEY (OrderId),
    FOREIGN KEY (customerId) REFERENCES Customer(ID),
	FOREIGN KEY (foodId) REFERENCES Food(FoodID)

);

INSERT INTO Orders (OrderId, customerId, foodId, quantity) VALUES 
('1', '6', '122', '3'), 
('2', '3', '126', '1'), 
('3', '5', '125', '12');


ALTER TABLE Services ADD PRIMARY KEY (ServiceProviderId);

CREATE TABLE Services_Received(
	Id int NOT NULL,
    serviceId int NOT NULL,
    employeeId int NOT NULL,
    serviceProvidedOn DATETIME,
    billedAmount float NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (serviceId) REFERENCES Services(ServiceProviderId),
	FOREIGN KEY (employeeId) REFERENCES HR(EmpID)    
);

INSERT INTO Services (ServiceProviderId, ServiceType, ServiceName) VALUES
('1', 'General', 'Laundry'),
('2', 'General', 'Food Delivery'),
('3', 'Management', 'Pressing'),
('4', 'Medical', 'First Aid'),
('5', 'IT', 'WiFi Management');


INSERT INTO Services_Received (Id, serviceId, employeeId, serviceProvidedOn, billedAmount) VALUES 
('1', '5', '215', '2021-05-06', '300'), 
('2', '2', '217', '2021-02-06', '150'), 
('3', '1', '213', '2021-09-22', '15'),
('4', '5', '214', '2021-06-06', '200');



CREATE VIEW FoodBill
AS
SELECT Orders.OrderID, Customer.fname AS 'First Name', Customer.lname AS 'Last Name', Customer.address AS 'Address', 
Orders.quantity AS 'Quantity', Food.FoodName AS 'Food Name', Food.Price, 
(Orders.quantity * Food.Price) AS 'Total Amount'
FROM Orders
INNER JOIN Customer ON Orders.customerId = Customer.ID
INNER JOIN Food ON Orders.foodId= Food.FoodID;


-- b)  select specific rows and columns;
#selecting column
SELECT EmpName from HR;

#Selecting rows
Select * from HR where EmpDept = 'Cleaning';

-- c)  apply search conditions with calculated fields;

SELECT Orders.OrderID, Customer.fname AS 'First Name', Customer.lname AS 'Last Name', Customer.address AS 'Address', 
Orders.quantity AS 'Quantity', Food.FoodName AS 'Food Name', CONCAT('$', Food.Price) AS 'Price', 
(Orders.quantity * Food.Price) AS 'Total Amount' 
FROM Orders
INNER JOIN Customer ON Orders.customerId = Customer.ID
INNER JOIN Food ON Orders.foodId= Food.FoodID;


-- d)  use pattern search
SELECT * FROM Customer WHERE lname like 'R%';

-- e)  select tuples based on ordering (but multiple columns)
SELECT * FROM HR ORDER BY EmpAge DESC, EmpContact ASC;


-- f)  use nested queries
SELECT * from Orders where customerId in (SELECT ID FROM Customer where ID > 4);

-- g)  use aggregated function;
SELECT AVG(price) price FROM Food;


-- h)  take multiple relations in a query
CREATE VIEW CustomersBookedViaCash AS
SELECT Booking.bookingId AS 'Booking Id', Booking.bookedFrom AS 'Booking From Date', Booking.bookedTo AS 'Booking End Date', 
Booking.bookingType AS 'Payment Method', Room.RoomType AS 'Room Type', Room.RoomName AS 'Room Name', Room.price_per_day AS 'Price', 
CONCAT(Customer.fname, ' ', Customer.lname) AS 'Full Name',
Customer.phone AS 'Contact Number' FROM Booking 
INNER JOIN Customer ON Booking.customerId = Customer.ID
INNER JOIN Room ON Booking.roomId = Room.RoomID
where Booking.bookingType = 'Cash';

-- i)  update specific columns and/or fields
ALTER TABLE HR ADD EmpSalary float;

-- j)  drop specific columns and rows
ALTER TABLE HR DROP COLUMN EmpSalary;

-- k)  create users and provide different views
#create user
CREATE USER 'tom'@'localhost' IDENTIFIED BY 'Tom@123';

#Create View
CREATE VIEW BookedRooms
AS
SELECT Orders.OrderID, Customer.fname AS 'First Name', Customer.lname AS 'Last Name', Customer.address AS 'Address', 
Orders.quantity AS 'Quantity', Food.FoodName AS 'Food Name', Food.Price, 
(Orders.quantity * Food.Price) AS 'Total Amount'
FROM Orders
INNER JOIN Customer ON Orders.customerId = Customer.ID
INNER JOIN Food ON Orders.foodId= Food.FoodID;

#Provide access to view
GRANT SELECT ON hotel_management_system.FoodBill TO 'tom'@'localhost';


-- l)  grant privileges (global and local) for specific users
CREATE USER 'Harry'@'localhost' IDENTIFIED BY 'Harry@123';

#Global
GRANT ALL PRIVILEGES ON *.* TO 'Harry'@'localhost' WITH GRANT OPTION;

#Local
GRANT ALL PRIVILEGES ON hotel_management_system.* TO 'Harry'@'localhost' WITH GRANT OPTION;

#Stored procedure
DELIMITER //
Create Procedure updateBooking (IN id INT, IN amount float)
   BEGIN
   DECLARE amt1 DECIMAL(10,2) DEFAULT 0;
   DECLARE amt2 DECIMAL(10,2) DEFAULT 0;
   UPDATE Booking
   SET
   pricePaid = amount WHERE bookingId = id;

	SELECT pricePaid, totalPrice INTO amt1, amt2 from Booking where bookingId = id;
    IF amt1 = amt2 THEN
 	UPDATE Booking
     SET
     checkout = 1 WHERE bookingId = id;
 END IF;
END//

#Altered table for demo
use hotel_management_system;

alter table Booking Add totalPrice float;

alter table Booking Add pricePaid float;

alter table Booking Add checkout bool;



-- m)  backup the database (complete database and specific relations from a particular database)
mysqldump -u Harry -p hotel_management_system ><your_destination_path>hotel_management_system.sql


-- n)  import database(s) that has(have) been already backed up
source hotel_management_system.sql;