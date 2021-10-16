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

CREATE INDEX ix_full_name_persons
ON [IvanovCollection].[Persons]([Name], Surname, Patronymic);

insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Luelle', 'Wills', 'Mélys', '1986-10-28 23:51:06', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Pier', 'Orsi', 'Josée', '1989-09-18 01:52:39', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Courtnay', 'Pugsley', 'Cunégonde', '1995-03-28 09:38:42', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Shirleen', 'Goney', 'Wá', '1990-11-21 02:39:46', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Adey', 'Pollen', 'Anaëlle', '1987-05-09 22:06:19', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Valle', 'Kalisch', 'Dù', '1987-05-03 02:49:23', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Terrill', 'Heinritz', 'Alizée', '1981-07-30 08:05:09', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Nickey', 'Tullot', 'Lài', '1993-12-22 12:44:44', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Kristyn', 'Hannay', 'Laurélie', '1981-09-02 07:28:51', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Garvy', 'Allkins', 'Börje', '1984-12-13 13:41:05', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Wes', 'Keoghan', 'Méthode', '1987-07-25 20:07:12', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Madison', 'Sanday', 'Léonie', '1981-02-16 08:41:27', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Florinda', 'Saladino', 'Séverine', '1990-11-17 13:23:29', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Darrel', 'Follitt', 'Inès', '1995-01-15 15:34:31', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Gino', 'Whitchurch', 'Marie-ève', '1990-04-11 06:26:15', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Lem', 'Goater', 'Marylène', '1986-06-25 22:36:45', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Karrah', 'Sacher', 'Mélissandre', '1989-10-01 23:22:54', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Vernor', 'Jossum', 'Andrée', '1993-09-29 18:33:24', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Mable', 'Couroy', 'Lén', '1982-11-14 14:29:40', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Avie', 'Dust', 'Fèi', '1994-01-01 04:31:07', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Jakob', 'D''Adda', 'Angélique', '1994-02-10 23:01:26', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Berkley', 'Vasilchikov', 'Josée', '1983-03-23 22:17:13', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Ham', 'Bruckman', 'Gaétane', '1993-01-14 09:47:16', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Lorna', 'Huckell', 'Laurène', '1985-05-25 20:37:05', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Stu', 'Jude', 'Océane', '1987-09-11 01:40:56', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Cortie', 'Grotty', 'Kallisté', '1983-02-11 13:58:27', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Pen', 'Moth', 'Eliès', '1983-01-31 07:18:23', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Cynthia', 'Drinkel', 'Nélie', '1986-01-21 20:17:12', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Dar', 'Gaythor', 'Aurélie', '1995-04-15 10:16:51', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Dominic', 'Mc Andrew', 'Mélia', '1994-07-23 03:59:28', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Stillman', 'Grimsdyke', 'Irène', '1992-05-13 03:57:00', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Dayle', 'Golden of Ireland', 'Maïté', '1988-04-19 01:46:49', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Jay', 'Orniz', 'Göran', '1993-09-07 08:44:31', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Jaclyn', 'Bromby', 'Cinéma', '1989-01-11 13:35:38', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Dannye', 'Elington', 'Ophélie', '1983-06-22 10:32:10', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Orville', 'Picford', 'Maïly', '1986-03-18 11:01:13', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Carola', 'Menichelli', 'Maïly', '1989-09-15 09:09:05', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Jeana', 'Birdsall', 'Loïc', '1991-11-11 06:07:13', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Clementius', 'Eggleson', 'Maëlle', '1983-06-23 06:13:29', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Nichols', 'Lerven', 'Noémie', '1983-12-31 02:54:18', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Justine', 'Evennett', 'Illustrée', '1992-08-28 15:43:00', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Gabrielle', 'Benoix', 'Aloïs', '1990-12-07 17:08:31', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Elizabeth', 'Prosch', 'Maïlis', '1985-01-04 14:07:28', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Lorry', 'Staines', 'Eliès', '1992-12-11 03:18:44', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Patten', 'Anyon', 'Eliès', '1986-02-05 05:09:35', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Kissiah', 'Eady', 'Naéva', '1982-10-01 01:12:30', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Reggi', 'Mounch', 'Annotés', '1982-06-10 03:02:16', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Hartley', 'de Leon', 'Célia', '1987-11-30 08:30:19', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Ignacius', 'Bake', 'Laurélie', '1992-12-19 18:41:17', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Goran', 'Bucher', 'Cécile', '1994-12-16 08:45:49', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Geri', 'Paviour', 'Anaël', '1992-06-24 20:47:16', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Taffy', 'McKeand', 'Aurélie', '1982-04-22 01:56:32', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Gaye', 'O''Quin', 'Crééz', '1986-01-05 15:20:52', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Swen', 'Geri', 'Salomé', '1993-09-30 10:43:10', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Skipper', 'Perrott', 'Mahélie', '1993-12-29 23:34:59', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Izak', 'Lyptrade', 'Kù', '1989-05-20 09:56:54', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Jeth', 'Klousner', 'Nélie', '1987-10-12 21:01:31', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Neille', 'Blanc', 'Miléna', '1990-09-19 05:10:35', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Edy', 'Casine', 'Andréa', '1992-10-30 14:54:42', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Daron', 'Rodenhurst', 'Lén', '1994-12-11 05:46:26', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Kalindi', 'Simnett', 'Marie-hélène', '1991-09-27 01:10:50', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Cherilynn', 'Yule', 'Maïlis', '1987-05-09 01:09:21', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Rhianna', 'Toolin', 'Almérinda', '1985-01-30 01:22:32', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Aluino', 'Balham', 'Léane', '1984-03-06 03:22:21', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Elisa', 'Cheney', 'Noémie', '1986-02-07 16:21:37', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Merilyn', 'Geipel', 'Cléopatre', '1994-07-15 08:02:26', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Benedetto', 'Nockalls', 'Cléa', '1992-06-15 00:52:36', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Portie', 'Haggish', 'Josée', '1991-09-29 07:31:15', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Neill', 'Glowacha', 'Bérénice', '1994-09-09 11:25:33', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Germaine', 'Chittie', 'Estée', '1991-09-24 00:34:55', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Thor', 'McPeice', 'Jú', '1992-03-28 01:35:01', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Ive', 'Vasilyev', 'Desirée', '1988-03-27 03:42:47', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Elvina', 'Slavin', 'Táng', '1994-01-16 05:22:03', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Eldin', 'Henriet', 'Mégane', '1990-04-13 15:22:14', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Rollo', 'Fishley', 'Amélie', '1985-07-01 07:19:33', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Cristian', 'Manuely', 'Pål', '1995-07-04 13:20:51', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Elset', 'Enochsson', 'Léana', '1984-07-30 16:40:36', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Robena', 'Hurdle', 'Félicie', '1992-01-05 23:23:41', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Elfie', 'Cutcliffe', 'Liè', '1990-10-09 07:36:02', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Toby', 'Terbeck', 'Maëlle', '1990-10-06 14:23:08', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Nicolea', 'Pisculli', 'Angèle', '1993-04-24 10:26:00', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Natala', 'Spelman', 'Lyséa', '1986-05-10 20:34:16', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Eziechiele', 'Greedy', 'Méthode', '1984-07-04 22:27:22', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Ted', 'Brooksbie', 'Åke', '1990-02-12 21:54:05', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Arly', 'Huttley', 'Ruì', '1991-05-12 18:16:01', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Harlan', 'Luggar', 'Célia', '1993-12-14 16:45:41', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Zane', 'Ahrenius', 'Audréanne', '1992-02-27 05:21:47', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Marius', 'Gethyn', 'Réservés', '1984-10-17 13:20:03', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Kerk', 'Musson', 'Garçon', '1981-11-19 03:54:03', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Law', 'Chichgar', 'Nuó', '1981-02-12 12:37:10', 'M', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Jerrilee', 'Bowkley', 'Léonore', '1987-03-06 08:30:42', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Iormina', 'Berkely', 'Marie-françoise', '1992-05-01 08:11:44', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Thane', 'Greggor', 'Frédérique', '1988-03-15 18:41:46', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Minetta', 'Bugdall', 'Yóu', '1994-05-28 07:55:57', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Raven', 'Whistlecroft', 'Örjan', '1982-07-24 01:38:12', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Ethelyn', 'Clyde', 'Mélinda', '1980-11-22 14:20:46', 'F', 'S');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Gar', 'Frome', 'Erwéi', '1984-08-30 19:11:29', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Shawn', 'Primak', 'Thérèsa', '1986-11-13 20:42:29', 'F', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Chickie', 'Hubner', 'Åsa', '1986-11-05 18:25:05', 'M', 'M');
insert into [IvanovCollection].[Persons] ([Name], [Surname], [Patronymic], [DateOfBirth], [Sex], [MaritalStatus]) values ('Stefania', 'Pellett', 'Märta', '1984-06-21 04:33:05', 'F', 'S');

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

