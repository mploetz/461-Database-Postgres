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

  B) SELECT DISTINCT b.bookno, b.title FROM book b, student s WHERE b.price =
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

  <math|<around*|(|S\<times\>B|)>\<ltimes\><around*|(|\<pi\><rsub|S1.Sname,S1.Sid><around*|(|\<sigma\><rsub|B1.Price\<gtr\>50
  AND S1.Sid=T.Sid AND T.BookNo=B1.BookNo><around*|(|T\<times\>B1\<times\>S1|)>|)>|)>>)

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
    <associate|auto-1|<tuple|1|1|..\\..\\..\\..\\AppData\\Roaming\\TeXmacs\\texts\\scratch\\no_name_1.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>