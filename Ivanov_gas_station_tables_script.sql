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
DECLARE @table varchar(50)
DECLARE @schemaAndTable varchar(150)
DECLARE @insValues varchar(100)

SET @schema ='IvanovCollection';
SET @sql=''	


--drop constraints script
SELECT @sql = @sql + 'ALTER TABLE ' + s.name + '.' + t.name + ' DROP CONSTRAINT [' + RTRIM(f.name) +'];' + CHAR(13)
FROM sys.Tables t
INNER JOIN sys.foreign_keys f ON f.parent_object_id = t.object_id
INNER JOIN sys.schemas     s ON s.schema_id = f.schema_id
WHERE s.name = @schema
EXEC sp_executesql  @sql;

SET @schema ='[' + @schema + ']';

--============================
--creating first table Person
--creating and declaring variables for Person table
SET @table = '[Person]';
SET @schemaAndTable = @schema + '.'+ @table;
SET @insValues = ' INSERT INTO ' + @schemaAndTable + '(Name, Surname, Patronymic, DateOfBirth, MrtStatus)';
--drop if exists
IF OBJECT_ID(@schemaAndTable, 'U') IS NOT NULL		
	EXEC ('DROP TABLE ' + @schemaAndTable)		

--forming sql statement from string with variables
SET @sql=''
SET @sql= @sql + 'CREATE TABLE ' + @schemaAndTable 
SET @sql= @sql + ' ('
SET @sql= @sql + ' [PersonId]		BIGINT IDENTITY(1,1) PRIMARY KEY,'
SET @sql= @sql + ' [Name]			VARCHAR (50) NOT NULL,'
SET @sql= @sql + ' [Surname]		VARCHAR (50) NOT NULL,'
SET @sql= @sql + ' [Patronymic]		VARCHAR (50),'
SET @sql= @sql + ' [DateOfBirth]	DATE NOT NULL,'
SET @sql= @sql + ' [MrtStatus]		CHAR (1) NOT NULL'
SET @sql= @sql + ');'

--inserting data into table
SET @sql= @sql +  @insValues
SET @sql= @sql + ' VALUES (''Ivan'', ''Drago'', ''Petrovich'', ''19840210'', ''S'')'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''Jonathan'', ''Martin'', null, ''19820210'', ''M'')'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''Jimmie'', ''Lewis'', null, ''19860309'', ''S'')'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''Jason'', ''Green'', null, ''19880410'', ''M'')'

EXEC sp_executesql  @sql;

--============================
--creating second table Employee
--creating and declaring variables for Employee table
SET @table = '[Employee]';
SET @schemaAndTable = @schema + '.'+ @table;
SET @insValues = ' INSERT INTO ' + @schemaAndTable + '(JobTitle, HireDate, GasStationId, ManagerId, PersonId)';
--drop if exists
IF OBJECT_ID(@schemaAndTable, 'U') IS NOT NULL
	EXEC ('DROP TABLE ' + @schemaAndTable)

--forming sql statement from string with variables
SET @sql=''
SET @sql= @sql + 'CREATE TABLE ' + @schemaAndTable 
SET @sql= @sql + ' ('
SET @sql= @sql + ' [EmployeeId]		BIGINT IDENTITY(1,1) PRIMARY KEY,'
SET @sql= @sql + ' [JobTitle]		VARCHAR (120) NOT NULL,'
SET @sql= @sql + ' [HireDate]		DATE DEFAULT GETDATE() NOT NULL,'
SET @sql= @sql + ' [GasStationId]	BIGINT NOT NULL,'
SET @sql= @sql + ' [ManagerId]		BIGINT,'
SET @sql= @sql + ' [PersonId]		BIGINT NOT NULL'
SET @sql= @sql + ');'

--inserting data into table
SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''Janitor'', ''20191002'', 121, 254, 1)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''Salesman'',''20180607'', 32, 254, 2)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''Accountant'',''20170901'', 65, 28, 3)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''Advertiser'',''20180503'', 18, 65, 4)'

EXEC sp_executesql  @sql;

--============================
--creating third table Client
--creating and declaring variables for Client table
SET @table = '[Client]';
SET @schemaAndTable = @schema + '.'+ @table;
SET @insValues = ' INSERT INTO ' + @schemaAndTable + ' (RegDate, PersonId) ';

--drop if exists
IF OBJECT_ID(@schemaAndTable, 'U') IS NOT NULL
	EXEC ('DROP TABLE ' + @schemaAndTable)

--forming sql statement from string with variables
SET @sql=''
SET @sql= @sql + 'CREATE TABLE ' + @schemaAndTable 
SET @sql= @sql + ' ('
SET @sql= @sql + ' [ClientId]		BIGINT IDENTITY(1,1) PRIMARY KEY,'
SET @sql= @sql + ' [RegDate]		DATE DEFAULT GETDATE() NOT NULL,'
SET @sql= @sql + ' [PersonId]		BIGINT NOT NULL'
SET @sql= @sql + ');'

--inserting data into table
SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''20200403'', 1)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''20191002'', 2)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''20180404'', 3)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''20150201'', 4)'

EXEC sp_executesql  @sql;