CREATE INDEX ix_stations_persons
ON [IvanovCollection].[Stations](ManagerId);

insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '555 Kedzie Lane', 79, 36404);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '43560 Warrior Hill', 94, 70908);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '4684 Stephen Center', 94, 71656);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '7 Schmedeman Terrace', 36, 52150);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '6 Main Drive', 7, 41119);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '6034 Bobwhite Circle', 79, 54492);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ternopilska', '71949 Northwestern Center', 79, 61269);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Sumska', '4116 Maywood Place', 57, 76221);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '266 Waubesa Terrace', 95, 19170);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ternopilska', '7 Harbort Road', 41, 97645);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '2659 Sugar Crossing', 53, 79963);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '7330 Hintze Point', 46, 63476);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('', '16 Starling Pass', 81, 98074);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Chernivetska', '20 Barby Lane', 61, 25198);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('', '56198 Dapin Street', 95, 16964);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Chernivetska', '94 Melvin Point', 70, 65081);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '808 Pennsylvania Road', 65, 39760);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '8212 Hoard Drive', 95, 35174);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Chernivetska', '802 Hollow Ridge Place', 33, 77363);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '4 Thierer Parkway', 10, 26677);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '5872 Division Alley', 96, 96776);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '1909 5th Avenue', 46, 19257);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '60 Grim Way', 24, 83877);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '562 Fairview Junction', 16, 52257);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '7 Londonderry Crossing', 96, 58475);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('', '5904 Pennsylvania Plaza', 67, 88902);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Sumska', '4 Fordem Park', 80, 56886);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '73971 Manley Alley', 15, 95250);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '80246 Westend Plaza', 60, 34763);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '87 Hallows Road', 95, 64067);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '6 Westport Trail', 24, 46173);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ternopilska', '1 Hayes Circle', 99, 16685);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '60779 Nobel Plaza', 99, 28363);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '8 Hintze Avenue', 8, 37408);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ternopilska', '7 Melvin Park', 15, 49988);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Chernivetska', '813 Dahle Terrace', 13, 43981);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '04 Eggendart Center', 8, 88912);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '2 Hollow Ridge Hill', 75, 11147);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '5342 East Alley', 97, 81809);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Kirovogradska', '459 Weeping Birch Center', 59, 57129);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Chernivetska', '005 Dawn Circle', 72, 40082);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Chernivetska', '397 Blackbird Park', 1, 10738);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '3591 Sommers Pass', 55, 49092);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('', '163 Larry Parkway', 86, 49108);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '419 Chive Lane', 9, 53490);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ternopilska', '350 Delaware Parkway', 44, 72815);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '68 Bartillon Place', 89, 98966);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '07 Delaware Place', 33, 19040);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '02 Buell Alley', 74, 39546);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '479 Prairie Rose Hill', 54, 44296);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('', '249 Sunnyside Park', 80, 71754);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '3 Muir Drive', 50, 15140);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ternopilska', '35 Bartelt Street', 4, 73245);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '6745 Eastlawn Circle', 80, 53551);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Sumska', '4 Corscot Street', 74, 93885);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '6140 Arrowood Park', 88, 71801);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '3 Merchant Plaza', 18, 13677);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Sumska', '4805 Express Point', 62, 66769);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '86 Chinook Parkway', 42, 63538);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('', '61749 Upham Trail', 94, 52795);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '5458 Buell Park', 87, 56858);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '0 Hollow Ridge Street', 100, 48661);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Kirovogradska', '23 Kensington Lane', 21, 76863);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ternopilska', '09 Corscot Drive', 10, 16658);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('', '2 Tennessee Center', 77, 36844);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Kirovogradska', '41 Lotheville Center', 98, 67413);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '40159 Hollow Ridge Road', 58, 40937);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '5 Algoma Avenue', 36, 88526);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '98483 Leroy Court', 80, 25425);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '3 Sunfield Parkway', 20, 59068);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Sumska', '0763 Forster Junction', 66, 90042);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '0008 Eastlawn Parkway', 43, 34252);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '59 Crescent Oaks Trail', 35, 86656);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '55371 Stephen Alley', 10, 99267);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '4 Logan Alley', 24, 35083);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '2 Chinook Alley', 25, 81485);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Kirovogradska', '190 Walton Point', 60, 73779);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '24832 7th Way', 86, 62932);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ternopilska', '67471 Caliangt Plaza', 30, 52142);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '911 Michigan Avenue', 13, 31692);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '2843 Bultman Avenue', 31, 72655);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '08834 Corry Street', 62, 71330);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Chernivetska', '80817 Killdeer Trail', 39, 48287);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Jitomirska', '918 Meadow Valley Circle', 47, 75062);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Chernivetska', '8 Hoard Trail', 97, 62477);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '5444 Tennessee Trail', 9, 49129);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '8 Summit Way', 82, 67876);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Kirovogradska', '05792 Fuller Junction', 58, 76282);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '53857 Johnson Way', 6, 53733);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Zaporizska', '035 Sunfield Terrace', 4, 75788);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Kirovogradska', '94090 Dahle Avenue', 40, 30359);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Kirovogradska', '02922 Fremont Junction', 64, 15055);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '4 Graedel Road', 58, 35917);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Ujgorodska', '699 Grim Parkway', 75, 97720);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '5 Green Hill', 50, 57706);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Lvivska', '64553 Spohn Alley', 68, 58653);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Sumska', '844 Basil Lane', 80, 79821);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Kirovogradska', '8 Dahle Pass', 45, 37978);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Rivenska', '3 Sutteridge Drive', 58, 84560);
insert into [IvanovCollection].[Stations] ([Region], [Address], [ManagerId], [SalesTarget]) values ('Dniprovska', '2368 Lien Way', 47, 68841);

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

CREATE INDEX ix_employees_stations
ON [IvanovCollection].[Employees](StationId);

