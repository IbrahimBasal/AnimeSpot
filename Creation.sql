create database AnimeSpot;

use AnimeSpot

----------------------------------Star Schema Creation------------------------------------------

CREATE TABLE StoresDim(
StoreID int PRIMARY KEY,
StoreName varchar(100) NOT NULL,
Region varchar(100) NOT NULL
)

go

CREATE TABLE RepsDim(
RepID int PRIMARY KEY,
RepName varchar(100) NOT NULL
)

go

CREATE TABLE ProductDim(
ProductID int PRIMARY KEY,
ProductCode varchar(100) NOT NULL,
Description varchar(255) NOT NULL,
Category varchar(100) NOT NULL,
Subcategory varchar(100) NOT NULL,
Brand varchar(100) NOT NULL
)

go

CREATE TABLE DateDim(
DateID int PRIMARY KEY ,
TransactionTime varchar(255) NOT NULL,
Year varchar(100) NOT NULL,
Month varchar(100) NOT NULL,
Quarter varchar(100) NOT NULL,
Day varchar(100) NOT NULL
)

go

CREATE TABLE SalesFact(
SaleID int PRIMARY KEY Identity(1,1),
OrderNumer int,
StoreID int NOT NULL,
RepID int NOT NULL,
ProductID int NOT NULL,
Sold int NOT NULL,
Revenue int NOT NULL,
Returned_Reason varchar(255),
DateID int NOT NULL,
Constraint StoreFK FOREIGN KEY (StoreID) REFERENCES StoresDim(StoreID),
Constraint RepFK FOREIGN KEY (RepID) REFERENCES RepsDim(RepID),
Constraint ProductFK FOREIGN KEY (ProductID) REFERENCES ProductDim(ProductID),
Constraint DateFK FOREIGN KEY (DateID) REFERENCES DateDim(DateID)
)

go



