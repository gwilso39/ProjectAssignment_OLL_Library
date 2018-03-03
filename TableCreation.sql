USE [master]
GO

/****** Object:  Database [LourdesAcademy]    Script Date: 2/27/2018 12:09:20 PM ******/
DROP DATABASE [LourdesAcademy]
GO

/****** Object:  Database [LourdesAcademy]    Script Date: 2/27/2018 12:09:20 PM ******/
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


USE LourdesAcademy;

DROP TABLE IF EXISTS Subjects;

CREATE TABLE Subjects
(
	subjectid			int IDENTITY(1,1)				NOT NULL,
	subjectdescription	nvarchar(60)	NOT NULL,

		CONSTRAINT PK_Subjects
		  PRIMARY KEY (subjectid)
);

INSERT INTO Subjects (subjectdescription) 
	values	('Religion'),
			('Science'),
			('History'),
			('Math'),
			('Literature'),
			('Music');

DROP TABLE IF EXISTS Access;

CREATE TABLE Access
(
	accessid		int IDENTITY(1,1)		NOT NULL,
	accesslevel		nvarchar(20)			NOT NULL,

		CONSTRAINT PK_Acess
		  PRIMARY KEY (accessid)
);

INSERT INTO Access (accesslevel)
	values ('Administrator'), ('Faculty'), ('Staff'), ('Student');


DROP TABLE IF EXISTS GradeLevel;

CREATE TABLE GradeLevel
(
	gradelevelid			int IDENTITY(1,1)		NOT NULL,
	gradeleveldescription	nvarchar(20)			NOT NULL,

		CONSTRAINT PK_GradeLevel
		  PRIMARY KEY (gradelevelid)
);

INSERT INTO GradeLevel (gradeleveldescription) 
	values (3),(4),(5),(6),(7),(8),(9),(10),(11),(12);


DROP TABLE IF EXISTS Age;

CREATE TABLE Age
(
	ageid		int IDENTITY(1,1)			NOT NULL,
	age			int			NOT NULL,

		CONSTRAINT PK_Age
		  PRIMARY KEY (ageid)
);

