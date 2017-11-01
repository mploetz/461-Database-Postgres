SELECT s.sid
FROM   Student s
WHERE  EXISTS(SELECT 1
              FROM Book b
              WHERE b.price > 50 AND
                    b.bookno IN (SELECT  t.bookno
                                 FROM    Buys t
                                 WHERE   s.sid = t.sid AND s.sname = 'Eric'));

SELECT s1.sid, s2.sid
FROM student s1, student s2
WHERE s1.sid <> s2.sid AND
      NOT EXISTS(SELECT 1
                 FROM   Buys t1
                 WHERE  t1.sid = s1.sid AND
                        t1.bookno NOT IN (SELECT t2.bookno
                                          FROM   Buys t2
                                          WHERE  t2.sid = s2.sid));
