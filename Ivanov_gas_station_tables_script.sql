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
--creating Person table

IF OBJECT_ID('[IvanovCollection].[Person]', 'U') IS NOT NULL		
	EXEC ('DROP TABLE [IvanovCollection].[Person]')	

CREATE TABLE [IvanovCollection].[Person] (
		[PersonId]		BIGINT IDENTITY(1, 1) PRIMARY KEY,
		[Name]			VARCHAR (50) NOT NULL,
		[Surname]		VARCHAR (50) NOT NULL,
		[Patronymic]	VARCHAR (50),
		[DateOfBirth]	DATE NOT NULL,
		[Sex]			CHAR (1) NOT NULL,
		[MaritalStatus]	CHAR (1) NOT NULL
);

INSERT INTO [IvanovCollection].[Person] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus])
VALUES 
('Ivan', 'Drago', 'Petrovich', '19840210', 'S', 'M'),
('Jonathan', 'Martin', null, '19870311', 'M', 'F'),
('Jimmie', 'Lewis', null, '19860309', 'S', 'M'),
('Jason', 'Green', null, '19880410', 'M', 'F');


--============================
--creating Employee table

IF OBJECT_ID('[IvanovCollection].[Employee]', 'U') IS NOT NULL
	EXEC ('DROP TABLE [IvanovCollection].[Employee]')

CREATE TABLE [IvanovCollection].[Employee] (
	[EmployeeId]	BIGINT IDENTITY(1, 1) PRIMARY KEY,
	[JobTitle]		VARCHAR (50) NOT NULL,
	[HireDate]		DATE DEFAULT GETDATE() NOT NULL,
	[StationId]		BIGINT NOT NULL,
	[PersonId]		BIGINT NOT NULL,
	[ManagerId]		BIGINT NOT NULL
);

INSERT INTO [IvanovCollection].[Employee] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId])
VALUES 
('Janitor', '20191002', 10, 1, 1),
('Salesman', '20180607', 8, 2, 1),
('Accountant', '20170901', 8, 3, 2),
('Advertiser', '20180503', 8, 4, 1);

----creating foreign key for table Employee to table Employee
ALTER TABLE [IvanovCollection].[Employee] 
ADD CONSTRAINT FK_employee_employee
	FOREIGN KEY ([ManagerId]) 
	REFERENCES [IvanovCollection].[Employee]([EmployeeId]);

--creating foreign key for table Employee to table Person
ALTER TABLE [IvanovCollection].[Employee] 
ADD CONSTRAINT FK_employee_person 
	FOREIGN KEY ([PersonId]) 
	REFERENCES [IvanovCollection].[Person]([PersonId]);
