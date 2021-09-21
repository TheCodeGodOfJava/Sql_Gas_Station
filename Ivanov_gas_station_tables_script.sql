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
('Janitor', '20191002', 10, 1, 1),
('Salesman', '20180607', 8, 2, 1),
('Accountant', '20170901', 8, 3, 2),
('Advertiser', '20180503', 8, 4, 1);

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

--creating foreign key for table Employees to table Employees
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