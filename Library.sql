CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address varchar(50) NOT NULL
);

INSERT INTO Library_Branch
	(BranchName, Address)
	VALUES
	('Beaverton', '1234 Burritos'),
	('Troutdale', '4321 Taco Street'),
	('Westside', '1122 Mochi Lane'),
	('Eastside', '2211 Boba Yum')
;

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone varchar(50) NOT NULL
);

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Mitis Books', 'Pennsylvania', '123-456-7890'),
	('Hammock Publishers', 'Oregon', '123-654-7890'),
	('Rezz Creations', 'California', '888-888-8888'),
	('Anamanaguchi Publishing', 'Washington', '123-321-1324')
;

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Title VARCHAR(75) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL 
);

INSERT INTO Books
	(Title, PublisherName)
	VALUES
	('How to Read', 'Hammock Publishers'),
	('LOVE', 'Mitis Books'),
	('Burritos', 'Mitis Books'),
	('How to Fly', 'Rezz Creations'),
	('Lost', 'Hammock Publishers'),
	('How to Become a Twitch Streamer', 'Mitis Books'),
	('Programming for No0bs', 'Rezz Creations'),
	('German Shepherd Facts', 'Rezz Creations'),
	('A Love Once Lost', 'Rezz Creations'),
	('A Love Once Found', 'Rezz Creations'),
	('What to Bring on a Road Trip', 'Hammock Publishers'),
	('Making it Count', 'Anamanaguchi Publishing'),
	('Videogames', 'Mitis Books'),
	('The Crow', 'Anamanaguchi Publishing'),
	('Twilight Princess', 'Hammock Publishers'),
	('Robert the Character Artist', 'Mitis Books'),
	('How to Heal From Grief', 'Anamanaguchi Publishing'),
	('Angels in the Outfield', 'Mitis Books'),
	('Town of Salem', 'Anamanaguchi Publishing'),
	('World of Warcraft Lore', 'Rezz Creations'),
	('Healthy Living', 'Anamanaguchi Publishing'),
	('Fear and Loathing in Las Vegas', 'Hammock Publishers'),
	('Soja', 'Mitis Books'),
	('Borderlands Series', 'Mitis Books'),
	('Bioshock Infinite', 'Anamanaguchi Publishing'),
	('Signs', 'Hammock Publishers'),
	('Cry of the Wolf', 'Anamanaguchi Publishing'),
	('Running with Scissors', 'Hammock Publishers'),
	('Little Women', 'Rezz Creations'),
	('Anne of Green Gables', 'Hammock Publishers'),
	('How to Train Your Dog', 'Rezz Creations'),
	('Longdistance Relationships', 'Hammock Publishers'),
	('Four Weddings and a Funeral', 'Anamanaguchi Publishing'),
	('Beautiful Alicia', 'Mitis Books'),
	('Moonbeam', 'Mitis Books'),
	('The Ugly Duckling', 'Mitis Books'),
	('The Adventure of Shane', 'Anamanaguchi Publishing'),
	('Mustang Guide', 'Rezz Creations'),
	('Sleepless in Seattle', 'Anamanaguchi Publishing'),
	('The Lion King', 'Anamanaguchi Publishing')
;

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (500,1),
	Name VARCHAR(50) NOT NULL,
	Address varchar(50) NOT NULL,
	Phone VARCHAR(20) NOT NULL
);

INSERT INTO Borrower 
	(Name, Address, Phone)
	VALUES
	('Tiny Tina', '123 Gearbox Way', '111-111-1111'),
	('Alicia Love ', '234 Moonbeam Street', '111-222-2222'),
	('Robert Artist', '111 Space St', '111-333-3333'),
	('Zelda Link', '456 Twilight Circle', '222-444-4444'),
	('Super Mario', '212 Toad Peach', '111-555-5555'),
	('Harry Potter', '977 Hogwarts Drive', '111-666-6666'),
	('Shane Friend', '221 Mustang Street', '111-777-7777'),
	('Kate Fluffy', '112 Slim Shady', '111-888-8888')
;

INSERT INTO Borrower
	(Name, Address, Phone)
	VALUES
	('Myra Brien', '333 Awesome Lane', '111-234-4567'),
	('Verena Jesse', '42 Proxy Parcy', '111-345-6789')
;

CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID),
	Number_Of_Copies INT NOT NULL
);

