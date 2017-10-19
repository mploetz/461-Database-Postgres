\echo 'DROPING TABLES'
DROP TABLE Student CASCADE;
DROP TABLE Major CASCADE;
DROP TABLE Book CASCADE;
DROP TABLE Cites CASCADE;
DROP TABLE Buys CASCADE;

\echo 'CREATING TABLES'
CREATE TABLE Student(Sid INTEGER, Sname VARCHAR(15), PRIMARY KEY(Sid));
CREATE TABLE Major(Sid INTEGER, Major VARCHAR(15), PRIMARY KEY(Sid, Major), FOREIGN KEY(Sid) REFERENCES Student(Sid));
CREATE TABLE Book(BookNo INTEGER, Title VARCHAR(30), Price INTEGER, PRIMARY KEY(BookNo));
CREATE TABLE Cites(BookNo INTEGER, CitedBookNo INTEGER, PRIMARY KEY(BookNo, CitedBookNo), FOREIGN KEY(BookNo) REFERENCES Book(BookNo), FOREIGN KEY(CitedBookNo) REFERENCES Book(BookNo));
CREATE TABLE Buys(Sid INTEGER, BookNo INTEGER, PRIMARY KEY(Sid, BookNo), FOREIGN KEY(Sid) REFERENCES Student(Sid), FOREIGN KEY(BookNo) REFERENCES Book(BookNo));

-- Data for Assignment 4 
-- student 

insert into student values(1001,'Jean');
insert into student values(1002,'Maria');
insert into student values(1003,'Anna');
insert into student values(1004,'Chin');
insert into student values(1005,'John');
insert into student values(1006,'Ryan');
insert into student values(1007,'Catherine');
insert into student values(1008,'Emma');
insert into student values(1009,'Jan');
insert into student values(1010,'Linda');
insert into student values(1011,'Nick');
insert into student values(1012,'Eric');
insert into student values(1013,'Lisa');
insert into student values(1014,'Filip');
insert into student values(1015,'Dirk');
insert into student values(1016,'Mary');
insert into student values(1017,'Ellen');
insert into student values(1020,'Ahmed');
insert into student values(1021,'Vince');
insert into student values(1022,'Joeri');
insert into student values(1023,'Chris');
insert into student values(1040,'Sofie');


-- book 

insert into book values(2001,'Databases',40);
insert into book values(2002,'OperatingSystems',25);
insert into book values(2003,'Networks',20);
insert into book values(2004,'AI',45);
insert into book values(2005,'DiscreteMathematics',20);
insert into book values(2006,'SQL',25);
insert into book values(2007,'ProgrammingLanguages',15);
insert into book values(2008,'DataScience',50);
insert into book values(2009,'Calculus',10);
insert into book values(2010,'Philosophy',25);
insert into book values(2012,'Geometry',80);
insert into book values(2013,'RealAnalysis',35);
insert into book values(2011,'Anthropology',50);
insert into book values(2014,'Topology',70);

-- cites 
insert into cites values(2012,2001);
insert into cites values(2008,2011);
insert into cites values(2008,2012);
insert into cites values(2001,2002);
insert into cites values(2001,2007);
insert into cites values(2002,2003);
insert into cites values(2003,2001);
insert into cites values(2003,2004);
insert into cites values(2003,2002);
insert into cites values(2010,2001);
insert into cites values(2010,2002);
insert into cites values(2010,2003);
insert into cites values(2010,2004);
insert into cites values(2010,2005);
insert into cites values(2010,2006);
insert into cites values(2010,2007);
insert into cites values(2010,2008);
insert into cites values(2010,2009);
insert into cites values(2010,2011);
insert into cites values(2010,2013);
insert into cites values(2010,2014);

