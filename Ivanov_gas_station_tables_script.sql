  USE master;
  GO
  IF DB_ID('db') IS NOT NULL
  ALTER DATABASE db
  SET SINGLE_USER 
  WITH ROLLBACK IMMEDIATE;
  GO
  DROP DATABASE db;
  GO
  CREATE DATABASE db;
  GO
    USE db
  GO
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'IvanovCollection')
    EXEC('CREATE SCHEMA IvanovCollection');
  GO
--====================================================================================================================================
/*
Author			Ivanov Sergey
Description		Create tables for Gas Station project
Date			11.09.2021
*/

--creating and declaring shared variables
DECLARE @schema varchar(50)
DECLARE @sql nvarchar(max)

SET @schema ='IvanovCollection';
SET @sql=''	

--drop constraints script
SELECT @sql = @sql + 'ALTER TABLE ' + s.name + '.' + t.name + ' DROP CONSTRAINT [' + RTRIM(f.name) +'];' + CHAR(13)
FROM sys.Tables t
INNER JOIN sys.foreign_keys f ON f.parent_object_id = t.object_id
INNER JOIN sys.schemas     s ON s.schema_id = f.schema_id
WHERE s.name = @schema
EXEC sp_executesql  @sql;

--============================
--creating Persons table

IF OBJECT_ID('[IvanovCollection].[Persons]', 'U') IS NOT NULL		
	EXEC ('DROP TABLE [IvanovCollection].[Persons]')	

CREATE TABLE [IvanovCollection].[Persons] (
		[PersonId]		BIGINT IDENTITY(1, 1) PRIMARY KEY,
		[Name]			VARCHAR (50) NOT NULL,
		[Surname]		VARCHAR (50) NOT NULL,
		[Patronymic]	VARCHAR (50),
		[DateOfBirth]	DATE NOT NULL,
		[Sex]			CHAR (1) NOT NULL,
		[MaritalStatus]	CHAR (1) NOT NULL
);

INSERT INTO [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus])
VALUES 
('Ivan', 'Drago', 'Petrovich', '19840210', 'S', 'M'),
('Jonathan', 'Martin', null, '19870311', 'M', 'F'),
('Jimmie', 'Lewis', null, '19860309', 'S', 'M'),
('Jason', 'Green', null, '19880410', 'M', 'F');

--============================
--creating Stations table

IF OBJECT_ID('[IvanovCollection].[Stations]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[Stations]')

CREATE TABLE [IvanovCollection].[Stations] (
	[StationId]		BIGINT IDENTITY(1, 1) PRIMARY KEY,
	[Region]		VARCHAR (50) NOT NULL,
	[Address]		VARCHAR (254) NOT NULL,	
	[ManagerId]		BIGINT NOT NULL,
	[SalesTarget]   MONEY NOT NULL
);

INSERT INTO [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget])
VALUES 
('North', 'Apple st, 57', 1, 20000),
('South', 'Mallholland drive, 160', 2, 25000),
('West', 'Andango avenue, 10', 3, 22000),
('East', 'Elm st, 12', 4, 21000);

--============================
--creating Employees table

IF OBJECT_ID('[IvanovCollection].[Employees]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[Employees]')

CREATE TABLE [IvanovCollection].[Employees] (
	[EmployeeId]	BIGINT IDENTITY(1, 1) PRIMARY KEY,
	[JobTitle]		VARCHAR (50) NOT NULL,
	[HireDate]		DATE DEFAULT GETDATE() NOT NULL,
	[StationId]		BIGINT NOT NULL,
	[PersonId]		BIGINT NOT NULL,
	[ManagerId]		BIGINT NOT NULL
);

INSERT INTO [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId])
VALUES 
('Janitor', '20191002', 1, 1, 1),
('Salesman', '20180607', 2, 2, 1),
('Accountant', '20170901', 3, 3, 2),
('Advertiser', '20180503', 4, 4, 1);

--============================
--creating Clients table

IF OBJECT_ID('[IvanovCollection].[Clients]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[Clients]')

