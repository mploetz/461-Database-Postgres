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

create or replace function setunion(A anyarray, B anyarray) returns anyarray as
$$
with
Aset as (select UNNEST(A)),
Bset as (select UNNEST(B))
select array( (select * from Aset) union (select * from Bset) order by 1);
$$ language sql;

\echo '1) A) Create function setintersection that computes the intersection  of two sets.'
CREATE OR REPLACE FUNCTION setintersection(A anyarray, B anyarray) returns anyarray as
$$
    WITH
    Aset AS (SELECT UNNEST(A)),
    Bset AS (SELECT UNNEST(B))
    SELECT ARRAY( (SELECT * FROM Aset) INTERSECT (SELECT * FROM Bset) ORDER BY 1);
$$ LANGUAGE SQL;

\echo '1) B) Create function setdifference that computes the difference between two sets.'
CREATE OR REPLACE FUNCTION setdifference(A anyarray, B anyarray) RETURNS anyarray AS
$$
    WITH
    Aset AS (SELECT UNNEST(A)),
    Bset AS (SELECT UNNEST(B))
    SELECT ARRAY((SELECT * FROM Aset) EXCEPT (SELECT * FROM Bset) ORDER BY 1);
$$ LANGUAGE SQL;

create or replace function memberof(x anyelement, S anyarray) returns boolean as
$$
select x = SOME(S)
$$ language sql;


create or replace view student_books as
select s.sid, array(select t.bookno
from buys t
where t.sid = s.sid order by bookno) as books
from student s order by sid;

SELECT * FROM student_books;

\echo '2) A) Define a view book_students(bookno,students) which associates with each book the set of students who bought that book. Observe that there may be books that are not bought by any student.'

CREATE OR REPLACE VIEW book_students AS
SELECT B.BookNo, ARRAY(SELECT By.Sid 
FROM Buys By
WHERE By.BookNo = B.BookNo ORDER BY Sid) AS students
FROM Book B ORDER BY BookNo;

SELECT * FROM book_students;

\echo '2) B)Define a view book_citedbooks(bookno,citedbooks) which associates with each book the set of books that are cited by that book.'
\echo 'Observe that there may be books that cite no books.'

CREATE OR REPLACE VIEW book_citedbooks AS
SELECT B.BookNo, ARRAY(SELECT C.CitedBookNo
FROM Cites C 
WHERE C.BookNo = B.BookNo ORDER BY CitedBookNo) AS CitedBooks
FROM Book B ORDER BY BookNo;

SELECT * FROM book_citedbooks;

\echo '2) C) Define a view book citingbooks(bookno,citingbooks) which associates'
\echo 'with each book the set of books that cites that book. Observe'
\echo 'that there may be books that are not cited.'

CREATE OR REPLACE VIEW book_citingbooks AS
SELECT B.BookNo, ARRAY(SELECT C.BookNo 
FROM Cites C
WHERE C.CitedBookNo = B.BookNo ORDER BY CitedBookNo) AS citingbooks
FROM Book B ORDER BY BookNo;

SELECT * FROM book_citingbooks;

\echo '2) D) Define a view major_students(major,students) which associates'
\echo 'with each major the set of students who have that major.'

CREATE OR REPLACE VIEW major_students AS
SELECT DISTINCT M.Major, ARRAY(SELECT S.Sid
FROM Student S
WHERE S.Sid IN (SELECT M2.Sid FROM Major M2 WHERE M2.Major = M.Major) ORDER BY Sid) AS students
FROM Major M ORDER BY Major;

SELECT * FROM major_students;

\echo '2) E) Define a view student majors(sid,majors) which associates with'
\echo 'each student the set of his or her majors. Observe that there can be'
\echo 'students who have no major'

CREATE OR REPLACE VIEW student_majors AS
SELECT S.Sid, ARRAY(SELECT DISTINCT M.Major
FROM Major M
WHERE M.Major IN (SELECT M2.Major FROM Major M2 WHERE M2.Sid = S.Sid) ORDER BY Major) AS major
FROM Student S ORDER BY Sid;

SELECT * FROM student_majors;

\echo '3) A) Find the bookno of each book that is cited by at least two books that cost less than $50.'

SELECT DISTINCT B.BookNo
FROM Book B, book_citingbooks BC
WHERE B.Price < 50 AND CARDINALITY(BC.citingbooks) > 1 AND B.BookNo = BC.BookNo ORDER BY BookNo;

\echo '3) B) Find the bookno and title of each book that was bought by a student who majors in CS and in Math.'