INSERT INTO Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(100, 2, 2),
	(101, 2, 2),
	(102, 2, 2),
	(103, 2, 2),
	(104, 1, 2),
	(105, 1, 2),
	(106, 3, 2),
	(107, 3, 2),
	(108, 4, 2),
	(109, 4, 2),
	(110, 2, 2),
	(111, 2, 2),
	(112, 1, 2),
	(113, 1, 2),
	(114, 3, 2),
	(115, 3, 2),
	(116, 3, 2),
	(117, 4, 2),
	(118, 4, 2),
	(119, 4, 2),
	(120, 2, 2),
	(121, 2, 2),
	(122, 1, 2),
	(123, 1, 2),
	(124, 1, 2),
	(125, 3, 2),
	(126, 3, 2),
	(127, 3, 2),
	(128, 4, 2),
	(129, 4, 2),
	(130, 2, 2),
	(131, 2, 2),
	(132, 1, 2),
	(133, 1, 2),
	(134, 1, 2),
	(135, 3, 2),
	(136, 3, 2),
	(137, 4, 2),
	(138, 4, 2),
	(139, 4, 2)
;

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookIDL FOREIGN KEY REFERENCES Books(BookID),
	BranchID INT NOT NULL CONSTRAINT fk_BranchIDL FOREIGN KEY REFERENCES Library_Branch(BranchID),
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo),
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(100, 2, 500, '2019-11-15', '2019-12-02'),
	(101, 2, 500, '2019-11-15', '2019-12-02'),
	(103, 2, 500, '2019-11-15', '2019-12-02'),
	(104, 2, 500, '2019-11-15', '2019-12-02'),
	(110, 2, 500, '2019-11-15', '2019-12-02'),
	(111, 2, 500, '2019-11-15', '2019-12-02'),
	(120, 2, 500, '2019-11-15', '2019-12-02'),
	(121, 2, 501, '2019-11-14', '2019-12-01'),
	(130, 2, 501, '2019-11-14', '2019-12-01'),
	(131, 2, 501, '2019-11-14', '2019-12-01'),
	(100, 2, 501, '2019-11-14', '2019-12-01'),
	(103, 2, 501, '2019-11-14', '2019-12-01'),
	(102, 1, 501, '2019-11-14', '2019-12-01'),
	(105, 1, 501, '2019-11-14', '2019-12-26'),
	(112, 1, 502, '2019-11-13', '2019-12-26'),
	(113, 1, 502, '2019-11-13', '2019-12-30'),
	(122, 1, 502, '2019-11-13', '2019-12-30'),
	(123, 1, 502, '2019-11-13', '2019-12-30'),
	(124, 1, 502, '2019-11-13', '2019-12-30'),
	(132, 1, 502, '2019-11-13', '2019-12-30'),
	(133, 1, 503, '2019-11-12', '2019-12-29'),
	(134, 1, 503, '2019-11-12', '2019-12-29'),
	(122, 1, 503, '2019-11-12', '2019-12-29'),
	(105, 1, 503, '2019-11-12', '2019-12-29'),
	(106, 3, 503, '2019-11-12', '2019-12-29'),
	(107, 3, 503, '2019-11-12', '2019-12-29'),
	(114, 3, 504, '2019-11-11', '2019-12-28'),
	(115, 3, 504, '2019-11-11', '2019-12-28'),
	(116, 3, 504, '2019-11-11', '2019-12-28'),
	(125, 3, 504, '2019-11-11', '2019-12-28'),
	(126, 3, 504, '2019-11-11', '2019-12-28'),
	(127, 3, 504, '2019-11-11', '2019-12-28'),
	(135, 3, 505, '2019-11-10', '2019-12-27'),
	(136, 3, 505, '2019-11-10', '2019-12-27'),
	(114, 3, 505, '2019-11-10', '2019-12-27'),
	(107, 3, 505, '2019-11-10', '2019-12-27'),
	(108, 4, 505, '2019-11-10', '2019-12-27'),
	(109, 4, 505, '2019-11-10', '2019-12-27'),
	(117, 4, 506, '2019-11-09', '2019-12-26'),
	(119, 4, 506, '2019-11-09', '2019-12-26'),
	(128, 4, 506, '2019-11-09', '2019-12-26'),
	(129, 4, 506, '2019-11-09', '2019-12-26'),
	(137, 4, 506, '2019-11-09', '2019-12-26'),
	(138, 4, 507, '2019-11-08', '2019-12-25'),
	(139, 4, 507, '2019-11-08', '2019-12-25'),
	(117, 4, 507, '2019-11-08', '2019-12-25'),
	(118, 4, 507, '2019-11-08', '2019-12-25'),
	(108, 4, 507, '2019-11-08', '2019-12-25'),
	(109, 4, 507, '2019-11-08', '2019-12-25')
