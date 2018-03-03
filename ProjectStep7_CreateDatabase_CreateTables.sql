USE [master]
GO

/****** Object:  Database [LourdesAcademy]    Script Date: 2/26/2018 8:47:49 AM ******/
DROP DATABASE [LourdesAcademy]
GO

/****** Object:  Database [LourdesAcademy]    Script Date: 2/26/2018 8:47:49 AM ******/
CREATE DATABASE [LourdesAcademy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LourdesAcademy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LourdesAcademy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LourdesAcademy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LourdesAcademy_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [LourdesAcademy] SET COMPATIBILITY_LEVEL = 140
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LourdesAcademy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [LourdesAcademy] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [LourdesAcademy] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [LourdesAcademy] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [LourdesAcademy] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [LourdesAcademy] SET ARITHABORT OFF 
GO

ALTER DATABASE [LourdesAcademy] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [LourdesAcademy] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [LourdesAcademy] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [LourdesAcademy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [LourdesAcademy] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [LourdesAcademy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [LourdesAcademy] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [LourdesAcademy] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [LourdesAcademy] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [LourdesAcademy] SET  DISABLE_BROKER 
GO

ALTER DATABASE [LourdesAcademy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [LourdesAcademy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [LourdesAcademy] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [LourdesAcademy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [LourdesAcademy] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [LourdesAcademy] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [LourdesAcademy] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [LourdesAcademy] SET RECOVERY FULL 
GO

ALTER DATABASE [LourdesAcademy] SET  MULTI_USER 
GO

ALTER DATABASE [LourdesAcademy] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [LourdesAcademy] SET DB_CHAINING OFF 
GO

ALTER DATABASE [LourdesAcademy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [LourdesAcademy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [LourdesAcademy] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [LourdesAcademy] SET QUERY_STORE = OFF
GO

USE [LourdesAcademy]
GO

ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [LourdesAcademy] SET  READ_WRITE 
GO


DROP TABLE IF EXISTS Access;

CREATE TABLE Access
(
	accessid		int				NOT NULL,
	accesslevel		nvarchar(10)	NOT NULL,

		CONSTRAINT PK_Acess
		  PRIMARY KEY (accessid)
);


DROP TABLE IF EXISTS dbo.Users;

CREATE TABLE Users
(
	userid			int				NOT NULL,
	fname			nvarchar(10)	NOT NULL,
	lname			nvarchar(20)	NOT NULL,
	userpassword	text			NOT NULL,
	accessid		int				NOT NULL,
	
		CONSTRAINT PK_Users
		  PRIMARY KEY (userid),
		  FOREIGN KEY (accessid)
			REFERENCES Access(accessid)				
);


DROP TABLE IF EXISTS LexileScores;

CREATE TABLE LexileScores
(
	lexileid	int				NOT NULL,
	lexile		int				NOT NULL,
	grade		nchar(2)		NOT NULL,

		CONSTRAINT PK_LexileScores
		  PRIMARY KEY (lexileid)
);


DROP TABLE IF EXISTS Locations;

CREATE TABLE Locations
(
	locationid			int				NOT NULL,
	locationadmin		int				NOT NULL,
	locationdescription nvarchar(60)    NOT NULL,

		CONSTRAINT PK_Locations
		  PRIMARY KEY (locationid),
		  FOREIGN KEY (locationadmin)
			REFERENCES Users(userid)
);


DROP TABLE IF EXISTS Subjects;

CREATE TABLE Subjects
(
	subjectid			int				NOT NULL,
	subjectdescription	nvarchar(60)	NOT NULL,

		CONSTRAINT PK_Subjects
		  PRIMARY KEY (subjectid)
);


DROP TABLE IF EXISTS Age;

CREATE TABLE Age
(
	ageid		int			NOT NULL,
	age			int			NOT NULL,

		CONSTRAINT PK_Age
		  PRIMARY KEY (ageid)
);


DROP TABLE IF EXISTS dbo.CheckedOutIn;

CREATE TABLE CheckedOutIn
(
	checkedoutinid	int			NOT NULL,
	itemstatus		nchar(4)	NOT NULL,
	userid			int			NULL,

		CONSTRAINT PK_CheckedOutIn
		  PRIMARY KEY (checkedoutinid),
		  FOREIGN KEY (userid)
			REFERENCES Users(userid)

);


DROP TABLE IF EXISTS Media;

CREATE TABLE Media
(
	mediaid				int				NOT NULL,
	locationid			int				NOT NULL,
	subjectid			int				NOT NULL,
	checkedoutinid		int				NOT NULL,
	ageid				int				NOT NULL,
	mediatype			nvarchar(25)	NOT NULL,
	title				nvarchar(40)	NOT NULL,
	producer			nvarchar(30)	NOT NULL,
	rating				nvarchar(10)	NOT NULL,
	photo				text			NULL,
	media_description	nvarchar(60)	NOT NULL,

		CONSTRAINT PK_Media
		  PRIMARY KEY (mediaid),
		  FOREIGN KEY (locationid)
			REFERENCES Locations(locationid),
		  FOREIGN KEY (subjectid)
			REFERENCES Subjects(subjectid),
		  FOREIGN KEY (checkedoutinid)
			REFERENCES CheckedOutIn(checkedoutinid),
		  FOREIGN KEY (ageid)
			REFERENCES Age(ageid)
);

DROP TABLE IF EXISTS Books;

CREATE TABLE Books
(
	bookid				int				NOT NULL,
	lexileupper			int				NOT NULL,
	lexilelower			int				NOT NULL,
	locationid			int				NOT NULL,
	checkedoutinid		int				NOT NULL,
	loweragerange		int				NOT NULL,
	upperagerange		int				NULL,
	title				nvarchar(40)	NOT NULL,
	author				nvarchar(40)	NOT NULL,
	genre				nvarchar(25)	NOT NULL,
	book_description	nvarchar(150)	NOT NULL,
	photo				text			NULL,
	replacementcost		money			NOT NULL,
	isbn#				int				NOT NULL,

		CONSTRAINT PK_Books
		  PRIMARY KEY (bookid),
		  FOREIGN KEY (lexileupper)
			REFERENCES LexileScores(lexileid),
		  FOREIGN KEY (lexilelower)
			REFERENCES LexileScores(lexileid),
		  FOREIGN KEY (locationid)
			REFERENCES Locations(locationid),
		  FOREIGN KEY (checkedoutinid)
			REFERENCES CheckedOutIn(checkedoutinid),
		  FOREIGN KEY (upperagerange)
			REFERENCES Age(ageid),
		  FOREIGN KEY (loweragerange)
			REFERENCES Age(ageid)
);

ALTER TABLE Books
ALTER COLUMN 		book_description	nvarchar(250)	NOT NULL;


INSERT INTO Locations (locationid, locationadmin, locationdescription) values (1, 1, 'Media Center');
INSERT INTO Locations (locationid, locationadmin, locationdescription) values (2, 1, 'Middle School ELA');
INSERT INTO Locations (locationid, locationadmin, locationdescription) values (3, 1, 'Middle School Social Studies');
INSERT INTO Locations (locationid, locationadmin, locationdescription) values (4, 1, 'Middle School Science');
INSERT INTO Locations (locationid, locationadmin, locationdescription) values (5, 1, 'Main Office');
INSERT INTO Locations (locationid, locationadmin, locationdescription) values (6, 1, '5th Grade');

INSERT INTO Subjects(subjectid, subjectdescription) values (1, 'Religion');
INSERT INTO Subjects(subjectid, subjectdescription) values (2, 'Science');
INSERT INTO Subjects(subjectid, subjectdescription) values (3, 'History');
INSERT INTO Subjects(subjectid, subjectdescription) values (4, 'Math');
INSERT INTO Subjects(subjectid, subjectdescription) values (5, 'Literature');
INSERT INTO Subjects(subjectid, subjectdescription) values (6, 'Music');

INSERT INTO Age(ageid, age) values (1,5);
INSERT INTO Age(ageid, age) values (2,6);
INSERT INTO Age(ageid, age) values (3,7);
INSERT INTO Age(ageid, age) values (4,8);
INSERT INTO Age(ageid, age) values (5,9);
INSERT INTO Age(ageid, age) values (6,10);
INSERT INTO Age(ageid, age) values (7,11);
INSERT INTO Age(ageid, age) values (8,12);
INSERT INTO Age(ageid, age) values (9,13);
INSERT INTO Age(ageid, age) values (10,14);

INSERT INTO CheckedOutIn (checkedoutinid, itemstatus) values (1,'Out');
INSERT INTO CheckedOutIn (checkedoutinid, itemstatus) values (2,'In');
INSERT INTO CheckedOutIn (checkedoutinid, itemstatus) values (3,'Hold');
INSERT INTO CheckedOutIn (checkedoutinid, itemstatus) values (4,'Rest');

INSERT INTO Access (accessid, accesslevel) values (1, 'Admin');
INSERT INTO Access (accessid, accesslevel) values (2, 'Student');
INSERT INTO Access (accessid, accesslevel) values (3, 'Staff');
INSERT INTO Access (accessid, accesslevel) values (4, 'Faculty');

INSERT INTO LexileScores (lexileid, lexile, grade) values (1, 550, 3);
INSERT INTO LexileScores (lexileid, lexile, grade) values (2, 687, 3);
INSERT INTO LexileScores (lexileid, lexile, grade) values (3, 688, 4);
INSERT INTO LexileScores (lexileid, lexile, grade) values (4, 799, 4);
INSERT INTO LexileScores (lexileid, lexile, grade) values (5, 800, 5);
INSERT INTO LexileScores (lexileid, lexile, grade) values (6, 899, 5);
INSERT INTO LexileScores (lexileid, lexile, grade) values (7, 900, 6);
INSERT INTO LexileScores (lexileid, lexile, grade) values (8, 974, 6);
INSERT INTO LexileScores (lexileid, lexile, grade) values (9, 975, 7);
INSERT INTO LexileScores (lexileid, lexile, grade) values (10, 1036, 7);
INSERT INTO LexileScores (lexileid, lexile, grade) values (11, 1037, 8);
INSERT INTO LexileScores (lexileid, lexile, grade) values (12, 1099, 8);
INSERT INTO LexileScores (lexileid, lexile, grade) values (13, 1100, 9);

INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (1, 'Melanie', 'Wilson', 'OLLAdministrator', 1);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (2, 'Bernie', 'O''Leary', 'OLLFaculty', 4);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (3, 'Leslie', 'Powers', 'OLLFaculty', 4);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (4, 'Nancy', 'Sturm', 'OLLFaculty', 4);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (5, 'Karen', 'Larson', 'OLLFaculty', 4);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (6, 'Natasha', 'Sochan', 'OLLStaff', 3);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (7, 'Patty', 'Huard', 'OLLStaff', 3);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (8, 'Laurie', 'Brissette', 'OLLStaff', 3);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (9, 'Justin', 'Wilson', 'OLLStudent', 2);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (10, 'Ariana', 'Thomas', 'OLLStudent', 2);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (11, 'Charlie', 'Ayres', 'OLLStudent', 2);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (12, 'Isis', 'Sturm', 'OLLStudent', 2);
INSERT INTO Users (userid, fname, lname, userpassword, accessid)
			values (13, 'Jesse', 'Rutherford', 'OLLStudent', 2);

INSERT INTO Media (mediaid, locationid, subjectid, checkedoutinid, ageid, mediatype, title,
					producer, rating, photo, media_description)
			values (1, 1, 1, 1, 1, 'CD', 'God is Bigger than the Boogie Man',
					'Pearson View', 'PK','','Bob the tomato at his best!');


INSERT INTO Books (bookid, lexilelower, lexileupper, locationid, checkedoutinid, loweragerange, upperagerange,
					title, author, genre, book_description, photo, replacementcost, isbn#)
			values (1, 11, 12, 2, 1, 8, 10, 'Farewell to Manzanar', 'Jeanne Wakatsuki Houston', 'History',
					 'During WWII a community called Manzanar was created in the high mountain desert
					  country of California.  Its purpose was to house thousands of Japanese Americans.',
					  '',10.00,1328742113);

SELECT *
  FROM Users;

SELECT *
  FROM Access;

SELECT *
  FROM LexileScores;

SELECT *
  FROM Locations;

SELECT *
  FROM Subjects;

SELECT *
  FROM CheckedOutIn;

SELECT *
  FROM Users as U
    JOIN Access as A
	  ON a.accessid = u.accessid
  WHERE a.accessid > 2;

SELECT *
	FROM Books
	WHERE genre = 'History';

SELECT u.fname, u.lname, a.accesslevel
	FROM Users as U
	  JOIN Access as A
	    ON A.accessid = U.accessid
	WHERE accesslevel = 'Student';

SELECT b.title, l.locationdescription, ls.lexile, ls.grade
  FROM Books as b		
    JOIN Locations as l
	  on l.locationid = b.locationid
	Join LexileScores as ls
	  on ls.lexileid = b.lexilelower
  WHERE ls.lexile > 500;