-- buys
insert into buys values(1023,2012);
insert into buys values(1023,2014);
insert into buys values(1040,2002);
insert into buys values(1001,2002);
insert into buys values(1001,2007);
insert into buys values(1001,2009);
insert into buys values(1001,2011);
insert into buys values(1001,2013);
insert into buys values(1002,2001);
insert into buys values(1002,2002);
insert into buys values(1002,2007);
insert into buys values(1002,2011);
insert into buys values(1002,2012);
insert into buys values(1002,2013);
insert into buys values(1003,2002);
insert into buys values(1003,2007);
insert into buys values(1003,2011);
insert into buys values(1003,2012);
insert into buys values(1003,2013);
insert into buys values(1004,2006);
insert into buys values(1004,2007);
insert into buys values(1004,2008);
insert into buys values(1004,2011);
insert into buys values(1004,2012);
insert into buys values(1004,2013);
insert into buys values(1005,2007);
insert into buys values(1005,2011);
insert into buys values(1005,2012);
insert into buys values(1005,2013);
insert into buys values(1006,2006);
insert into buys values(1006,2007);
insert into buys values(1006,2008);
insert into buys values(1006,2011);
insert into buys values(1006,2012);
insert into buys values(1006,2013);
insert into buys values(1007,2001);
insert into buys values(1007,2002);
insert into buys values(1007,2003);
insert into buys values(1007,2007);
insert into buys values(1007,2008);
insert into buys values(1007,2009);
insert into buys values(1007,2010);
insert into buys values(1007,2011);
insert into buys values(1007,2012);
insert into buys values(1007,2013);
insert into buys values(1008,2007);
insert into buys values(1008,2011);
insert into buys values(1008,2012);
insert into buys values(1008,2013);
insert into buys values(1009,2001);
insert into buys values(1009,2002);
insert into buys values(1009,2011);
insert into buys values(1009,2012);
insert into buys values(1009,2013);
insert into buys values(1010,2001);
insert into buys values(1010,2002);
insert into buys values(1010,2003);
insert into buys values(1010,2011);
insert into buys values(1010,2012);
insert into buys values(1010,2013);
insert into buys values(1011,2002);
insert into buys values(1011,2011);
insert into buys values(1011,2012);
insert into buys values(1012,2011);
insert into buys values(1012,2012);
insert into buys values(1013,2001);
insert into buys values(1013,2011);
insert into buys values(1013,2012);
insert into buys values(1014,2008);
insert into buys values(1014,2011);
insert into buys values(1014,2012);
insert into buys values(1017,2001);
insert into buys values(1017,2002);
insert into buys values(1017,2003);
insert into buys values(1017,2008);
insert into buys values(1017,2012);
insert into buys values(1020,2001);
insert into buys values(1020,2012);
insert into buys values(1022,2014);

-- major
insert into major values(1001,'Math');
insert into major values(1001,'Physics');
insert into major values(1002,'CS');
insert into major values(1002,'Math');
insert into major values(1003,'Math');
insert into major values(1004,'CS');
insert into major values(1006,'CS');
insert into major values(1007,'CS');
insert into major values(1007,'Physics');
insert into major values(1008,'Physics');
insert into major values(1009,'Biology');
insert into major values(1010,'Biology');
insert into major values(1011,'CS');
insert into major values(1011,'Math');
insert into major values(1012,'CS');
insert into major values(1013,'CS');
insert into major values(1013,'Psychology');
insert into major values(1014,'Theater');
insert into major values(1017,'Anthropology');
insert into major values(1022,'CS');
insert into major values(1015,'Chemistry');


\echo '1) BookNo of each book that is cited by at least one book that cost less than 50$'
/* E1 = Book that is cited by at least one book 
E2 = Books that Cost is less than 50$*/
WITH
E1 AS (SELECT C.CitedBookNo FROM Cites C INNER JOIN Book B ON (C.BookNo = B.BookNo AND B.Price < 50))
-- E1 AS (SELECT B.BookNo FROM Book B WHERE B.Price < 50),
-- E2 AS (SELECT DISTINCT B.BookNo FROM Cites C, Book B WHERE C.CitedBookNo = B.BookNo AND C.BookNo IN (SELECT * FROM E1))
SELECT DISTINCT E1.CitedBookNo FROM E1 ORDER BY E1.CitedBookNo;

\echo '2) Find the bookno and title of each book that was bought by a student who majors in CS and in Math'
WITH
E1 AS (SELECT M.Sid FROM Major M WHERE M.Major = 'Math'),
E2 AS (SELECT M.Sid FROM Major M WHERE M.Major = 'CS'),
E3 AS (SELECT DISTINCT B.BookNo, B.Title FROM Book B, Student S, Buys Buy WHERE S.Sid IN (SELECT * FROM E1) AND S.Sid IN (SELECT * FROM E2) AND S.Sid = Buy.Sid AND Buy.BookNo = B.BookNo)
SELECT * FROM E3 ORDER BY E3.BookNo;

\echo '3) Find the sid-bookno pairs (s, b) pairs such that student s bought book b and such that book b is cited by at least two books that cost less than $50'
-- WITH
-- E1 AS (SELECT B.BookNo FROM Book B WHERE B.Price < 50),
-- E2 AS (SELECT * FROM Cites C JOIN E1 ON E1.BookNo = C.BookNo),
-- E3 AS (SELECT S.Sid FROM Student S, Buys Buy WHERE Buy.Sid = S.Sid AND Buy.BookNo IN E2)
-- SELECT DISTINCT * FROM E3;

WITH
E1 AS (SELECT DISTINCT Buy.Sid, Buy.BookNo FROM Buys Buy),
E2 AS (SELECT C.CitedBookNo FROM Book B, Cites C, Book B2, Cites C2 WHERE B.BookNo = C.BookNo AND B.Price < 50 AND B.BookNo != B2.BookNo AND C.CitedBookNo = C2.CitedBookNo AND B2.BookNo = C2.BookNo AND B2.Price < 50),
E3 AS (SELECT E1.Sid, E1.BookNo FROM E1 INNER JOIN E2 ON E1.BookNo = E2.CitedBookNo)
SELECT DISTINCT * FROM E3;