CREATE INDEX ix_employees_persons
ON [IvanovCollection].[Employees](PersonId);

CREATE INDEX ix_employees_employees
ON [IvanovCollection].[Employees](ManagerId);

insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Chemical Engineer', '2011-01-20 06:37:14', 95, 39, 46);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Civil Engineer', '2015-05-29 17:57:00', 3, 24, 19);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Data Coordiator', '2012-01-05 12:46:56', 43, 91, 55);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('VP Product Management', '2019-06-09 11:18:30', 76, 75, 75);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Paralegal', '2011-08-27 13:25:02', 95, 59, 43);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Graphic Designer', '2012-04-30 06:02:03', 47, 79, 42);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Systems Administrator II', '2017-10-20 21:37:44', 69, 55, 45);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Information Systems Manager', '2014-05-16 16:50:21', 44, 68, 57);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Internal Auditor', '2018-09-24 21:01:07', 82, 24, 52);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Chemical Engineer', '2015-02-04 07:18:53', 82, 50, 85);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Health Coach III', '2014-01-16 06:33:14', 35, 33, 3);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Account Executive', '2017-05-14 18:59:12', 72, 39, 25);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Junior Executive', '2011-01-27 07:05:56', 67, 40, 43);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Payment Adjustment Coordinator', '2017-01-10 19:27:29', 75, 100, 44);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Environmental Specialist', '2017-02-25 21:39:34', 6, 67, 98);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Senior Quality Engineer', '2014-03-23 17:02:58', 70, 40, 46);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Statistician II', '2017-08-30 02:53:49', 41, 84, 59);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Administrative Assistant III', '2014-11-09 00:48:55', 37, 29, 88);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Civil Engineer', '2017-11-18 00:10:49', 98, 48, 80);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Physical Therapy Assistant', '2020-12-11 22:25:04', 47, 42, 60);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Engineer III', '2017-06-30 01:38:41', 57, 67, 97);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('GIS Technical Architect', '2012-12-28 22:40:32', 67, 2, 63);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('VP Accounting', '2019-02-28 02:07:21', 43, 74, 44);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Paralegal', '2012-08-25 16:44:14', 80, 65, 72);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Assistant Media Planner', '2016-08-03 04:04:03', 42, 49, 80);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Safety Technician III', '2018-05-16 13:48:13', 77, 20, 26);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Speech Pathologist', '2011-12-24 16:13:41', 4, 15, 9);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Senior Developer', '2014-01-26 11:53:44', 87, 47, 95);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Senior Editor', '2016-07-27 10:35:28', 76, 61, 86);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Design Engineer', '2010-11-16 19:14:13', 69, 62, 24);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Business Systems Development Analyst', '2017-05-14 18:57:37', 35, 77, 89);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Assistant Professor', '2018-03-23 06:43:51', 93, 92, 88);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Design Engineer', '2021-03-11 15:49:24', 44, 15, 39);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Teacher', '2012-04-01 02:37:53', 72, 45, 93);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Systems Administrator I', '2015-10-17 04:10:45', 89, 83, 52);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Design Engineer', '2011-09-13 09:38:37', 57, 98, 88);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Registered Nurse', '2015-06-01 01:33:41', 97, 53, 86);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Business Systems Development Analyst', '2011-03-05 19:07:21', 80, 69, 52);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Account Executive', '2013-09-11 14:03:48', 95, 74, 42);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Senior Cost Accountant', '2019-11-06 07:08:45', 89, 58, 54);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Paralegal', '2014-05-12 15:53:02', 2, 48, 34);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Sales Representative', '2012-06-11 17:24:20', 32, 51, 37);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Health Coach III', '2014-05-02 19:28:26', 71, 8, 19);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Account Executive', '2019-07-24 23:52:54', 80, 83, 92);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Staff Scientist', '2020-11-16 00:40:28', 41, 77, 23);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Engineer IV', '2013-10-07 10:09:59', 86, 67, 32);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Web Developer III', '2015-05-21 20:49:41', 40, 41, 59);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Business Systems Development Analyst', '2020-06-17 10:53:52', 53, 64, 72);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Occupational Therapist', '2015-11-03 19:03:27', 23, 71, 23);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Structural Engineer', '2017-08-22 12:47:05', 84, 11, 50);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Compensation Analyst', '2018-09-02 20:59:40', 70, 6, 56);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Database Administrator I', '2014-02-12 18:17:29', 19, 86, 34);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Sales Associate', '2013-12-26 04:10:42', 66, 83, 76);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Software Engineer III', '2020-08-31 07:15:46', 23, 34, 42);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Chemical Engineer', '2020-01-12 08:44:16', 54, 55, 33);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Assistant Media Planner', '2021-09-28 11:29:04', 85, 55, 49);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Nurse Practicioner', '2018-07-03 22:09:18', 83, 100, 72);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Structural Analysis Engineer', '2018-07-13 11:41:38', 29, 59, 9);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Dental Hygienist', '2012-07-13 08:46:22', 17, 52, 21);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Assistant Professor', '2018-04-05 15:29:18', 37, 75, 96);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Research Nurse', '2018-09-14 05:09:36', 37, 87, 39);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Staff Accountant I', '2012-08-09 23:33:25', 35, 2, 31);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Financial Analyst', '2019-04-05 20:36:11', 12, 25, 20);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Office Assistant IV', '2014-05-06 00:42:53', 81, 50, 79);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Web Designer I', '2017-09-06 03:10:55', 88, 84, 99);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Pharmacist', '2015-06-03 03:04:59', 40, 29, 7);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Tax Accountant', '2016-09-23 04:09:16', 43, 90, 51);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Geologist I', '2019-12-10 05:31:21', 47, 18, 43);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Research Nurse', '2017-09-14 23:27:58', 82, 56, 60);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Librarian', '2012-05-03 06:49:48', 91, 35, 21);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Compensation Analyst', '2011-10-10 12:16:01', 45, 14, 74);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Accountant IV', '2011-08-15 06:23:31', 66, 82, 44);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Engineer II', '2011-04-09 04:39:00', 15, 60, 100);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Food Chemist', '2014-04-12 03:29:20', 17, 36, 20);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Chief Design Engineer', '2021-10-05 05:22:45', 15, 50, 38);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Graphic Designer', '2016-05-31 22:16:00', 53, 93, 5);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('General Manager', '2020-04-22 09:24:35', 66, 52, 47);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Administrative Assistant I', '2011-02-06 13:48:26', 82, 16, 82);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Environmental Tech', '2013-03-23 05:30:29', 37, 42, 3);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Food Chemist', '2017-08-03 03:16:12', 51, 92, 97);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Safety Technician IV', '2017-10-01 23:29:24', 50, 16, 84);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Information Systems Manager', '2011-05-15 22:49:28', 98, 66, 47);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Chief Design Engineer', '2011-03-21 15:47:00', 20, 57, 39);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Graphic Designer', '2017-03-25 14:37:52', 4, 14, 16);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Registered Nurse', '2020-12-27 06:27:19', 54, 19, 86);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Senior Sales Associate', '2019-04-17 18:19:09', 5, 90, 8);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Programmer Analyst III', '2014-01-06 13:02:30', 4, 53, 95);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Analog Circuit Design manager', '2013-05-02 10:11:37', 46, 83, 54);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Nurse', '2017-08-22 21:19:10', 24, 91, 24);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Information Systems Manager', '2014-03-14 02:50:57', 18, 12, 21);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Recruiting Manager', '2015-09-06 04:25:29', 73, 48, 5);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Desktop Support Technician', '2016-04-29 08:02:09', 22, 95, 43);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Automation Specialist I', '2020-02-06 06:41:21', 34, 82, 55);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Web Developer I', '2016-04-22 10:36:04', 28, 7, 74);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Web Designer I', '2017-04-13 08:27:50', 88, 26, 41);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('VP Quality Control', '2011-09-03 14:20:57', 43, 4, 25);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Health Coach IV', '2021-03-05 01:53:30', 49, 14, 78);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('VP Quality Control', '2015-08-15 09:05:40', 1, 95, 1);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Programmer IV', '2014-04-15 23:42:59', 64, 51, 63);
insert into [IvanovCollection].[Employees] ([JobTitle], [HireDate], [StationId], [PersonId], [ManagerId]) values ('Financial Analyst', '2016-12-23 10:22:19', 81, 51, 40);

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

