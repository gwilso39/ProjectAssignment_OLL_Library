USE LourdesAcademy;

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