\echo '4) Find the sid of each student who bought all books that cost more than $50'
-- WITH
-- E1 AS (SELECT Buy.Sid FROM Buys Buy),
-- E2 AS (SELECT Buy.Sid FROM Book B, Buys Buy WHERE B.Price <= 50 AND Buy.BookNo = B.BookNo)
-- (SELECT E1.Sid FROM E1) EXCEPT (SELECT E2.Sid FROM E2);

-- WITH
-- E1 AS (SELECT Buy.BookNo FROM Buys Buy),
-- E2 AS (SELECT B.BookNo FROM Book B WHERE B.Price > 50)
-- (SELECT S.Sid FROM Student S WHERE (SELECT COUNT(*) FROM ((SELECT E2.BookNo FROM E2) EXCEPT (SELECT E1.BookNo FROM E1)) q) = 0);

WITH
E1 AS (SELECT B.BookNo FROM Book B WHERE B.Price > 50), -- All book > 50
E2 AS (SELECT Buys.Sid, E1.BookNo FROM Buys, E1),
E3 AS (SELECT B.Sid, B.BookNo FROM Buys B WHERE B.BookNo IN (SELECT * FROM E1)),
E4 AS (SELECT * FROM ((SELECT * FROM E2) EXCEPT (SELECT * FROM E3)) _),
E5 AS (SELECT * FROM ((SELECT E3.Sid FROM E3) EXCEPT (SELECT E4.Sid FROM E4)) _)
SELECT * FROM E5;

\echo '5) Find the Bookno of each book that was not bought by any student who majors in CS'

WITH 
E1 AS (SELECT B.BookNo FROM Book B), 
E2 AS (SELECT Buy.BookNo FROM Major M, Buys Buy WHERE M.major = 'CS' AND Buy.Sid = M.Sid),
E3 AS (SELECT * FROM E1 EXCEPT (SELECT * FROM E2))
(SELECT DISTINCT * FROM E3);


\echo '6) Find the Bookno of each book that was not bought by all students who majors in CS'

WITH
E1 AS (SELECT B.BookNo FROM Book B, Major M, Buys Buy WHERE Buy.Sid = M.Sid AND M.Major = 'CS'),
E2 AS (SELECT B.BookNo FROM Book B, Major M, Buys Buy WHERE M.Major != 'CS' AND Buy.Sid = M.Sid),
E3 AS (SELECT * FROM E1 INTERSECT (SELECT * FROM E2))
(SELECT * FROM E3);

\echo '7) Find sid-bookno pairs (s, b) such that not all books bought by student s are books that cite book b'		
-- WITH
-- E1 AS (SELECT C.BookNo FROM Cites C, Book B WHERE B.BookNo != C.CitedBookNo),
-- E2 AS (SELECT S.Sid, B.BookNo FROM Student S, Book B 
-- WHERE EXISTS(SELECT Buy.Sid FROM Buys Buy WHERE S.Sid = Buy.Sid AND EXISTS(SELECT B2.BookNo FROM Book B2 WHERE B2.BookNo = B.BookNo EXCEPT (SELECT * FROM E1))))
-- SELECT COUNT(E2.BookNo) FROM E2;

WITH
E1 AS (SELECT B.Sid, B.BookNo, B2.BookNo AS bno FROM Buys B, Book B2),
E2 AS (SELECT B.Sid, B.BookNo, C.CitedBookNo AS bno FROM Buys B INNER JOIN Cites C ON C.BookNo = B.BookNo),
E3 AS (SELECT * FROM ((SELECT * FROM E1) EXCEPT (SELECT * FROM E2)) _)
SELECT DISTINCT E3.Sid, E3.bno FROM E3;

\echo '8) Find sid-bookno pairs (s, b) such student s only bought books that cite book b'

WITH
E1 AS (SELECT B.Sid, B.BookNo, B2.BookNo AS bno FROM Buys B, Book B2),
E2 AS (SELECT B.Sid, B.BookNo, C.CitedBookNo AS bno FROM Buys B INNER JOIN Cites C ON C.BookNo = B.BookNo),
E3 AS (SELECT * FROM ((SELECT * FROM E1) EXCEPT (SELECT * FROM E2)) _),
E4 AS (SELECT S.Sid, B.BookNo AS bno FROM Student S, Book B),
E5 AS (SELECT * FROM ((SELECT * FROM E4) EXCEPT (SELECT E3.Sid, E3.bno FROM E3)) _)
SELECT DISTINCT E5.Sid, E5.bno AS BookNo FROM E5;