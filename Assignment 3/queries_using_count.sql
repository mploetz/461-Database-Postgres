-- QUERY 1
-- Find sids of who bought no books (various formulations)

-- Using set difference EXCEPT

(select s.sid
 from   student s)
except
(select t.sid
 from   buys t);


-- Using NOT IN predicate
select s.sid
from   student s
where s.sid not in (select t.sid
                     from   buys t);


-- Using  <> ALL predicate
select s.sid
from   student s
where  s.sid <> ALL(select t.sid
                    from   buys t);

-- Using NOT EXISTS predicate

select s.sid
from   student s
where  not exists( select t.bookno
                   from   buys t
                   where  t.sid = s.sid);

-- Using counting (standard rewriting)

select s.sid
from   student s
where  (select count(1) from (select t.bookno
                              from   buys t
                              where  t.sid = s.sid) q) = 0;

-- optimization of counting query above

select s.sid
from   student s
where  (select count(t.bookno)
        from   buys t
        where  t.sid = s.sid) = 0;

-- With a  user-defined function

create or replace function size_of_books_bought_by_student(s int) returns bigint AS 
$$
  select count(t.bookno)
  from   buys t
  where  t.sid = s;
$$ language sql;


select s.sid 
from   student S 
where  size_of_books_bought_by_student(s.sid) =0;



-----------------
-- QUERY 2
-- Find sids of who bought at least 4 books

-- Using the counting method

select s.sid
from   student s
where  (select count(t.bookno)
        from   buys t
        where  t.sid = s.sid) >= 4;

-- With user-defined function


select s.sid 
from   student S 
where  size_of_books_bought_by_student(s.sid) >=  4;



-------------------
-- QUERY 3
-- Find the sids of students who buy only books that cost more than $50


-- Strategy:
-- a. Consider the set Buys(sid) = {bookno| buys(sid,bookno}
-- i.e. the set of books bought by sid

-- This set can be specified with a sub-query

-- select t.bookno
-- from   buys t
-- where  t.sid = s.sid    -- s is a variable ranging over the student table

-- b. Then consider the set of all books that cost more than $50.  Call this set Book_less_than_50
--    This set can be specified using a query

-- select b.bookno
-- from   book b
-- where  b.price > 50


-- The query can now be formulated as follows
-- {sid |  Buys(sid) is a subset of Book_less_than_30}
-- or equivalently

-- {sid |  count(Buys(sid) - Book_less_than_50) = 0}

-- We can put all of this together and write the query

select s.sid
from   student s
where   (select count(*) from ((select t.bookno from buys t where t.sid = s.sid)
                                except 
                               (select b.bookno from book b where b.price > 50)) q) = 0;


-- QUERY 4
-- FInd the sids that buy all books that cost more that $50

select s.sid
from   student s
where   (select count(*) from ((select b.bookno from book b where b.price > 50)
                               except
                               (select t.bookno from buys t where t.sid = s.sid)) q) = 0;


-- QUERY 5
-- FInd the sids that buy at least 3 books that cost more that $20

select s.sid
from   student s
where   (select count(*) from ((select t.bookno from buys t where t.sid = s.sid)
                               intersect
                               (select b.bookno from book b where b.price > 20)) q) >= 3;


-- QUERY 3
--  Find the pairs of student sid (s1,s2) such that student s1 buys all but 3 books that
-- are  bought by student s2


select s1.sid, s2.sid
from   student s1, student s2
where   (select count(*) from ((select t2.bookno from buys t2 where t2.sid = s2.sid)
                               except
                               (select t1.bookno from buys t1 where t1.sid = s1.sid)) q) = 3;