CREATE INDEX ix_clients_employees
ON [IvanovCollection].[Clients](ManagerId);

CREATE INDEX ix_clients_persons
ON [IvanovCollection].[Clients](PersonId);

insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2001-07-02 01:08:53', 87, 'ACTIVE', '2170559205', 2);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2012-12-03 01:27:33', 11, 'INACTIVE', '1944551050', 100);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2002-01-28 06:46:07', 14, 'INACTIVE', '9821834396', 23);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2010-08-28 02:26:54', 9, 'ACTIVE', '0028186567', 88);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2019-06-13 15:10:48', 75, 'INACTIVE', '2375343506', 25);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2019-01-17 05:19:49', 30, 'ACTIVE', '8377301741', 69);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2013-01-27 02:37:05', 1, 'ACTIVE', '8694933152', 94);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2004-06-03 15:52:39', 87, 'INACTIVE', '0153478268', 61);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2015-09-12 18:06:47', 90, 'INACTIVE', '8813912897', 53);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2009-01-25 05:16:05', 77, 'INACTIVE', '6473830979', 83);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2006-03-21 18:43:06', 48, 'ACTIVE', '1818435101', 37);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2008-04-18 10:49:12', 43, 'ACTIVE', '6505273476', 71);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2004-02-15 12:44:54', 88, 'ACTIVE', '0591447827', 12);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2015-06-16 12:31:43', 6, 'INACTIVE', '2697941479', 11);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2017-05-24 11:58:32', 38, 'INACTIVE', '3787979751', 23);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2001-03-08 06:36:54', 14, 'INACTIVE', '0370018400', 35);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2013-11-12 10:59:55', 45, 'ACTIVE', '0483681989', 67);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2001-04-01 08:22:21', 98, 'INACTIVE', '2720579114', 25);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2015-01-15 04:05:18', 99, 'INACTIVE', '7527707283', 33);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2013-06-16 05:27:16', 13, 'ACTIVE', '3040588664', 3);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2004-05-05 09:38:03', 98, 'INACTIVE', '3391416378', 80);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2003-02-26 17:01:24', 16, 'ACTIVE', '4368564626', 46);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2006-12-15 07:57:02', 7, 'ACTIVE', '9265488476', 62);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2008-08-09 01:45:17', 13, 'ACTIVE', '7475065286', 89);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2013-06-26 21:21:18', 43, 'INACTIVE', '9508174447', 70);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2013-05-08 05:45:11', 84, 'ACTIVE', '3075186368', 94);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2005-04-11 23:37:20', 50, 'INACTIVE', '2042415170', 93);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2007-04-10 17:14:50', 45, 'INACTIVE', '9628846671', 61);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2005-01-10 06:03:05', 70, 'ACTIVE', '4618543582', 10);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2007-09-30 18:01:44', 13, 'ACTIVE', '5999923220', 63);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2004-10-02 01:04:03', 38, 'ACTIVE', '1153008785', 39);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2020-02-22 16:04:44', 31, 'INACTIVE', '5221234025', 56);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2013-11-03 02:11:18', 63, 'INACTIVE', '9531196001', 35);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2004-02-06 07:01:10', 8, 'INACTIVE', '6252117471', 27);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2003-08-31 09:26:29', 83, 'ACTIVE', '9248965962', 65);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2015-03-20 07:58:44', 4, 'INACTIVE', '5730123795', 42);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2008-11-08 05:23:33', 43, 'INACTIVE', '2691254186', 96);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2015-02-09 18:04:06', 21, 'INACTIVE', '6280002195', 47);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2010-04-24 01:54:53', 64, 'INACTIVE', '5358316817', 23);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2019-04-04 07:29:17', 39, 'ACTIVE', '3952759090', 89);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2006-03-31 17:06:13', 71, 'INACTIVE', '9333420630', 5);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2008-11-17 05:49:33', 97, 'INACTIVE', '4493034343', 28);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2017-11-11 05:10:00', 37, 'ACTIVE', '4445027499', 98);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2004-07-13 22:10:08', 99, 'INACTIVE', '1082687634', 19);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2021-02-11 17:33:10', 12, 'INACTIVE', '0973022337', 58);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2017-08-21 08:53:25', 97, 'ACTIVE', '3685996207', 20);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2010-07-23 03:33:56', 71, 'INACTIVE', '2075194734', 63);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2006-03-08 08:28:24', 29, 'INACTIVE', '6526400906', 28);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2013-08-30 16:36:09', 40, 'ACTIVE', '6334497154', 87);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2013-12-03 00:30:45', 65, 'INACTIVE', '5261899028', 44);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2015-08-16 16:20:26', 29, 'ACTIVE', '4722835055', 5);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2011-10-02 13:49:16', 31, 'ACTIVE', '7484883654', 85);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2004-08-26 11:42:50', 29, 'INACTIVE', '2234660866', 48);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2013-01-03 11:50:48', 27, 'ACTIVE', '6844684193', 93);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2021-05-08 14:18:06', 93, 'INACTIVE', '7101225691', 49);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2007-11-10 01:54:29', 27, 'ACTIVE', '5858707548', 40);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2000-12-25 10:48:35', 70, 'ACTIVE', '4911924209', 53);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2005-12-11 19:27:48', 24, 'INACTIVE', '4349727647', 84);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2005-02-01 18:44:28', 71, 'ACTIVE', '6759936248', 38);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2015-03-26 18:54:22', 38, 'ACTIVE', '3918838242', 71);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2003-08-17 18:17:28', 72, 'ACTIVE', '1436911303', 72);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2019-02-16 00:41:16', 80, 'INACTIVE', '2068491532', 23);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2014-09-30 17:30:17', 82, 'INACTIVE', '4896089189', 40);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2021-04-16 16:22:39', 51, 'ACTIVE', '8184739222', 22);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2004-01-07 22:02:05', 49, 'INACTIVE', '0614968321', 77);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2011-01-30 00:39:38', 77, 'INACTIVE', '5659567762', 4);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2017-05-02 04:27:25', 31, 'INACTIVE', '9693619102', 99);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2006-07-06 22:14:24', 3, 'ACTIVE', '0684021218', 34);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2002-03-01 14:40:37', 70, 'ACTIVE', '3821166177', 94);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2001-02-02 07:33:15', 97, 'INACTIVE', '7493538514', 25);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2020-12-16 18:08:01', 79, 'ACTIVE', '0185165141', 63);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2007-04-21 13:27:59', 82, 'INACTIVE', '8920484341', 17);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2016-11-16 05:41:52', 7, 'INACTIVE', '0851708595', 21);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2014-10-20 03:52:38', 69, 'ACTIVE', '2408523710', 29);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2008-10-01 18:55:18', 93, 'ACTIVE', '8454849939', 91);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2017-11-19 21:07:55', 46, 'ACTIVE', '8990778905', 60);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2015-08-08 13:35:52', 24, 'INACTIVE', '5443347268', 96);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2013-01-19 10:47:59', 87, 'INACTIVE', '6674914355', 43);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2017-08-09 01:36:52', 61, 'ACTIVE', '0544065409', 29);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2015-07-28 03:42:31', 11, 'INACTIVE', '1660214785', 90);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2004-07-08 12:58:08', 94, 'INACTIVE', '4465959192', 8);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2005-12-13 23:12:47', 43, 'INACTIVE', '3087864889', 28);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2018-05-29 07:46:12', 73, 'INACTIVE', '2645292682', 58);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2009-02-17 17:38:44', 80, 'ACTIVE', '1953479146', 14);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2001-09-03 23:48:17', 59, 'ACTIVE', '7741332473', 16);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2015-06-15 00:04:34', 27, 'ACTIVE', '8894244660', 60);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2015-09-07 16:30:28', 4, 'INACTIVE', '6336642380', 41);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2010-05-08 18:38:40', 18, 'ACTIVE', '3115147023', 26);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2012-02-10 13:16:19', 11, 'INACTIVE', '0693935553', 86);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2011-08-21 04:23:17', 59, 'ACTIVE', '2391763689', 30);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2001-06-28 13:08:00', 76, 'ACTIVE', '6404109123', 59);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('EMPLOYEE', '2010-01-03 19:16:18', 91, 'INACTIVE', '0596970226', 39);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('GOLD', '2005-02-10 20:05:51', 51, 'ACTIVE', '7163780753', 40);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2018-11-30 00:04:19', 22, 'INACTIVE', '6381470372', 8);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2004-01-16 10:01:47', 36, 'INACTIVE', '2840680017', 84);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2005-01-05 02:28:01', 26, 'ACTIVE', '8460399397', 33);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('STANDARD', '2009-11-19 21:15:00', 20, 'INACTIVE', '3841452841', 17);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('VIP', '2011-10-21 09:11:15', 13, 'INACTIVE', '9265417323', 19);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('SPECIAL', '2021-06-28 10:39:04', 84, 'INACTIVE', '7320506181', 39);
insert into [IvanovCollection].[Clients] ([ServiceType], [RegDate], [ManagerId], [Status], [TaxId], [PersonId]) values ('PLATINUM', '2012-03-03 12:06:32', 1, 'ACTIVE', '0489635385', 55);

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