CREATE TABLE [IvanovCollection].[Clients] (
	[ClientId]		BIGINT IDENTITY(1, 1) PRIMARY KEY,
	[ServiceType]	VARCHAR (50) NOT NULL,
	[RegDate]		DATE DEFAULT GETDATE() NOT NULL,
	[ManagerId]		BIGINT NOT NULL,
	[Status]		VARCHAR (50) NOT NULL,
	[TaxId]			VARCHAR (10) UNIQUE NOT NULL,
	[PersonId]		BIGINT NOT NULL
);

INSERT INTO [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId])
VALUES 
('GOLD', '20190202', 1, 'ACTIVE', '5001007322', 1),
('STANDARD', '20120505', 1, 'ACTIVE', '1234567890', 2),
('PLATINUM', '20130109', 1, 'ACTIVE', '0987654321', 3),
('STANDARD', '20130401', 1, 'ACTIVE', '1122334455', 4);

--============================
--creating Phones table

IF OBJECT_ID('[IvanovCollection].[Phones]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[Phones]')

CREATE TABLE [IvanovCollection].[Phones] (
	[PhoneId]		BIGINT IDENTITY(1, 1) PRIMARY KEY,
	[Number]		VARCHAR (10) UNIQUE NOT NULL,
	[Type]			VARCHAR (50) NOT NULL,
	[PersonId]		BIGINT NOT NULL
);

INSERT INTO [IvanovCollection].[Phones] ([Number], [Type], [PersonId])
VALUES 
('0676542132', 'HOME', 1),
('0984512454', 'WORK', 2),
('0669852547', 'HOME', 3),
('0639513574', 'WORK', 4);

--============================
--creating Emails table

IF OBJECT_ID('[IvanovCollection].[Emails]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[Emails]')

CREATE TABLE [IvanovCollection].[Emails] (
	[EmailId]		BIGINT IDENTITY(1, 1) PRIMARY KEY,
	[Email]			VARCHAR (254) UNIQUE NOT NULL,
	[Type]			VARCHAR (50) NOT NULL,
	[PersonId]		BIGINT NOT NULL
);

INSERT INTO [IvanovCollection].[Emails] ([Email], [Type], [PersonId])
VALUES 
('My_cool_email@gmail.com', 'HOME', 1),
('awesome_email@corpdomen.com', 'WORK', 2),
('someSmarnAssEmail@gmail.com', 'HOME', 3),
('sillyWilly@yahoo.com', 'WORK', 4);

--============================
--creating Products table

IF OBJECT_ID('[IvanovCollection].[Products]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[Products]')

CREATE TABLE [IvanovCollection].[Products] (
	[ProductId]		BIGINT NOT NULL,
	[MakerId]		BIGINT NOT NULL,
	[Price]			MONEY NOT NULL,
	[Qty]			INT NOT NULL DEFAULT 0,
	PRIMARY KEY ([ProductId], [MakerId])
);

INSERT INTO [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty])
VALUES 
(1, 1, 24.50, 5),
(1, 2, 12.30, 12),
(2, 3, 36.16, 2),
(4, 5, 6.95, 112),
(4, 2, 3.33, 569);

--============================
--creating Purchases table

IF OBJECT_ID('[IvanovCollection].[Purchases]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[Purchases]')

CREATE TABLE [IvanovCollection].[Purchases] (
	[PurchaseId]	BIGINT IDENTITY(1, 1) PRIMARY KEY,
	[CardNumber]	VARCHAR (16) UNIQUE NOT NULL,
	[StationId]		BIGINT NOT NULL,
	[SellerId]		BIGINT NOT NULL,
	[OrderDate]		DATETIME DEFAULT GETDATE() NOT NULL
);

INSERT INTO [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate])
VALUES 
('4532621143467563', 1, 1, '20201231 11:23:22'),
('4024007144903530', 2, 4, '20210112 14:40:02'),
('4070988236203751', 2, 4, '20210228 09:06:51'),
('4916279048622307', 1, 1, '20210228 10:48:36'),
('4532220815119063', 1, 1, '20210215 16:01:22');


--============================
--creating PurchaseDetails table

