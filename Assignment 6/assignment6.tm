<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|B461 A6>|<doc-author|<author-data|<author-name|Matthew
  ploetz>>>>

  <section|>

  A)\ 

  <\math>
    \<pi\><rsub|S.Sid,B1.BookNo><around*|(|\<sigma\><rsub|S.Sid=b1.Sid AND
    S.Sid=B2.Sid AND B1.BookNo !=B2.BookNo AND
    S.Sname=<rprime|'>Eric<rprime|'> AND b1.BookNo!=2010><around*|(|S\<times\>B1\<times\>B2|)>|)>
  </math>

  B)\ 

  SELECT DISTINCT b.bookno, b.title FROM book b, student s WHERE b.price =
  SOME(select b1.price from buys t, book b1 where b1.price \<gtr\> 50 and
  s.sid = t.sid and t.bookno = b1.bookno);

  <math|SOME<around*|(|select b1.price from buys t, book b1 where b1.price
  \<gtr\> 50 and s.sid = t.sid and t.bookno = b1.bookno|)>>

  <math|\<longrightarrow\>>

  <math|Exists<around*|(|select b1.price from buys t, book b1 where b1.price
  \<gtr\> 50 and s.sid = t.sid and t.bookno = b1.bookno|)>>

  <math|\<longrightarrow\>>

  <math|\<pi\><rsub|B1.Price><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50 AND
  S1.Sid=T.Sid AND T.BookNo=B1.BookNo><around*|(|T\<times\>B1\<times\>S1|)>|)>>

  <math|\<longrightarrow\>>

  (<math|S\<times\>B\<ltimes\><around*|(||\<nobracket\>>\<pi\><rsub|S1.Sname,S1.Sid><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50
  AND S1.Sid=T.Sid AND T.BookNo=B1.BookNo><around*|(|T\<times\>B1\<times\>S1|)>|)>>))

  <\math>
    \<longrightarrow\>
  </math>

  <math|\<pi\><rsub|B.BookNo,B.Title><around*|(||\<nobracket\>>>

  <math|<around*|(|S\<times\>B|)>\<ltimes\><rsub|B.Price=B1.Price><around*|(|\<pi\><rsub|B2.Price><around*|(|\<pi\><rsub|S1.Sname,S1.Sid><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50
  AND S1.Sid=T.Sid AND T.BookNo=B1.BookNo and B2.Price=B1.Price>
  <around*|(|T\<times\>B1\<times\>S1\<times\>B2|)>|)>|)>|)>>)

  C)

  SELECT b.bookno FROM book b WHERE b.bookno IN (SELECT b1.bookno FROM book
  b1 WHERE b1.price \<gtr\> 50) UNION (SELECT c.bookno FROM cites c);

  <math|\<longrightarrow\>>

  select b.bookno from book b where exists(select b1.bookno from book b1
  where b1.price \<gtr\> 50 and b.bookno = b1.bookno) union (select c.bookno
  from cites c)

  <math|\<longrightarrow\>>

  Sub1:

  <math|\<pi\><rsub|B1.BookNo><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50 AND
  B.BookNo=B1.BookNo><around*|(|B1|)>|)>>

  Sub2:

  <math|\<pi\><rsub|C.BookNo><around*|(|C|)>>

  <math|\<longrightarrow\>>

  <math|\<pi\><rsub|B1.BookNo><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50 AND
  B.BookNo=B1.BookNo><around*|(|B1|)>|)>\<cup\>\<pi\><rsub|C.BookNo><around*|(|C|)>>

  <\math>
    \<longrightarrow\>
  </math>

  <math|B\<ltimes\>\<pi\><rsub|B1.BookNo><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50
  AND B.BookNo=B1.BookNo><around*|(|B1|)>|)>\<cup\>\<pi\><rsub|C.BookNo><around*|(|C|)>>

  <\math>
    \<longrightarrow\>
  </math>

  <\math>
    <around*|(|B\<ltimes\><around*|(|\<pi\><rsub|B2.BookNo,B2.Price,B2.Title><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50
    AND B2.BookNo=B1.BookNo><around*|(|B1\<times\>B2|)>|)>\<cup\><around*|(|\<pi\><rsub|C.BookNo><around*|(|C|)>|)>|)>|)>
  </math>

  <math|\<longrightarrow\>>

  <\math>
    \<pi\><rsub|B.BookNo>

    <around*|(|B\<ltimes\><around*|(|\<pi\><rsub|B2.BookNo,B2.Price,B2.Title><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50
    AND B2.BookNo=B1.BookNo><around*|(|B1\<times\>B2|)>|)>\<cup\><around*|(|\<pi\><rsub|C.BookNo><around*|(|C|)>|)>|)>|)>
  </math>

  D)

  <samp|>SELECT b.bookno FROM book b WHERE b.price \<gtr\>= 80 and NOT
  EXISTS(SELECT b1.bookno FROM book b1 WHERE b1.Price \<gtr\> b.Price);

  <\math>
    \<longrightarrow\>
  </math>

  <math|\<pi\><rsub|B1.BookNo><around*|(|\<sigma\><rsub|B1.Price\<gtr\>B2.Price><around*|(|B2\<times\>B1|)>|)>>

  <math|\<longrightarrow\>>

  <math|\<pi\><rsub|B2.BookNo,B2.Title,B2.Price><around*|(|\<sigma\><rsub|B1.Price\<gtr\>B2.Price><around*|(|B2\<times\>B1|)>|)>>

  <math|\<longrightarrow\>>

  <math|\<pi\><rsub|B.BookNo><around*|(|\<sigma\><rsub|B.Price\<geq\>80 and
  ><around*|(|B|)>|)>\<pi\><rsub|B2.BookNo,B2.Title,B2.Price><around*|(|\<sigma\><rsub|B1.Price\<gtr\>B2.Price><around*|(|B2\<times\>B1|)>|)>>

  <math|\<longrightarrow\>>

  <math|\<pi\><rsub|B.BookNo><around*|(|\<sigma\><rsub|B.Price\<geq\>80 and
  ><around*|(|B<wide|\<ltimes\>|\<bar\>>|\<nobracket\>>|\<nobracket\>><around*|(|\<pi\><rsub|B2.BookNo,B2.Title,B2.Price><around*|(|\<sigma\><rsub|B1.Price\<gtr\>B2.Price><around*|(|B2\<times\>B1|)>|)>|)>>

  <math|\<longrightarrow\>>

  <\math>
    \<pi\><rsub|B.BookNo><around*|(|\<sigma\><rsub|B.Price\<geq\>80
    \ ><around*|(|B|)>|)>-

    <around*|(|\<pi\><rsub|B.BookNo><around*|(|\<sigma\><rsub|B.Price\<geq\>80>|)>|(>B\<ltimes\><around*|(|\<pi\><rsub|B2.BookNo,B2.Title,B2.Price><around*|(|\<sigma\><rsub|B1.Price\<gtr\>B2.Price><around*|(|B2\<times\>B1|)>|)>|)>
  </math>

  E)

  SELECT s.sid FROM Student s WHERE EXISTS(SELECT 1 FROM Book b WHERE b.price
  \<gtr\> 50 AND b.bookno IN (SELECT t.bookno FROM Buys t WHERE s.sid = t.sid
  AND s.sname = 'Eric'))

  SELECT s.sid FROM Student s WHERE EXISTS(SELECT 1 FROM Book b WHERE b.price
  \<gtr\> 50 AND EXISTS(SELECT t.bookno FROM Buys t WHERE s.sid = t.sid AND
  s.sname = 'Eric' and b.bookno = t.bookno))

  Sub3:

  <math|\<pi\><rsub|t.BookNo><around*|(|\<sigma\><rsub|S1.Sid=t.Sid and
  s1.Sname=<rprime|'>Eric<rprime|'>><around*|(|S1\<times\>T|)>|)>>

  <math|\<pi\><rsub|t.BookNo><around*|(|\<sigma\><rsub|S1.Sid=t.Sid and
  s1.Sname=<rprime|'>Eric<rprime|'>and B1.BookNo>
  <around*|(|S1\<times\>T\<times\>B1|)>|)>>

  <math|<around*|(|S\<times\>B|)>\<ltimes\>\<pi\><rsub|t.BookNo><around*|(|\<sigma\><rsub|S1.Sid=t.Sid
  and s1.Sname=<rprime|'>Eric<rprime|'>and B1.BookNo>
  <around*|(|S1\<times\>T\<times\>B1|)>|)>>

  Sub2:

  <math|\<pi\><rsub|S1.Sid,S1.Sname><around*|(|\<sigma\><rsub|B.Price\<gtr\>50
  and B.BookNo ><around*|(|B|)>\<ltimes\>\<cal-E\>|)>>

  <math|\<longrightarrow\>>

  <math|\<pi\><rsub|S.Sid><around*|(|S|)>\<ltimes\><rsub|S1.Sid=S.Sid><around*|(|\<pi\><rsub|S1.Sid,S1.Sname><around*|(|\<sigma\><rsub|B.Price\<gtr\>50
  and B.BookNo ><around*|(|B|)>\<ltimes\>\<cal-E\>|)>|)>>

  F)

  SELECT s1.sid, s2.sid FROM student s1, student s2 WHERE s1.sid \ s2.sid
  AND\nNOT EXISTS(SELECT 1\nFROM Buys t1\nWHERE t1.sid = s1.sid
  AND\nt1.bookno NOT IN (SELECT t2.bookno\nFROM Buys t2\nWHERE t2.sid =
  s2.sid));

  SELECT s1.sid, s2.sid FROM student s1, student s2 WHERE s1.sid \ s2.sid
  AND\nNOT EXISTS(SELECT 1\nFROM Buys t1\nWHERE t1.sid = s1.sid AND NOT
  EXISTS (SELECT t2.bookno\nFROM Buys t2\nWHERE t2.sid = s2.sid and t1.bookno
  = t2.bookno));

  <math|T1<wide|\<ltimes\>|\<bar\>>\<pi\><rsub|t2.BookNo><around*|(|\<sigma\><rsub|t2.Sid=S2.Sid
  and t1.BookNo=t2.BookNo><around*|(|T2|)>|)>>

  <math|\<longrightarrow\>>

  <\math>
    <around*|(|T1*\<times\>S2|)>\<ltimes\>\<pi\><rsub|t2.BookNo>

    <around*|(|\<sigma\><rsub|t2.Sid=S3.Sid and
    t3.BookNo=t2.BookNo><around*|(|T2\<times\>T3\<times\>S3|)>-\<sigma\><rsub|t2.Sid=S2.Sid
    and t3.BookNo=t2.BookNo><around*|(|T2\<times\>T3\<times\>S3|)>|)>
  </math>

  <math|\<longrightarrow\>>

  <math|\<pi\><rsub|s1.Sid,S2.Sid><around*|(|\<sigma\><rsub|S1.Sid!=S2.Sid
  ><around*|(|S1\<times\>S2|)>-<around*|(|S1\<times\>S2|)>\<ltimes\>\<pi\><rsub|t1.Sid,T1.BookNo><around*|(|\<sigma\><rsub|t1.Sid=s1.Sid><around*|(|S1\<times\>T1|)>|)>\<ltimes\>\<cal-E\>|)>>

  <section|>

  A)

  <\math>
    \<pi\><rsub|S.Sid,B1.BookNo><around*|(|\<sigma\><rsub|S.Sid=b1.Sid AND
    S.Sid=B2.Sid AND B1.BookNo !=B2.BookNo AND
    S.Sname=<rprime|'>Eric<rprime|'> AND b1.BookNo!=2010><around*|(|S\<times\>B1\<times\>B2|)>|)>
  </math>

  <math|\<longrightarrow\>>

  Take out cross of buys and join them

  <math|\<pi\><rsub|B1.Sid,B1.BookNo><around*|(|\<sigma\><rsub|B1.BookNo!=<rprime|'>2010<rprime|'>><around*|(|B1|)>|)>\<ltimes\><rsub|B1.BookNo!=B2.BookNo
  and B1.Sid=B2.Sid><around*|(|B2|)><rsub|>>

  <\math>
    \<longrightarrow\>
  </math>

  <math|\<pi\><rsub|S.Sid,B1.BookNo><around*|(|\<sigma\><rsub|S.Sname=<rprime|'>Eric<rprime|'>><around*|(|S|)>|)>>

  <\math>
    \<longrightarrow\>
  </math>

  <\math>
    \<pi\><rsub|S.Sid,B1.BookNo><around*|(|\<sigma\><rsub|S.Sname=<rprime|'>Eric<rprime|'>><around*|(|S|)>|)>\<ltimes\><rsub|S.Sid=B1.Sid
    and S.Sid=B2.Sid>\<pi\><rsub|B1.Sid,B1.BookNo>

    <around*|(|\<sigma\><rsub|B1.BookNo!=<rprime|'>2010<rprime|'>><around*|(|B1|)>|)>\<ltimes\><rsub|B1.BookNo!=B2.BookNo
    and B1.Sid=B2.Sid><around*|(|B2|)><rsub|>
  </math>

  B)

  <math|\<pi\><rsub|B.BookNo,B.Title><around*|(||\<nobracket\>>>

  <math|<around*|(|S\<times\>B|)>\<ltimes\><rsub|B.Price=B1.Price><around*|(|\<pi\><rsub|B2.Price><around*|(|\<pi\><rsub|S1.Sname,S1.Sid><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50
  AND S1.Sid=T.Sid AND T.BookNo=B1.BookNo and B2.Price=B1.Price>
  <around*|(|T\<times\>B1\<times\>S1\<times\>B2|)>|)>|)>|)>>)

  <math|\<longrightarrow\>>

  Pull out books

  <math|\<pi\><rsub|B1.BookNo,B1.Price><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50><around*|(|B1|)>|)><rsub|>>

  <math|\<pi\><rsub|T.Sid,B1.Price><around*|(|T|)>\<ltimes\><rsub|T.BookNo=B1.BookNo><around*|(|\<pi\><rsub|B1.Price,B1.BookNo><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50><around*|(|B1|)>|)>|)>>

  <math|\<longrightarrow\>>

  Combine B1,T and S1

  <\math>
    \<pi\><rsub|B1.Price><around*|(|\<sigma\><rsub|S1.Sid><around*|(|S1|)>|)>\<ltimes\><rsub|S1.Sid=T.Sid>\<pi\><rsub|T.Sid,B1.Price><around*|(|T|)>\<ltimes\><rsub|T.BookNo=B1.BookNo><around*|(|\<pi\><rsub|B1.BookNo,B1.Price><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50><around*|(|B1|)>|)>|)>

    \<longrightarrow\>
  </math>

  Reducing

  <math|<rsub|Same Books bought>>

  <math|\<pi\><rsub|B.BookNo,B.Title><around*|(|B|)>\<ltimes\><rsub|B.Price=B1.Price><around*|(|\<pi\><rsub|B1.Price><around*|(|T|)>\<ltimes\><rsub|T.BookNo=B1.BookNo><around*|(|\<pi\><rsub|B1.BookNo,B1.Price><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50><around*|(|B1|)>|)>|)>|)>>

  C)

  \;
</body>

<\initial>
  <\collection>
    <associate|font-base-size|10>
    <associate|page-type|letter>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>