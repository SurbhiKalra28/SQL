-- Automotive Dealership Database Example

-- Ticket 1: Create the Database and Tables
Create Database IF NOT EXISTS AutomotiveDB1 ;
Use AutomotiveDB1;

CREATE TABLE Cars(
CarID INT PRIMARY KEY AUTO_INCREMENT,
CarModel VARCHAR(100) NOT NULL,
Year INT NOT NULL,
PRICE DECIMAL(10,2) NOT NULL,
COLOR ENUM('RED','BLUE','GREEN','BLACK','WHITE') NOT NULL
);

CREATE TABLE Owners(
OwnerID INT PRIMARY KEY AUTO_INCREMENT,
OwnerName VARCHAR(100) NOT NULL,
OwnerAddress VARCHAR(255) NOT NULL,
OWNERPhone VARCHAR(20) NOT NULL
);

CREATE TABLE Service(
ServiceID INT PRIMARY KEY AUTO_INCREMENT,
ServiceName VARCHAR(100) NOT NULL,
ServiceDescription TEXT,
ServiceCost DECIMAL(10,2) NOT NULL

);

-- Ticket 2: Create Relationships and Constraints

CREATE TABLE Ownerships(
OwnershipID INT PRIMARY KEY AUTO_INCREMENT,
CarID INT,
OwnerID INT,
PurchaseDate DATE NOT NULL,
FOREIGN KEY(CarID) REFERENCES Cars(CarID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(OwnerID) REFERENCES Owners(OwnerID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CarServices(
CarID INT,
ServiceID INT ,
ServiceDate DATE NOT NULL,
PRIMARY KEY(CarID,ServiceID),
FOREIGN KEY(CarID) REFERENCES Cars(CarID)ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(ServiceID) REFERENCES Service(ServiceID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MECHANICS(
MechanicID INT PRIMARY KEY AUTO_INCREMENT,
MechanicName VARCHAR(100) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
HireDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Garages(
GarageID INT PRIMARY KEY AUTO_INCREMENT,
GarageName VARCHAR(100) NOT NULL Unique,
Location VARCHAR(255) NOT NULL
);

CREATE TABLE CarMechanics(
CarID INT,
MechanicID INT,
ServiceDate DATE NOT NULL,
PRIMARY KEY(CarID,MechanicID),
FOREIGN KEY(CarID) REFERENCES Cars(CarID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(MechanicID) REFERENCES Mechanics(MechanicID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Ticket 3: Insert Sample Data

INSERT INTO Cars (CarModel, Year, Price, Color) VALUES
('Toyota Camry', 2020, 25000.00, 'Red'),
('Honda Accord', 2021, 27000.00, 'Blue'),
('Ford Focus', 2019, 22000.00, 'Green');

INSERT INTO Owners (OwnerName, OwnerAddress, OwnerPhone) VALUES
('John Doe', '123 Elm St', '555-1234'),
('Alice Johnson', '456 Oak St', '555-8765');

INSERT INTO Service (ServiceName, ServiceDescription, ServiceCost) VALUES
('Oil Change', 'Change the engine oil', 50.00),
('Tire Rotation', 'Rotate the tires', 30.00);

INSERT INTO Ownerships (CarID, OwnerID, PurchaseDate) VALUES
(1, 1, '2020-05-10'),
(2, 2, '2021-08-15');

INSERT INTO CarServices (CarID, ServiceID, ServiceDate) VALUES
(1, 1, '2021-01-10'),
(1, 2, '2021-06-15'),
(2, 1, '2021-02-20');

INSERT INTO Mechanics (MechanicName, PhoneNumber) VALUES
('Mike Smith', '555-6789'),
('Sarah Brown', '555-9876');

INSERT INTO Garages (GarageName, Location) VALUES
('Downtown Garage', '789 Maple St'),
('Uptown Garage', '101 Oak St');

INSERT INTO CarMechanics (CarID, MechanicID, ServiceDate) VALUES
(1, 1, '2021-01-10'),
(2, 2, '2021-08-15');

-- Ticket 4: Test Cascading Behavior

Select * from Cars;
Select * from Ownerships;
Select * from CarServices;
DELETE FROM Cars WHERE CarID=1;
Update Cars SET CarID = 100 where CarID = 2;
DELETE FROM OWNERS WHERE OWNERID= 2;
DELETE FROM Service WHERE ServiceID = 1; 