CREATE INDEX ix_phones_persons
ON [IvanovCollection].[Phones](PersonId);

CREATE INDEX ix_phones_phone_number
ON [IvanovCollection].[Phones](Number);

insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8848113261', 'HOME', 56);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5183189336', 'HOME', 77);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7551804789', 'HOME', 98);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5153468929', 'WORK', 39);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2348705549', 'HOME', 96);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2205334833', 'HOME', 42);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2066315386', 'HOME', 78);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4223105767', 'HOME', 59);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2008364919', 'WORK', 78);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1871654609', 'HOME', 75);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9828715381', 'HOME', 51);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4911448093', 'HOME', 8);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7466735731', 'HOME', 67);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4594125055', 'WORK', 8);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1569020033', 'HOME', 72);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8393827541', 'WORK', 17);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8612573359', 'HOME', 31);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6126047903', 'WORK', 93);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7983767610', 'HOME', 36);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6858109486', 'WORK', 27);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1942161999', 'WORK', 88);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('3396073368', 'WORK', 7);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4946496486', 'HOME', 22);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9551744263', 'WORK', 32);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6137356324', 'WORK', 2);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2571472518', 'HOME', 1);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6381848567', 'WORK', 9);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8965850035', 'WORK', 44);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('3375804215', 'HOME', 100);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5662237826', 'HOME', 32);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5212194427', 'HOME', 15);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4523857872', 'WORK', 75);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1047085811', 'HOME', 53);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4067195762', 'HOME', 19);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9178407614', 'WORK', 91);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1785143983', 'WORK', 81);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1259173770', 'WORK', 82);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('3899895488', 'HOME', 9);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('3495270436', 'HOME', 96);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('3889538321', 'WORK', 33);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4178983765', 'WORK', 49);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2041261622', 'HOME', 70);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8011139633', 'WORK', 6);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9966523289', 'WORK', 37);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2708565810', 'HOME', 88);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2015337210', 'WORK', 99);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('3931587769', 'WORK', 27);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1167728210', 'HOME', 50);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1308862535', 'HOME', 81);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5893438179', 'WORK', 12);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7766149120', 'HOME', 81);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6239900221', 'HOME', 78);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2936616301', 'HOME', 46);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9243326770', 'HOME', 35);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5139240354', 'HOME', 62);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2904477296', 'WORK', 20);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9041354636', 'WORK', 67);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1124710969', 'WORK', 74);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1592401439', 'HOME', 85);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7599974653', 'WORK', 82);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9475885283', 'HOME', 93);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8711060115', 'WORK', 18);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7345095530', 'WORK', 4);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6771287026', 'HOME', 1);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4512916488', 'HOME', 33);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6869981875', 'HOME', 7);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9562262817', 'HOME', 56);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8866739205', 'WORK', 7);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1382963226', 'HOME', 66);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4138416520', 'WORK', 73);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7466399999', 'HOME', 39);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8526488448', 'HOME', 80);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8072795531', 'HOME', 21);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9377274322', 'HOME', 24);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6931436470', 'WORK', 42);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5338101031', 'HOME', 62);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2311954146', 'WORK', 48);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2228903055', 'HOME', 7);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6658060179', 'HOME', 3);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8063620481', 'WORK', 31);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9483326449', 'WORK', 64);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7401110330', 'WORK', 50);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2708207976', 'WORK', 30);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7111554406', 'WORK', 100);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1805901232', 'HOME', 8);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5795187231', 'HOME', 11);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('7811637197', 'WORK', 31);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5758837415', 'HOME', 84);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2402440219', 'HOME', 29);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('9879489772', 'HOME', 25);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8211825815', 'HOME', 45);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2332440922', 'WORK', 18);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8799616631', 'HOME', 58);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('4195860661', 'HOME', 55);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1605905139', 'WORK', 52);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('8353834343', 'WORK', 20);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('5248804520', 'WORK', 65);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('6778435153', 'HOME', 31);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('1744371531', 'WORK', 26);
insert into [IvanovCollection].[Phones] ([Number], [Type], [PersonId]) values ('2703067228', 'HOME', 49);

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

CREATE INDEX ix_emails_persons
ON [IvanovCollection].[Emails](PersonId);

CREATE INDEX ix_emails_email
ON [IvanovCollection].[Emails](Email);

insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('emarkie0@technorati.com', 'WORK', 77);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('lruter1@statcounter.com', 'WORK', 68);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cbasden2@microsoft.com', 'WORK', 90);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('gbendik3@youtu.be', 'WORK', 78);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('llydiatt4@telegraph.co.uk', 'WORK', 82);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('eivanenkov5@hao123.com', 'HOME', 66);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('mlazar6@cornell.edu', 'WORK', 34);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('scardow7@alibaba.com', 'HOME', 52);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('hcaltun8@loc.gov', 'HOME', 78);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('tcupper9@netlog.com', 'WORK', 63);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('uelpha@jigsy.com', 'HOME', 76);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('tsandb@vimeo.com', 'HOME', 5);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('ksoaresc@comsenz.com', 'WORK', 39);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('rbillind@tmall.com', 'WORK', 93);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('nsywelle@amazonaws.com', 'WORK', 86);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('erickertf@cdc.gov', 'HOME', 100);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('ggilbeartg@deviantart.com', 'HOME', 66);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('lsimmonh@npr.org', 'HOME', 99);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('kparleti@examiner.com', 'HOME', 68);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cpendallj@squarespace.com', 'WORK', 49);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('pskirlingk@mapy.cz', 'HOME', 21);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cbiaggionil@aol.com', 'HOME', 59);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('jrikelm@archive.org', 'WORK', 98);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('bpinckneyn@sitemeter.com', 'HOME', 15);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('aepileto@amazonaws.com', 'WORK', 83);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('bhartlyp@fotki.com', 'HOME', 10);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('tbroadeyq@nba.com', 'HOME', 21);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('hharwinr@sun.com', 'WORK', 87);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('gnapers@businessinsider.com', 'HOME', 16);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cshiret@smh.com.au', 'WORK', 65);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('apovlsenu@examiner.com', 'HOME', 58);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('csaulv@networksolutions.com', 'WORK', 3);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('ikardosstowew@pcworld.com', 'WORK', 24);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('bgerssamx@mashable.com', 'WORK', 66);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('nkoeppkey@archive.org', 'HOME', 82);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('fmurreyz@tuttocitta.it', 'HOME', 83);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('glaite10@soundcloud.com', 'HOME', 16);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('bsellens11@deliciousdays.com', 'HOME', 64);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('tsnipe12@usda.gov', 'HOME', 11);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('tcreasy13@omniture.com', 'WORK', 47);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('alyttle14@nymag.com', 'HOME', 5);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('scarrick15@blog.com', 'HOME', 13);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('averson16@usa.gov', 'WORK', 92);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('wbloxham17@ca.gov', 'HOME', 81);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('johms18@redcross.org', 'HOME', 91);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('hashelford19@biblegateway.com', 'HOME', 39);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('ffrizell1a@hubpages.com', 'HOME', 73);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('jraveau1b@merriam-webster.com', 'HOME', 38);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('lcoste1c@wufoo.com', 'HOME', 66);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('alongworth1d@bing.com', 'HOME', 52);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('opepperill1e@china.com.cn', 'HOME', 94);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cyukhnov1f@army.mil', 'HOME', 39);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('hstickells1g@indiatimes.com', 'HOME', 89);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('mwyche1h@slashdot.org', 'HOME', 94);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('emcilvaney1i@berkeley.edu', 'HOME', 8);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('gforsdyke1j@biglobe.ne.jp', 'HOME', 5);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cpinson1k@smh.com.au', 'WORK', 50);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('stabert1l@1688.com', 'HOME', 66);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('tsteven1m@yahoo.co.jp', 'WORK', 1);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('tkopp1n@boston.com', 'HOME', 36);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('vdoyley1o@unblog.fr', 'WORK', 72);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('nlippett1p@blinklist.com', 'HOME', 52);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cshaddock1q@umich.edu', 'HOME', 58);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('sgayden1r@fastcompany.com', 'WORK', 4);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('jurvoy1s@forbes.com', 'HOME', 39);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('jchampneys1t@hexun.com', 'WORK', 10);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('bgodson1u@addthis.com', 'HOME', 63);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('mruddock1v@apache.org', 'HOME', 67);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('gmercik1w@purevolume.com', 'HOME', 15);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('aboeter1x@earthlink.net', 'WORK', 18);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('sfogden1y@guardian.co.uk', 'HOME', 90);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('aferryman1z@ebay.com', 'HOME', 96);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('ajedrzejczyk20@netvibes.com', 'WORK', 63);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('pcrudge21@youtube.com', 'HOME', 41);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('abonnette22@mapy.cz', 'WORK', 47);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('gmacpeake23@prnewswire.com', 'WORK', 7);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('ewebster24@gnu.org', 'HOME', 58);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('vbeedle25@mail.ru', 'HOME', 33);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('adilkes26@mail.ru', 'HOME', 46);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('apostan27@virginia.edu', 'HOME', 7);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('lalsobrook28@cbc.ca', 'WORK', 18);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cwhaley29@deviantart.com', 'HOME', 98);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('amackstead2a@soundcloud.com', 'HOME', 17);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('lmeighan2b@rakuten.co.jp', 'WORK', 85);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('bmccardle2c@marketwatch.com', 'WORK', 77);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('drallinshaw2d@ucsd.edu', 'WORK', 70);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('lmulqueeny2e@cbc.ca', 'WORK', 50);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('dvickery2f@bbc.co.uk', 'HOME', 75);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('bchern2g@ezinearticles.com', 'HOME', 46);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('ebrownbill2h@google.ca', 'HOME', 44);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('tmccomas2i@fda.gov', 'WORK', 55);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('lallcock2j@icq.com', 'HOME', 75);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('cmeran2k@rediff.com', 'HOME', 53);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('dricardon2l@walmart.com', 'WORK', 92);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('vhartwell2m@toplist.cz', 'WORK', 14);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('ccawdron2n@comsenz.com', 'HOME', 92);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('wparadise2o@abc.net.au', 'WORK', 17);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('barens2p@linkedin.com', 'HOME', 78);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('imatejka2q@wunderground.com', 'WORK', 24);
insert into [IvanovCollection].[Emails] ([Email], [Type], [PersonId]) values ('fpfeffel2r@msu.edu', 'HOME', 86);

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

insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 1, 89.63, 5);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 2, 20.62, 40);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 3, 66.54, 6);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 4, 44.31, 97);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 5, 96.89, 20);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 6, 47.2, 30);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 7, 27.4, 100);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 8, 95.96, 5);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 9, 92.42, 69);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (1, 10, 35.36, 48);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 1, 82.4, 36);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 2, 80.95, 39);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 3, 80.42, 22);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 4, 97.55, 65);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 5, 45.21, 78);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 6, 51.35, 74);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 7, 84.88, 89);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 8, 73.73, 77);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 9, 8.6, 34);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (2, 10, 52.01, 87);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 1, 5.6, 55);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 2, 12.03, 28);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 3, 84.18, 27);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 4, 6.71, 14);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 5, 30.13, 52);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 6, 11.01, 33);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 7, 33.45, 90);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 8, 23.5, 33);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 9, 9.52, 83);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (3, 10, 38.59, 75);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 1, 38.49, 26);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 2, 19.4, 30);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 3, 83.88, 54);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 4, 57.09, 24);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 5, 71.22, 37);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 6, 55.37, 56);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 7, 76.44, 86);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 8, 31.5, 32);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 9, 27.38, 32);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (4, 10, 80.88, 74);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 1, 82.07, 34);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 2, 11.05, 100);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 3, 35.53, 22);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 4, 5.64, 25);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 5, 12.23, 38);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 6, 84.38, 81);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 7, 5.93, 65);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 8, 26.78, 10);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 9, 14.72, 23);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (5, 10, 45.87, 33);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 1, 66.81, 78);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 2, 61.77, 58);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 3, 11.72, 47);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 4, 15.5, 18);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 5, 40.39, 89);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 6, 64.73, 77);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 7, 54.6, 46);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 8, 80.71, 48);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 9, 28.04, 69);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (6, 10, 48.33, 11);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 1, 68.29, 20);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 2, 35.25, 33);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 3, 96.25, 98);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 4, 49.94, 95);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 5, 42.54, 52);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 6, 32.34, 61);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 7, 81.69, 45);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 8, 91.88, 87);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 9, 44.91, 15);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (7, 10, 88.35, 64);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 1, 21.96, 78);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 2, 64.42, 97);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 3, 84.24, 75);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 4, 72.91, 42);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 5, 45.83, 56);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 6, 97.67, 89);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 7, 6.58, 46);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 8, 35.01, 11);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 9, 81.12, 39);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (8, 10, 70.23, 91);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 1, 41.41, 74);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 2, 54.74, 3);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 3, 85.7, 74);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 4, 10.75, 20);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 5, 42.36, 38);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 6, 92.75, 14);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 7, 97.17, 55);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 8, 32.96, 86);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 9, 91.75, 35);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (9, 10, 49.49, 93);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 1, 4.77, 48);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 2, 84.56, 70);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 3, 52.55, 33);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 4, 48.64, 15);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 5, 40.54, 61);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 6, 61.36, 71);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 7, 44.17, 29);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 8, 67.54, 11);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 9, 37.96, 62);
insert into [IvanovCollection].[Products] ([ProductId], [MakerId], [Price], [Qty]) values (10, 10, 37.53, 11);

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