;

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BookIDT FOREIGN KEY REFERENCES Books(BookID),
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO Book_Authors
	(BookID, AuthorName)
	VALUES
	(100,'Jane Austen'),
	(101,'Jane Austen'),
	(102,'Jane Austen'),
	(103,'Jane Austen'),
	(104,'J. K. Rowling'),
	(105,'J. K. Rowling'),
	(106,'J. K. Rowling'),
	(107,'J. K. Rowlingn'),
	(108,'J. K. Rowling'),
	(109,'J. K. Rowling'),
	(110,'Casey Cep'),
	(111,'Casey Cep'),
	(112,'Casey Cep'),
	(113,'Casey Cep'),
	(114,'Casey Cep'),
	(115,'Casey Cep'),
	(116,'Casey Cep'),
	(117,'Casey Cep'),
	(118,'Casey Cep'),
	(119,'Casey Cep'),
	(120,'Raymond Antrobus'),
	(121,'Raymond Antrobus'),
	(122,'Raymond Antrobus'),
	(123,'Raymond Antrobus'),
	(124,'Raymond Antrobus'),
	(125,'Raymond Antrobus'),
	(126,'Raymond Antrobus'),
	(127,'Raymond Antrobus'),
	(128,'Raymond Antrobus'),
	(129,'Raymond Antrobus'),
	(130,'Lucy Ellmann'),
	(131,'Lucy Ellmann'),
	(132,'Lucy Ellmann'),
	(133,'Lucy Ellmann'),
	(134,'Lucy Ellmann'),
	(135,'Olivia Laing'),
	(136,'Melissa Harrison'),
	(137,'Muhammad Khan'),
	(138,'Stephen King'),
	(139,'James Clarke')
;

SELECT * FROM Library_Branch
GO

/*********************
	PROCEDURE 1
 *********************/
CREATE PROC getTribe
AS
SELECT Number_Of_Copies FROM Book_Copies 
	WHERE 
	BookID = 102 
	AND 
	BranchID = 1
GO

getTribe

/*********************
	PROCEDURE 2
 *********************/
 CREATE PROC copiesLT
 AS
 SELECT Number_Of_Copies, BranchID 
 FROM Book_Copies
WHERE BookID = 102

copiesLT

/*********************
	PROCEDURE 3
 *********************/
CREATE PROC getNotRenting
AS
SELECT Name
FROM Borrower
WHERE CardNo NOT IN (SELECT CardNo FROM Book_loans)
GO

getNotRenting

 /*********************
	PROCEDURE 4
 *********************/
CREATE PROC beavertonDueToday
 AS
SELECT a1.Title, a2.Name, a2.Address
FROM Books a1, Borrower a2, Book_Loans a3, Library_Branch a4
WHERE a4.BranchName='Beaverton' AND a4.BranchId=a3.BranchId AND
a3.DateDue='2019-12-30' AND a3.CardNo=a2.CardNo AND a3.BookId=a1.BookId

beavertonDueToday

 /*********************
	PROCEDURE 5
 *********************/
CREATE PROC branchLoan
AS
SELECT L.BranchName, COUNT(*)
FROM LIBRARY_BRANCH L, BOOK_LOANS BL
WHERE BL.BranchId = L.BranchId
GROUP BY L.BranchName;

branchLoan

 /*********************
	PROCEDURE 6
 *********************/
CREATE PROC moreThanFive
AS
SELECT a1.Name, a1.Address, COUNT(*)
FROM BORROWER a1, BOOK_LOANS a2
WHERE a1.CardNo = a2.CardNo
GROUP BY a1.CardNo, a1.Name, a1.Address
HAVING COUNT(*) > 5;

moreThanFive

/*********************
	PROCEDURE 7
 *********************/
CREATE PROC ellmannAtTroutdale
AS
SELECT DISTINCT a1.Title, a2.Number_Of_Copies
FROM Books a1
INNER JOIN Book_Copies a2 ON a1.BookID = a2.BookID
INNER JOIN Book_Authors a3 ON a1.BookID = a3.BookID
INNER JOIN Book_Loans a4 ON a1.BookID = a4.BookID
INNER JOIN Library_Branch a5 ON a4.BranchID = a5.BranchID
WHERE
a3.AuthorName = 'Lucy Ellmann'
AND
a4.BranchID = 2

ellmannAtTroutdale

/*****************************
   Selects and Procedures
 *****************************/
SELECT * FROM Library_Branch
SELECT * FROM Book_Copies
SELECT * FROM Book_Loans
SELECT * FROM Borrower
SELECT * FROM Publisher
SELECT * FROM Books
SELECT * FROM Book_Authors

getTribe
copiesLT
getNotRenting
beavertonDueToday
branchLoan
moreThanFive
ellmannAtTroutdale