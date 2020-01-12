USE [db_contacts]
GO
/****** Object:  StoredProcedure [dbo].[Populate_db_contacts]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS Phonebook;
DROP TABLE IF EXISTS Names;
DROP TABLE IF EXISTS Information;

CREATE TABLE Names (
     	ID INT PRIMARY KEY IDENTITY,
        first_name VARCHAR (30) NULL,
       	last_name VARCHAR (50) NULL, 
);

CREATE TABLE Information (
     	ID INT PRIMARY KEY IDENTITY,
        phone_number VARCHAR (30) NULL,
       	contact_address VARCHAR (100) NULL, 
);

--intermediary table:
CREATE TABLE Phonebook(
	NamesID INT NOT NULL,
	InformationID INT NOT NULL,
	CONSTRAINT FK_PhonebookNames FOREIGN KEY (NamesID) REFERENCES Names(ID),
	CONSTRAINT FK_PhonebookInformation FOREIGN KEY (InformationID) REFERENCES Information(ID),
	CONSTRAINT PK_Phonebook PRIMARY KEY(NamesID, InformationID)
)

INSERT INTO Names
	(first_name, last_name)
	VALUES 
	('Natalie', 'Farrell'),
	('Robert', 'Fink')
;

INSERT INTO Information
	(phone_number, contact_address)
	VALUES 
	('123-456-7890', '123 Love Lane'),
	('123-456-7891', '321 Paradise Lane')
;

SELECT Names.first_name, Names.last_name, Information.phone_number, Information.contact_address
	FROM Names
	INNER JOIN Information ON Names.ID=Information.ID
;