CREATE INDEX ix_purchases_stations
ON [IvanovCollection].[Purchases](StationId);

CREATE INDEX ix_purchases_employees
ON [IvanovCollection].[Purchases](SellerId);

CREATE INDEX ix_purchases_card
ON [IvanovCollection].[Purchases](CardNumber);

insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602250547199168', 88, 63, '2017-08-11 14:14:38');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602232518384243', 21, 73, '2016-07-02 12:03:55');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610344958897145', 2, 30, '2020-04-17 03:45:10');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602259948411304', 46, 85, '2015-01-07 19:05:52');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610137652609810', 4, 8, '2015-01-24 20:48:52');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602234746319579', 92, 23, '2017-05-10 11:02:33');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602244298425732', 45, 81, '2020-06-28 14:30:30');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602243978051701', 39, 46, '2018-06-14 06:19:58');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602210036727804', 1, 43, '2012-03-15 06:43:00');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602227844556803', 91, 13, '2016-02-23 09:14:45');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602236697598796', 1, 76, '2017-12-11 00:01:51');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602249015399326', 94, 51, '2015-03-19 12:05:37');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602231408717603', 70, 10, '2014-11-11 02:45:47');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602232015871585', 3, 95, '2020-08-02 08:03:47');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602215406571096', 72, 6, '2019-09-02 11:48:31');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602223833592701', 54, 63, '2017-12-14 10:32:00');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602258387861466', 90, 60, '2014-10-13 14:41:02');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602242496594218', 25, 70, '2017-02-17 14:32:05');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602254159855570', 66, 5, '2020-04-22 09:34:22');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602242001507218', 7, 87, '2016-10-11 23:14:03');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602212015647714', 1, 88, '2015-04-10 01:41:35');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602225211660323', 72, 12, '2011-04-22 22:02:45');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602225671224206', 23, 39, '2019-12-27 21:19:54');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602217848828779', 11, 49, '2015-11-30 21:35:42');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602232897488045', 95, 5, '2019-06-25 04:24:18');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602220397310827', 12, 34, '2017-09-02 17:16:57');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602239825618163', 97, 9, '2011-07-15 15:01:21');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602218812447968', 18, 42, '2015-12-09 22:34:45');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602254576125326', 66, 11, '2014-11-28 14:39:31');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602253636026086', 5, 28, '2017-07-31 01:28:32');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602222937803725', 15, 84, '2017-01-31 02:57:13');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602247521762102', 79, 84, '2014-09-14 02:01:59');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602226485904710', 20, 42, '2018-10-27 01:43:45');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610716186806008', 12, 39, '2014-05-25 10:07:33');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602252565198403', 81, 95, '2016-08-11 15:12:07');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602225147772978', 98, 26, '2020-12-07 16:47:44');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602218749394580', 61, 45, '2021-07-24 11:42:14');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602224049155861', 55, 43, '2017-05-08 00:47:00');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602212490194471', 36, 89, '2017-10-28 16:26:38');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610180058973372', 68, 39, '2019-06-26 10:40:35');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602240804984998', 95, 24, '2019-07-05 05:35:48');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610441611029692', 16, 90, '2016-03-26 20:53:49');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602211420857405', 58, 55, '2017-09-25 12:27:04');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610324103955675', 31, 23, '2021-04-25 06:42:53');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602242949100415', 59, 36, '2014-10-15 23:44:21');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602223708647705', 73, 23, '2014-01-31 00:28:37');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602221492797504', 20, 52, '2016-02-22 02:56:37');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602221389550834', 56, 68, '2014-03-20 23:17:51');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602239131864154', 78, 99, '2019-11-23 22:16:21');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602241425351740', 94, 93, '2014-02-24 02:00:35');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610022627744779', 46, 58, '2015-01-01 22:02:44');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602244289336856', 37, 97, '2020-06-29 08:07:01');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602251528402670', 40, 63, '2017-02-09 15:36:09');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602211168305625', 60, 38, '2013-01-10 16:29:26');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602210192312136', 31, 54, '2020-12-08 00:45:26');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602234493697078', 26, 85, '2012-08-25 22:04:54');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602236350150356', 50, 26, '2021-03-14 14:12:49');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602241091941089', 33, 47, '2019-05-04 13:42:25');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602254280633466', 10, 42, '2021-05-09 19:52:46');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602230079997536', 51, 66, '2021-01-27 02:39:07');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610600029331459', 17, 24, '2011-05-06 22:20:19');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610987873496631', 63, 69, '2012-06-18 04:11:34');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602251024629552', 79, 31, '2015-06-10 23:48:40');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602218112585202', 49, 47, '2011-04-05 13:57:07');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602247032713982', 67, 7, '2019-03-31 04:21:29');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602222342482370', 39, 58, '2011-10-17 12:56:00');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602219612347564', 81, 7, '2014-08-14 05:02:44');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610857634860476', 83, 97, '2019-07-19 23:20:51');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610444173855504', 31, 51, '2019-07-23 00:39:51');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602249000831150', 71, 62, '2020-07-10 22:12:09');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602257618697509', 83, 21, '2021-05-25 09:19:03');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602251464361005', 87, 47, '2019-10-02 04:01:20');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602253665665986', 78, 24, '2012-09-20 16:58:49');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602251835317470', 87, 31, '2020-10-08 18:22:14');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602240705184847', 12, 39, '2013-12-10 17:45:16');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602227239142714', 97, 13, '2017-10-25 18:12:13');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602221084550436', 15, 71, '2016-06-08 22:43:08');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602246158125583', 89, 89, '2020-08-23 08:27:18');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610110870459508', 60, 58, '2018-02-22 01:14:17');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610124261700826', 98, 6, '2015-11-16 03:06:18');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602238364204864', 65, 27, '2021-09-01 08:15:59');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602228732020613', 79, 71, '2016-12-18 14:23:55');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602211883899225', 90, 87, '2015-07-03 15:23:56');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610123631297075', 26, 39, '2010-12-29 04:55:03');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602252974122812', 44, 56, '2020-08-29 17:55:51');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602228113310773', 84, 40, '2020-10-11 20:49:25');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602257921728033', 55, 15, '2018-11-20 06:17:57');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602244793656716', 1, 80, '2015-12-17 21:41:49');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610407404229443', 28, 35, '2015-05-26 00:44:01');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602210664968001', 42, 5, '2010-11-25 21:50:45');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602248791843572', 26, 16, '2021-03-03 23:09:28');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602246157228966', 1, 86, '2013-02-18 02:29:49');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602227743917833', 96, 72, '2020-01-13 05:36:54');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602219883581099', 94, 51, '2015-08-23 12:24:13');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602256667243017', 87, 92, '2013-06-27 04:22:00');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5610343448348867', 31, 51, '2016-09-03 13:37:08');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602258602643087', 8, 62, '2012-10-08 21:25:11');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602219302426488', 83, 97, '2014-07-24 12:16:07');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602228555205382', 41, 77, '2019-08-17 04:22:43');
insert into [IvanovCollection].[Purchases] ([CardNumber], [StationId], [SellerId], [OrderDate]) values ('5602230397127329', 52, 52, '2021-02-17 14:40:07');

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