SELECT DISTINCT B.BookNo, B.Title
FROM Book B, book_students BS, student_majors SM
WHERE B.BookNo = BS.BookNo AND memberof(SM.Sid, BS.students) AND memberof('Math', SM.Major) AND memberof('CS', SM.Major) ORDER BY BookNo;

\echo '3) C) Find the bookno of each book that is cited by exactly one book.'

SELECT BC.BookNo
FROM book_citingbooks BC
WHERE CARDINALITY(BC.citingbooks) = 1 ORDER BY BookNo;

\echo '3) D) Find the sid of each student who bought all books that cost more than $50.'

SELECT DISTINCT SB.Sid
FROM student_books SB
WHERE CARDINALITY(setdifference(SB.books, ARRAY(SELECT B.BookNo FROM Book B WHERE B.Price > 50))) = 0 
AND CARDINALITY(setdifference(ARRAY(SELECT B.BookNo FROM Book B WHERE B.Price > 50), SB.books)) = 0;

\echo '3) E) Find the sid of each student who bought no book that cost more than $50.'

SELECT DISTINCT SB.Sid
FROM student_books SB
WHERE NOT EXISTS(SELECT B.BookNo FROM Book B
WHERE memberof(B.BookNo, SB.books) AND B.Price > 50);

/* CARDINALITY(setdifference(SB.books, ARRAY(SELECT B.BookNo FROM Book B WHERE B.Price > 50))) > 0
AND CARDINALITY(setdifference(SB.books, ARRAY(SELECT B.BookNo FROM Book B WHERE B.Price < 50))) > 0; */

\echo '3) F) Find the sid of each student who bought only books that cost more than $50'

SELECT SB.Sid
FROM student_books SB
WHERE NOT EXISTS(SELECT B.BookNo
FROM Book B
WHERE memberof(B.BookNo, SB.books) AND B.Price <= 50);

\echo '3) G) Find the sid of each students who bought exactly one book that cost less than $50.'

SELECT SB.Sid
FROM student_books SB, Student S
WHERE CARDINALITY(ARRAY(SELECT B.BookNo FROM Book B WHERE memberof(B.BookNo, SB.books) AND B.Price < 50)) = 1
AND S.Sid = SB.Sid ORDER BY Sid;

\echo '3) H) Find the bookno of each book that was not bought by any students who majors in CS.'

SELECT DISTINCT BS.BookNo
FROM book_students BS
WHERE NOT EXISTS(SELECT S.Sid FROM Student S, student_majors SM
WHERE memberof(S.Sid, BS.students) AND S.Sid = SM.Sid AND memberof('CS', SM.Major));

\echo '3) I) Find the Bookno of each book that was not bought by all students who majors in Anthropology.'

SELECT DISTINCT BS.BookNo
FROM book_students BS
WHERE NOT EXISTS(SELECT S.Sid FROM Student S, student_majors SM
WHERE memberof(S.Sid, BS.students) AND S.Sid = SM.Sid AND memberof('Anthropology', SM.Major)) ORDER BY BookNo;

\echo '3) J) Find sid-bookno pairs (s, b) such that not all books bought by student s are books that cite book b.'
/*
SELECT SB.Sid, BC.BookNo
FROM student_books SB, book_citedbooks BC
WHERE NOT EXISTS(SELECT ) */

SELECT SB.Sid, BC.BookNo
FROM student_books SB, book_citingbooks BC
WHERE CARDINALITY(setdifference(SB.books, BC.citingbooks)) > 0;

\echo '3) K) Find sid-bookno pairs (s, b) such student s only bought books that cite book b.'

SELECT SB.Sid, BC.BookNo
FROM student_books SB, book_citingbooks BC
WHERE CARDINALITY(setdifference(SB.books, BC.citingbooks)) = 0;

\echo '3) L)  Find the pairs (s1, s2) of different sids of students that buy the same books.'

SELECT SB.Sid AS s1, SB2.Sid AS s2
FROM student_books SB, student_books SB2
WHERE CARDINALITY(setdifference(SB.books, SB2.books)) = 0 AND
CARDINALITY(setdifference(SB2.books, SB.books)) = 0 AND
SB.Sid != SB2.Sid;

\echo '3) M) Find the pairs (s1, s2) of different sids of students that buy the same number of books.'

SELECT SB.Sid, SB2.Sid
FROM student_books SB, student_books SB2
WHERE CARDINALITY(SB.books) = CARDINALITY(SB2.books) AND SB.Sid != SB2.Sid;

\echo '3) N) Find the bookno of each book that cites all but two books.'

SELECT DISTINCT CB.BookNo
FROM book_citingbooks BC, book_citedbooks CB
WHERE CARDINALITY(setintersection(BC.citingbooks, CB.citedbooks)) = 2;