--============================
--creating fourth table Cards
--creating and declaring variables for Cards table
SET @table = '[Cards]';
SET @schemaAndTable = @schema + '.'+ @table;
SET @insValues = ' INSERT INTO ' + @schemaAndTable + ' (CardNumber, CreateDate, ExpDate, Pin, Amount, ClientId)'
--drop if exists
IF OBJECT_ID(@schemaAndTable, 'U') IS NOT NULL
	EXEC ('DROP TABLE ' + @schemaAndTable)	

--forming sql statement from string with variables
SET @sql=''
SET @sql= @sql + 'CREATE TABLE ' + @schemaAndTable 
SET @sql= @sql + ' ('
SET @sql= @sql + ' [CardId]			BIGINT IDENTITY(1,1) PRIMARY KEY,'
SET @sql= @sql + ' [CardNumber]		VARCHAR (16) NOT NULL,'
SET @sql= @sql + ' [CreateDate]		DATE DEFAULT GETDATE() NOT NULL,'
SET @sql= @sql + ' [ExpDate]		DATE DEFAULT GETDATE() NOT NULL,'
SET @sql= @sql + ' [Pin]			VARCHAR (4) NOT NULL,'
SET @sql= @sql + ' [Amount]			INT NOT NULL,'
SET @sql= @sql + ' [ClientId]		BIGINT NOT NULL'

SET @sql= @sql + ');'

--inserting data into table
SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''1111222233334444'', ''20180404'', ''20220404'', ''1234'', 20, 1)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''5555666677778888'', ''20190103'', ''20230103'', ''5678'', 61, 2)'

EXEC sp_executesql  @sql;

--============================
--creating fifth table Phone
--creating and declaring variables for Phone table
SET @table = '[Phone]';
SET @schemaAndTable = @schema + '.'+ @table;
SET @insValues = ' INSERT INTO ' + @schemaAndTable + ' (PhoneNumber, PersonId)';
--drop if exists
IF OBJECT_ID(@schemaAndTable, 'U') IS NOT NULL
	EXEC ('DROP TABLE ' + @schemaAndTable)	

--forming sql statement from string with variables
SET @sql=''
SET @sql= @sql + 'CREATE TABLE ' + @schemaAndTable 
SET @sql= @sql + ' ('
SET @sql= @sql + ' [PhoneId]		BIGINT IDENTITY(1,1) PRIMARY KEY,'
SET @sql= @sql + ' [PhoneNumber]	VARCHAR (13) NOT NULL,'
SET @sql= @sql + ' [PersonId]		BIGINT NOT NULL'
SET @sql= @sql + ');'

--inserting data into table
SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''0673864954'', 1)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''0980068452'', 2)'

EXEC sp_executesql  @sql


--============================
--creating fifth table Email
--creating and declaring variables for Email table
SET @table = '[Email]';
SET @schemaAndTable = @schema + '.'+ @table;
SET @insValues = ' INSERT INTO ' + @schemaAndTable + ' (Email, PersonId)';
--drop if exists
IF OBJECT_ID(@schemaAndTable, 'U') IS NOT NULL
	EXEC ('DROP TABLE ' + @schemaAndTable)	

--forming sql statement from string with variables
SET @sql=''
SET @sql= @sql + 'CREATE TABLE ' + @schemaAndTable 
SET @sql= @sql + ' ('
SET @sql= @sql + ' [EmailId]		BIGINT IDENTITY(1,1) PRIMARY KEY,'
SET @sql= @sql + ' [Email]			VARCHAR (128) NOT NULL,'
SET @sql= @sql + ' [PersonId]		BIGINT NOT NULL'
SET @sql= @sql + ');'

--inserting data into table
SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''dixiTrino@gmail.com'', 1)'

SET @sql= @sql + @insValues
SET @sql= @sql + ' VALUES (''LenaFattero@yahoo.com'', 2)'

EXEC sp_executesql  @sql

----creating foreign key for Phones to table Clients
--SET @sql=' ALTER TABLE ' + @schema + '.[Phones]'
--SET @sql= @sql + ' ADD CONSTRAINT FK_phones_clients' 
--SET @sql= @sql + ' FOREIGN KEY (ClientId)'
--SET @sql= @sql + ' REFERENCES ' + @schema + '.[Clients](ClientId)'

--EXEC sp_executesql  @sql;

----creating foreign key for Phones to table Statuses
--SET @sql=' ALTER TABLE ' + @schema + '.[Phones]'
--SET @sql= @sql + ' ADD CONSTRAINT FK_phones_statuses' 
--SET @sql= @sql + ' FOREIGN KEY (Status)'
--SET @sql= @sql + ' REFERENCES ' + @schema + '.[Statuses](StatusId)'

--EXEC sp_executesql  @sql;

----creating foreign key for Emails to table Clients
--SET @sql=' ALTER TABLE ' + @schema + '.[Emails]'
--SET @sql= @sql + ' ADD CONSTRAINT FK_emails_clients' 
--SET @sql= @sql + ' FOREIGN KEY (ClientId)'
--SET @sql= @sql + ' REFERENCES ' + @schema + '.[Clients](ClientId)'

--EXEC sp_executesql  @sql;

----creating foreign key for Phones to table Statuses
--SET @sql=' ALTER TABLE ' + @schema + '.[Emails]'
--SET @sql= @sql + ' ADD CONSTRAINT FK_emails_statuses' 
--SET @sql= @sql + ' FOREIGN KEY (Status)'
--SET @sql= @sql + ' REFERENCES ' + @schema + '.[Statuses](StatusId)'

--EXEC sp_executesql  @sql;