IF OBJECT_ID('[IvanovCollection].[PurchaseDetails]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[PurchaseDetails]')	
CREATE TABLE [IvanovCollection].[PurchaseDetails] (
	[PurchaseId]	BIGINT NOT NULL,
	[PdId]			BIGINT NOT NULL,
	[ProductId]		BIGINT NOT NULL,
	[MakerId]		BIGINT NOT NULL,
	[OrderedQty]	BIGINT NOT NULL,
	[SubTotal]		MONEY NOT NULL,
	PRIMARY KEY ([PurchaseId], [PdId])
);

INSERT INTO [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal])
VALUES 
(1, 1, 1, 1, 27, 4568.37),
(2, 2, 1, 2, 12, 3652.11),
(2, 1, 2, 3, 101, 30652.11),
(2, 3, 4, 5, 1500, 303652.11),
(1, 3, 4, 2, 9, 120.11);

--FOREIGN KEYS
--=================================================================================
--creating foreign key for table Stations to table Employees
ALTER TABLE [IvanovCollection].[Stations] 
ADD CONSTRAINT FK_Stations_Employees
	FOREIGN KEY ([ManagerId]) 
	REFERENCES [IvanovCollection].[Employees]([EmployeeId]);

--creating foreign key for table Employees to table Stations
ALTER TABLE [IvanovCollection].[Employees] 
ADD CONSTRAINT FK_Employees_Stations
	FOREIGN KEY ([StationId]) 
	REFERENCES [IvanovCollection].[Stations]([StationId]);

--creating foreign key for table Purchases to table Stations
ALTER TABLE [IvanovCollection].[Purchases] 
ADD CONSTRAINT FK_Purchases_Stations
	FOREIGN KEY ([StationId]) 
	REFERENCES [IvanovCollection].[Stations]([StationId]);

ALTER TABLE [IvanovCollection].[Employees] 
ADD CONSTRAINT FK_Employees_Employees
	FOREIGN KEY ([ManagerId]) 
	REFERENCES [IvanovCollection].[Employees]([EmployeeId]);

--creating foreign key for table Employees to table Persons
ALTER TABLE [IvanovCollection].[Employees] 
ADD CONSTRAINT FK_Employees_Persons 
	FOREIGN KEY ([PersonId]) 
	REFERENCES [IvanovCollection].[Persons]([PersonId]);

--creating foreign key for table Clients to table Employees
ALTER TABLE [IvanovCollection].[Clients] 
ADD CONSTRAINT FK_Clients_Employees 
	FOREIGN KEY ([ManagerId]) 
	REFERENCES [IvanovCollection].[Employees]([EmployeeId]);

--creating foreign key for table Clients to table Persons
ALTER TABLE [IvanovCollection].[Clients] 
ADD CONSTRAINT FK_Clients_Persons 
	FOREIGN KEY ([PersonId]) 
	REFERENCES [IvanovCollection].[Persons]([PersonId]);

--creating foreign key for table Phones to table Persons
ALTER TABLE [IvanovCollection].[Phones] 
ADD CONSTRAINT FK_Phones_Persons 
	FOREIGN KEY ([PersonId]) 
	REFERENCES [IvanovCollection].[Persons]([PersonId]);

--creating foreign key for table Phones to table Persons
ALTER TABLE [IvanovCollection].[Emails] 
ADD CONSTRAINT FK_Emails_Persons 
	FOREIGN KEY ([PersonId]) 
	REFERENCES [IvanovCollection].[Persons]([PersonId]);

--creating foreign key for table PurchaseDetails to table Purchases
ALTER TABLE [IvanovCollection].[PurchaseDetails] 
ADD CONSTRAINT FK_PurchaseDetails_Purchases 
	FOREIGN KEY ([PurchaseId]) 
	REFERENCES [IvanovCollection].[Purchases]([PurchaseId]);
	
--creating foreign key for table PurchaseDetails to table Products
ALTER TABLE [IvanovCollection].[PurchaseDetails] 
ADD CONSTRAINT FK_PurchaseDetails_Products 
	FOREIGN KEY ([ProductId], [MakerId]) 
	REFERENCES [IvanovCollection].[Products]([ProductId], [MakerId]);
