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