INSERT INTO Age (age) 
	values (5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(00);


DROP TABLE IF EXISTS Users;

CREATE TABLE Users
(
	userid			int IDENTITY(1,1)			NOT NULL,
	fname			nvarchar(10)	NOT NULL,
	lname			nvarchar(20)	NOT NULL,
	userpassword	text			NOT NULL,
	accessid		int				NOT NULL,
	
		CONSTRAINT PK_Users
		  PRIMARY KEY (userid),
		  FOREIGN KEY (accessid)
			REFERENCES Access(accessid)				
);


INSERT INTO dbo.Users (fname, lname, userpassword, accessid)
	values	('Melanie', 'Wilson', 'OLLAdministrator', 1),
			('Bernie', 'O''Leary', 'OLLFaculty', 4),
			('Leslie', 'Powers', 'OLLFaculty', 4),
			('Nancy', 'Sturm', 'OLLFaculty', 4),
			('Karen', 'Larson', 'OLLFaculty', 4),
			('Natasha', 'Sochan', 'OLLStaff', 3),
			('Patty', 'Huard', 'OLLStaff', 3),
			('Laurie', 'Brissette', 'OLLStaff', 3),
			('Justin', 'Wilson', 'OLLStudent', 2),
			('Ariana', 'Thomas', 'OLLStudent', 2),
			('Charlie', 'Ayres', 'OLLStudent', 2),
			('Isis', 'Sturm', 'OLLStudent', 2),
			('Jesse', 'Rutherford', 'OLLStudent', 2);


DROP TABLE IF EXISTS Locations;

CREATE TABLE Locations
(
	locationid			int IDENTITY(1,1)				NOT NULL,
	locationadmin		int				NOT NULL,
	locationdescription nvarchar(60)    NOT NULL,

		CONSTRAINT PK_Locations
		  PRIMARY KEY (locationid),
		  FOREIGN KEY (locationadmin)
			REFERENCES Users(userid)
);

INSERT INTO dbo.Locations (locationadmin, locationdescription) 
	values	(1, 'Media Center'),
			(1, 'Middle School ELA'),
			(1, 'Middle School Social Studies'),
			(1, 'Middle School Science'),
			(1, 'Main Office'),
			(1, '3rd Grade'),
			(1, '4th Grade'),
			(1, '5th Grade'),
			(1, 'ArtandReligion');


DROP TABLE IF EXISTS CheckedOutIn;

CREATE TABLE CheckedOutIn
(
	checkedoutinid	int IDENTITY(1,1)			NOT NULL,
	itemstatus		nvarchar(11)				NOT NULL,
	userid			int							NULL,
	datecheckedout	date						NULL,

		CONSTRAINT PK_CheckedOutIn
		  PRIMARY KEY (checkedoutinid),
		  FOREIGN KEY (userid)
			REFERENCES Users(userid)

);

INSERT INTO CheckedOutIn (itemstatus) 
	values	('In'), ('Out'), ('Hold'), ('Restricted');


DROP TABLE IF EXISTS Media;

CREATE TABLE Media
(
	mediaid				int IDENTITY(1,1)			NOT NULL,
	locationid			int				NOT NULL,
	subjectid			int				NOT NULL,
	checkedoutinid		int				NOT NULL,
	ageid				int				NOT NULL,
	mediatype			nvarchar(25)	NOT NULL,
	title				nvarchar(40)	NOT NULL,
	producer			nvarchar(30)	NOT NULL,
	rating				nvarchar(10)	NOT NULL,
	photo				text			NULL,
	media_description	text			NOT NULL,
	media_genre			nvarchar(10)	NOT NULL,
	runningtime			text			NOT NULL,

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

INSERT INTO Media	(locationid, subjectid, checkedoutinid, ageid, mediatype, title,
					producer, rating, photo, media_description, media_genre, runningtime)
	values	
			(1, 5, 1, 8, 'DVD', 'Diary of Anne Franke',
			'BBC', 'PG','',
			'Biography of Anne Franke, a teenage Jewish Girl and her family go into hiding
			 during WWII', 'Biography', '150'),
			(1, 1, 1, 1, 'DVD', 'Ten Commandments',
			'MP Associates', 'G','',
			'The Egyptian Prince Moses, learns his true heritage and his divine mission as 
			the deliverer of his people', 'Adventure', '220'),
			(1, 1, 1, 9, 'DVD', 'The Shack',
			'Summit', 'PG13','',
			'Grieving man receives a mysterious personal invitation to meet woth God at a 
			place called the shack!', 'Drama', '132');


DROP TABLE IF EXISTS Books;

CREATE TABLE Books
(
	bookid				int IDENTITY(1,1)				NOT NULL,
	lexilescore			int				NOT NULL,
	gradelower			int				NOT NULL,
	gradeupper			int				NOT NULL,
	locationid			int				NOT NULL,
	checkedoutinid		int				NOT NULL,
	loweragerange		int				NOT NULL,
	upperagerange		int				NULL,
	title				nvarchar(40)	NOT NULL,
	author				nvarchar(40)	NOT NULL,
	genre				nvarchar(25)	NOT NULL,
	book_description	text			NOT NULL,
	photo				text			NULL,
	replacementcost		money			NOT NULL,
	isbn#				varchar(30)		NOT NULL,

		CONSTRAINT PK_Books
		  PRIMARY KEY (bookid),
		  FOREIGN KEY (locationid)
			REFERENCES Locations(locationid),
		  FOREIGN KEY (checkedoutinid)
			REFERENCES CheckedOutIn(checkedoutinid),
		  FOREIGN KEY (upperagerange)
			REFERENCES Age(ageid),
		  FOREIGN KEY (loweragerange)
			REFERENCES Age(ageid),
		  FOREIGN KEY (gradelower)
			REFERENCES GradeLevel(gradelevelid),
		  FOREIGN KEY (gradeupper)
			REFERENCES GradeLevel(gradelevelid),
);

INSERT INTO Books (lexilescore, gradelower, gradeupper, locationid, checkedoutinid, loweragerange, upperagerange,
					title, author, genre, book_description, photo, replacementcost, isbn#)
	values	  (1040, 3, 5, 2, 1, 6, 8, 'Farewell to Manzanar', 'Jeanne Wakatsuki Houston', 'Non-Fiction',
			 'During WWII a community called Manzanar was created in the high mountain desert
			  country of California.  Its purpose was to house thousands of Japanese Americans.',
			  '',10, 1328742113),
			  (700, 4, 10, 2, 1, 10, 11, 'Girl, Stolen', 'April Henry', 'Mystery/Suspense',
			 'When Cheyenne''s mother stops to fill a prescription for her pneumonia, a thief
			  steals the car with Cheyenne asleep in the back seat.  Can a blind, sick girl
			  manage to escape her kidnapper?',
			  '',5, 139780545921756),
			  (700, 6, 10, 2, 1, 8, 11, 'Divergent', 'Veronica Roth', 'Science Fiction',
			 'Post apocalyptic Chicago is organized into 5 distinct factions. Each focuses on a particular
			 virtue. At age 16, Beatrice must decide who she will be.',
			  '',12, 139780062387240);

USE LourdesAcademy;

SELECT *
  FROM Users;

SELECT *
  FROM Access;


SELECT *
  FROM Subjects;

SELECT *
  FROM CheckedOutIn;

SELECT *
  FROM Users as U
    JOIN Access as A
	  ON a.accessid = u.accessid
  WHERE a.accessid > 2;


SELECT u.fname, u.lname, a.accesslevel
	FROM Users as U
	  JOIN Access as A
	    ON A.accessid = U.accessid
	WHERE accesslevel = 'Student';

SELECT *
	  FROM Age;

SELECT B.title, L.locationdescription, U.fname, U.lname
	FROM Books as B
	Join Locations as L
	  ON B.locationid = L.locationid
	  JOIN Users as U
	    ON U.userid = L.locationadmin