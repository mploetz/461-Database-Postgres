\echo 'Dropping Tables'
DROP TABLE Sailor CASCADE;
DROP TABLE Boat CASCADE;
DROP TABLE Reserves CASCADE;
\echo 'Tables Dropped'
\echo 'Creating and Importing Data to tables'
CREATE TABLE Sailor (
Sid INTEGER,
Sname VARCHAR(20),
Rating INTEGER,
Age INTEGER,
PRIMARY KEY(Sid)
);
CREATE TABLE Boat (
Bid INTEGER PRIMARY KEY,
Bname VARCHAR(15),
Color VARCHAR(15)   
);
CREATE TABLE Reserves (
Sid INTEGER,
Bid INTEGER,
Day VARCHAR(10),
FOREIGN KEY (Sid) REFERENCES Sailor(Sid),
FOREIGN KEY (Bid) REFERENCES Boat(Bid)
);
\echo '2) Inserting values/data into reserves table before the referenced table Boat has any values'
INSERT INTO Reserves VALUES(22, 101, 'Monday');
\echo '2) Trying to drop a table with REFERENCES| Cannot DROP because reserves depends on it'
DROP TABLE Boat;
/* 
\COPY Sailor FROM 'C:\Users\Matt\Desktop\461\Asssignment 1\sailor.txt'; 
\COPY Sailor FROM 'C:\Users\Matt\Desktop\461\Asssignment 1\boat.txt' DELIMITER ',';
\COPY Sailor FROM 'C:\Users\Matt\Desktop\461\Asssignment 1\reserves.txt'; 
*/
INSERT INTO Sailor VALUES(22, 'Dustin', 7, 45);
INSERT INTO Sailor VALUES(29, 'Brutus', 1, 33);
INSERT INTO Sailor VALUES(31, 'Lubber', 8, 55);
INSERT INTO Sailor VALUES(32, 'Andy', 8, 25);
INSERT INTO Sailor VALUES(58, 'Rusty', 10, 35);
INSERT INTO Sailor VALUES(64, 'Horatio', 7, 35);
INSERT INTO Sailor VALUES(71, 'Zorba', 10, 16);
INSERT INTO Sailor VALUES(74, 'Horatio', 9, 35);
INSERT INTO Sailor VALUES(85, 'Art', 3, 25);
INSERT INTO Sailor VALUES(95, 'Bob', 3, 63);
INSERT INTO Boat VALUES(101, 'Interlake', 'blue');
INSERT INTO Boat VALUES(102, 'Interlake', 'red');
INSERT INTO Boat VALUES(103, 'Clipper', 'green');
INSERT INTO Boat VALUES(104, 'Marine', 'red');
INSERT INTO Reserves VALUES(22, 101, 'Monday');
INSERT INTO Reserves VALUES(22, 102, 'Tuesday');
INSERT INTO Reserves VALUES(22, 103, 'Wednesday');
INSERT INTO Reserves VALUES(31, 102, 'Thursday');
INSERT INTO Reserves VALUES(31, 103, 'Friday');
INSERT INTO Reserves VALUES(31, 104, 'Saturday');
INSERT INTO Reserves VALUES(64, 101, 'Sunday');
INSERT INTO Reserves VALUES(64, 102, 'Monday');
INSERT INTO Reserves VALUES(74, 103, 'Tuesday');

\echo '3(a) Sid and Rating of each Sailor'
SELECT Sailor.Sid, Sailor.rating FROM Sailor;

\echo '3(b) Name of each red boat'
SELECT B.Bname FROM Boat B WHERE color = 'red';

\echo '3(c) Color of each boat'
SELECT Boat.color FROM Boat;

\echo '3(d) Every Sailor who reserved a red boat'
SELECT DISTINCT S.Sname
FROM Sailor S, Reserves R, Boat B 
WHERE B.Color = 'red' AND R.bid = B.bid AND R.sid = S.sid;

\echo '3(e) Name of each Boat where the Sailor is over 25 years and reserved a boat'
SELECT DISTINCT B.Bname
FROM Sailor S, Reserves R, Boat B
WHERE S.Age > 25 AND R.bid = B.bid AND S.sid = R.sid;

\echo '3(f) Name of each Salior whose color is not red or green'
SELECT DISTINCT S.Sname
FROM Sailor S, Boat B, Reserves R
WHERE B.color != 'green' AND B.color != 'red' AND R.sid = S.sid AND R.bid = B.bid;

\echo '3(g) Name of each boat that was reserved by a sailor who has reserved a blue and green boat'
SELECT B.Bname 
FROM Boat B, Reserves R, 
((SELECT DISTINCT S.sid
FROM Sailor S, Reserves R, Boat B, 
(SELECT DISTINCT B.bid
FROM Boat B
WHERE B.color = 'green') G
WHERE R.sid = S.sid AND R.bid = G.bid)
INTERSECT
(SELECT DISTINCT S.sid
FROM Sailor S, Reserves R, Boat B, 
(SELECT DISTINCT B.bid
FROM Boat B
WHERE B.color = 'blue') BL 
WHERE R.sid = S.sid AND R.bid = BL.bid)) BG
WHERE BG.sid = R.sid AND R.bid = B.bid;

\echo '3(h) Bids of boats that have not been reserved'
SELECT DISTINCT B.bid
FROM Boat B
WHERE B.bid NOT IN (SELECT R.bid FROM Reserves R);

\echo '3(i) Name of each boat that was reserved by at least two Sailors'
SELECT B.Bname 
FROM Boat B 
WHERE B.bid 
IN (SELECT R.bid FROM Reserves R GROUP BY R.bid HAVING COUNT(R.bid) >= 2);

\echo '3(j) Sids of Sailors who have ONLY reserved ONE Boat'
SELECT DISTINCT R.sid
FROM Reserves R
GROUP BY R.sid
HAVING COUNT(R.sid) = 1;