CREATE INDEX ix_purchaseDetails_products
ON [IvanovCollection].[PurchaseDetails](ProductId, MakerId);

insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (18, 1, 1, 4, 49, 1569.27);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (57, 2, 8, 1, 15, 2980.63);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (9, 3, 4, 3, 73, 5435.64);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (65, 4, 10, 2, 64, 4487.32);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (83, 5, 9, 4, 14, 8247.25);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (10, 6, 3, 7, 57, 4810.96);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (85, 7, 3, 8, 54, 1948.95);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (43, 8, 7, 7, 72, 3089.1);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (82, 9, 4, 8, 18, 14535.27);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (20, 10, 2, 2, 47, 13103.79);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (80, 11, 10, 10, 94, 10504.08);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (71, 12, 1, 1, 11, 7153.79);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (20, 13, 4, 10, 25, 6990.55);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (15, 14, 1, 7, 71, 10227.59);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (5, 15, 2, 8, 52, 2278.36);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (47, 16, 3, 8, 39, 13865.52);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (26, 17, 1, 1, 52, 6277.13);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (69, 18, 1, 8, 93, 520.7);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (58, 19, 1, 3, 60, 782.88);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (4, 20, 6, 8, 58, 14847.55);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (65, 21, 8, 5, 38, 6049.61);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (66, 22, 9, 10, 17, 5045.72);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (77, 23, 10, 10, 8, 5257.26);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (76, 24, 7, 10, 35, 7319.74);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (22, 25, 1, 4, 51, 5710.83);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (40, 26, 6, 8, 84, 3027.01);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (13, 27, 5, 9, 84, 6349.92);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (12, 28, 8, 3, 35, 3458.93);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (52, 29, 8, 7, 73, 12712.66);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (60, 30, 6, 3, 64, 9303.31);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (85, 31, 5, 6, 92, 6331.64);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (19, 32, 5, 10, 48, 12816.72);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (6, 33, 2, 4, 95, 2712.28);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (31, 34, 3, 9, 75, 1930.67);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (74, 35, 4, 6, 24, 12794.09);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (51, 36, 7, 2, 73, 1358.81);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (59, 37, 1, 7, 65, 12846.55);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (13, 38, 4, 5, 65, 7579.87);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (3, 39, 2, 2, 44, 8413.53);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (9, 40, 6, 8, 77, 4757.8);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (11, 41, 6, 7, 97, 8472.03);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (3, 42, 9, 2, 74, 1704.92);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (33, 43, 5, 1, 18, 2955.04);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (16, 44, 6, 7, 54, 13188.29);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (85, 45, 9, 8, 54, 12665.22);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (29, 46, 2, 2, 57, 6244.81);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (39, 47, 10, 9, 100, 6497.77);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (10, 48, 9, 5, 69, 9345.04);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (18, 49, 1, 3, 98, 119.83);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (46, 50, 8, 3, 89, 8782.54);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (31, 51, 2, 9, 38, 2734.15);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (73, 52, 9, 4, 40, 8593.65);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (60, 53, 9, 1, 94, 3599.0);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (11, 54, 1, 1, 83, 5982.06);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (15, 55, 2, 2, 83, 5783.23);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (96, 56, 9, 4, 44, 3842.47);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (55, 57, 6, 5, 47, 12560.98);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (86, 58, 4, 1, 33, 14221.07);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (7, 59, 5, 1, 70, 13522.42);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (58, 60, 5, 3, 81, 8851.18);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (10, 61, 9, 4, 46, 7012.05);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (12, 62, 4, 3, 58, 6599.72);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (6, 63, 4, 5, 94, 2940.97);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (39, 64, 9, 3, 67, 4811.72);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (72, 65, 5, 2, 44, 5866.63);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (89, 66, 1, 8, 78, 11921.81);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (38, 67, 2, 4, 23, 2263.39);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (42, 68, 1, 9, 59, 14641.85);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (87, 69, 9, 10, 21, 5496.95);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (35, 70, 7, 1, 27, 4438.78);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (53, 71, 4, 7, 87, 156.16);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (94, 72, 8, 4, 23, 5800.6);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (66, 73, 2, 6, 75, 12120.06);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (44, 74, 6, 4, 48, 11560.58);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (29, 75, 3, 4, 66, 4769.41);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (42, 76, 3, 4, 21, 13696.71);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (93, 77, 3, 6, 25, 13907.84);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (65, 78, 5, 1, 83, 2919.53);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (10, 79, 2, 6, 19, 6845.64);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (89, 80, 3, 7, 78, 7443.14);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (91, 81, 7, 5, 56, 12886.68);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (43, 82, 2, 4, 94, 14513.58);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (48, 83, 4, 5, 44, 9230.92);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (44, 84, 5, 3, 23, 1545.58);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (71, 85, 3, 9, 4, 8604.15);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (25, 86, 1, 6, 100, 13682.95);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (100, 87, 1, 5, 13, 14527.38);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (60, 88, 6, 5, 50, 4383.41);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (32, 89, 6, 4, 96, 795.54);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (66, 90, 4, 10, 39, 6502.41);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (77, 91, 7, 10, 68, 4306.39);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (76, 92, 9, 4, 75, 11912.69);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (69, 93, 4, 1, 97, 10445.73);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (80, 94, 3, 4, 96, 11768.14);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (75, 95, 3, 7, 97, 1045.47);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (16, 96, 7, 1, 7, 6457.68);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (29, 97, 8, 7, 47, 8011.74);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (3, 98, 5, 9, 50, 6983.06);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (25, 99, 3, 9, 4, 2486.25);
insert into [IvanovCollection].[PurchaseDetails] ([PurchaseId], [PdId], [ProductId], [MakerId], [OrderedQty], [SubTotal]) values (2, 100, 3, 8, 90, 3252.22);

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

--creating foreign key for table Purchases to table Employees
ALTER TABLE [IvanovCollection].[Purchases] 
ADD CONSTRAINT FK_Purchases_Employees
	FOREIGN KEY ([SellerId]) 
	REFERENCES [IvanovCollection].[Employees]([EmployeeId]);

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
