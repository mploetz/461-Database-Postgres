<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|B461 Assingment 4>|<doc-author|<\author-data|<author-name|Matthew
  Ploetz>>
    \;
  </author-data|>>>

  <assign|join|<syntax|\<join\>|>>

  <section|>

  <math|Q:Find the bookno of each book that is cited by at least one book
  that cost cost less than $50.>

  <\equation*>
    \<pi\><rsub|CitedBookNo><around*|(|Book <value|join>
    <rsub|C.BookNo=B.BookNo\<wedge\>B.Price\<less\>50> <rsub|>Cites|)>
  </equation*>

  <section|>

  Q: Find the bookno and title of each book that was bought by a student who
  majors in CS and in Math.

  <\equation*>
    <tabular|<tformat|<cwith|1|1|1|-1|cell-tborder|0ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-tborder|1ln>|<cwith|1|1|2|2|cell-rborder|0ln>|<cwith|1|1|1|1|cell-tborder|0ln>|<cwith|6|6|1|1|cell-bborder|0ln>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|-1|2|2|cell-lborder|1ln>|<table|<row|<cell|Expression
    Name>|<cell|RA Expression>>|<row|<cell|E<rsub|1>>|<cell|\<pi\><rsub|M.Sid><around*|(|Major
    \<sigma\><rsub|M.Major=<rprime|'>Math<rprime|'>>|)>>>|<row|<cell|E<rsub|2>>|<cell|\<pi\><rsub|M.Sid><around*|(|Major
    \<sigma\><rsub|M.Major=<rprime|'>CS<rprime|'>>|)>>>|<row|<cell|E<rsub|3>>|<cell|\<pi\><rsub|B.BookNo,B.Title><around*|(|\<sigma\><rsub|S.Sid=M.Sid><around*|(|E<rsub|1>|)><rsub|\<wedge\>S.Sid=M.Sid><around*|(|E<rsub|2>|)>|\<nobracket\>>>>|<row|<cell|>|<cell|<around*|\<nobracket\>|<rsub|\<wedge\>S.Sid=Buy.Sid\<wedge\>Buy.BookNo=B.BookNo>Book\<times\>Student\<times\>Buy|)><rsub|>>>|<row|<cell|F>|<cell|\<pi\><rsub|BookN\<omicron\>><around*|(|E<rsub|3>|)>>>>>>
  </equation*>

  <section|>

  Q:Find the sid-bookno pairs (s, b) pairs such student s bought book b and
  such that book b is cited by at least two books that cost less than $50.

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|Expression Name>|<cell|RA
    Expression>>|<row|<cell|E<rsub|1>>|<cell|\<pi\><rsub|Sid,BookNo><around*|(|Buys|)>>>|<row|<cell|E<rsub|2>>|<cell|\<pi\><rsub|CitedBookNo><around*|(|\<sigma\><rsub|B.BookNo=C.BookNo\<wedge\>B.Price\<less\>50\<wedge\>B.BookNo!=B2.BookNo\<wedge\>C.CitedBookNo=C2.CitedBookNo\<wedge\>B2.Price\<less\>50><around*|(|Book
    B\<times\>Cites C\<times\>Book B2\<times\>Cites
    C2|)>|)>>>|<row|<cell|E<rsub|3>>|<cell|\<pi\><rsub|E<rsub|1>.Sid,E<rsub|1>.BookNo><around*|(|E<rsub|1><value|join>\<sigma\><rsub|E<rsub|1>.BookNo=E<rsub|2>.CitedBookNo>E<rsub|2>|)>>>|<row|<cell|F>|<cell|\<pi\><rsub|Sid,BookNo><around*|(|E<rsub|3>|)>>>>>>
  </equation*>

  <section|>

  Q: Find the sid of each student who bought all books that cost more than
  $50.

  <\equation*>
    <tabular|<tformat|<cwith|1|1|1|-1|cell-tborder|0ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|2|2|1|-1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|2|2|cell-rborder|0ln>|<table|<row|<cell|Expression
    Name>|<cell|RA Expression>>|<row|<cell|E<rsub|1>>|<cell|\<pi\><rsub|BookNo><around*|(|\<sigma\><rsub|Price\<gtr\>50><around*|(|Book|)>|)>>>|<row|<cell|E<rsub|2>>|<cell|\<pi\><rsub|Buys.Sid,E<rsub|1>.BookNo><around*|(|Buys\<times\>E<rsub|1>|)>>>|<row|<cell|E<rsub|3>>|<cell|\<pi\><rsub|Sid,BookNo><around*|(|\<sigma\><rsub|BookNo=E<rsub|1>.BookNo><around*|(|Buys*\<times\>E<rsub|1>|)>|)>>>|<row|<cell|E<rsub|4>>|<cell|E<rsub|2>-E<rsub|3>>>|<row|<cell|E<rsub|5>>|<cell|\<pi\><rsub|Sid><around*|(|E<rsub|3>-E<rsub|4>|)>>>|<row|<cell|F>|<cell|\<pi\><rsub|Sid><around*|(|E<rsub|5>|)>>>>>>
  </equation*>

  <section|>

  Q: Find the Bookno of each book that was not bought by any student who
  majors in CS.

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|Expression Name>|<cell|RA
    Expression>>|<row|<cell|E<rsub|1>>|<cell|\<pi\><rsub|BookNo><around*|(|Book|)>>>|<row|<cell|E<rsub|2>>|<cell|\<pi\><rsub|Buy.BookNo><around*|(|\<sigma\><rsub|Major=<rprime|'>CS<rprime|'>\<wedge\>Buy.Sid=M.Sid><around*|(|Major\<times\>Buys|)>|)>>>|<row|<cell|E<rsub|3>>|<cell|E<rsub|1>-E<rsub|2>>>|<row|<cell|F>|<cell|\<pi\><rsub|BookNo><around*|(|E<rsub|3>|)>>>>>>
  </equation*>

  <section|>

  Q: Find the Bookno of each book that was not bought by all students who
  majors in CS.

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|Expression Name>|<cell|RA
    Expression>>|<row|<cell|E<rsub|1>>|<cell|\<pi\><rsub|B.BookNo><around*|(|\<sigma\><rsub|Buy.Sid=M.Sid\<wedge\>M.Major=<rprime|'>CS<rprime|'>><around*|(|Book
    B\<times\>Major\<times\>Buys|)>|)>>>|<row|<cell|E<rsub|2>>|<cell|\<pi\><rsub|B.BookNo><around*|(|\<sigma\><rsub|M.Major!=<rprime|'>CS<rprime|'>\<wedge\>Buy.Sid=M.Sid><around*|(|Book
    \<Beta\>\<times\>Major M\<times\>Buys|)>|)>>>|<row|<cell|E<rsub|3>>|<cell|E<rsub|1>\<cap\>E<rsub|2>>>|<row|<cell|F>|<cell|\<pi\><rsub|BookNo><around*|(|E<rsub|3>|)>>>>>>
  </equation*>

  <section|>

  Q: Find sid-bookno pairs (s, b) such that not all books bought by student s
  are books that cite book b.

  <\equation*>
    <tabular|<tformat|<table|<row|<cell|Expression Name>|<cell|RA
    Expression>>|<row|<cell|E<rsub|1>>|<cell|\<pi\><rsub|B.Sid,B.BookNo,B2.BookNo
    AS bno><around*|(|Buys B\<times\>Book
    B2|)>>>|<row|<cell|E<rsub|2>>|<cell|\<pi\><rsub|B.Sid,B.BookNo,C.CitedBookNo
    AS bno><around*|(|Buys B<value|join><rsub|C.BookNo=B.BookNo>Cites
    C|)>>>|<row|<cell|E<rsub|3>>|<cell|E<rsub|1>-E<rsub|2>>>|<row|<cell|F>|<cell|\<pi\><rsub|E<rsub|3>.Sid,E<rsub|3>.BookNo><around*|(|E3|)>>>>>>
  </equation*>

  <section|>

  Q: Find sid-bookno pairs (s, b) such student s only bought books that cite
  book b.

  <math|<tabular|<tformat|<table|<row|<cell|Expression Name>|<cell|RA
  Expression>>|<row|<cell|E<rsub|1>>|<cell|\<pi\><rsub|B.Sid,B.BookNo,B2.BookNo
  AS bno><around*|(|Buys B\<times\>Book B2|)>>>|<row|<cell|E<rsub|2>>|<cell|\<pi\><rsub|B.Sid,B.BookNo,C.CitedBookNo
  AS bno><around*|(|Buys B<value|join><rsub|C.BookNo=B.BookNo>Cites
  C|)>>>|<row|<cell|E<rsub|3>>|<cell|E<rsub|1>-E<rsub|2>>>|<row|<cell|E<rsub|4>>|<cell|\<pi\><rsub|S.Sid,B.BookNo
  AS bno><around*|(|Students S\<times\>Book
  B|)>>>|<row|<cell|E<rsub|5>>|<cell|E<rsub|4>-\<pi\><rsub|E3.Sid,E3.bno><around*|(|E<rsub|3>|)>>>|<row|<cell|F>|<cell|\<pi\><rsub|E<rsub|5>.Sid,E<rsub|5>.bno
  AS BookNo><around*|(|E<rsub|5>|)>>>>>>>
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|page-type|letter>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|3|?>>
    <associate|auto-4|<tuple|4|?>>
    <associate|auto-5|<tuple|5|?>>
    <associate|auto-6|<tuple|6|?>>
    <associate|auto-7|<tuple|7|?>>
    <associate|auto-8|<tuple|8|?>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>