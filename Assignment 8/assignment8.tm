<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|B461 A8>|<doc-author|<author-data|<author-name|Matthew
  Ploetz>>>>

  <section|>

  <\enumerate-Alpha>
    <item>

    <\enumerate-roman>
      <item><math|4096=M\<cdot\>12+<around*|(|M\<cdot\>1|)>\<cdot\>9>

      <\math>
        M=195

        Log<rsub|195>100000000=3.49\<sim\>3.5=#Nodes to be examined

        10ms\<cdot\>ceiling<around*|(|3.5|)>=<with|font-series|bold|40ms>

        <item>M=195

        Max=log<rsub|<frac|195+1|2>><around*|(|<frac|100000000|2>|)>+1

        =4.89\<sim\>4.9

        ceiling<around*|(|4.9|)>=5\<cdot\>10ms=<with|font-series|bold|50ms>

        <item>7=log<rsub|<frac|195+1|2>><around*|(|<frac|N|2>|)>+1

        <with|font-series|bold|N=1.74\<cdot\>10<rsup|14>>
      </math>

      <item>It would change our branch factor so we would have:

      <\math>
        8192=M\<cdot\>12+<around*|(|M\<cdot\>1|)>\<cdot\>9

        M=389.7

        Max=log<rsub|<frac|389.7|2>><around*|(|<frac|100000000|2>|)>+1

        =4.36\<sim\>4.4=ceiling<around*|(|4.4|)>=5\<cdot\>10ms=<with|font-series|bold|50ms>

        Therefore,this block size would not change our max access time.
      </math>
    </enumerate-roman>

    <item>

    <\enumerate-roman>
      <item><math|<tree|<block|<tformat|<table|<row|<cell|9>>>>>|<block|<tformat|<table|<row|<cell|2>|<cell|7>>>>>|\<rightarrow\><block|<tformat|<table|<row|<cell|9>|<cell|11>>>>>>
      <tree|<block|<tformat|<table|<row|<cell|6>|<cell|9>>>>>||<block|<tformat|<table|<row|<cell|2>>>>>\<rightarrow\><block|<tformat|<table|<row|<cell|6>|<cell|7>>>>>\<rightarrow\><block|<tformat|<table|<row|<cell|9>|<cell|11>>>>>|>><tree|<block|<tformat|<table|<row|<cell|9>>>>>|<tree|<block|<tformat|<table|<row|<cell|6>>>>>|<block|<tformat|<table|<row|<cell|2>>>>>|<math|\<rightarrow\><block|<tformat|<table|<row|<cell|6>|<cell|7>>>>>>>|<tree|<block|<tformat|<table|<row|<cell|10>>>>>|<block|<tformat|<table|<row|<cell|9>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|10>|<cell|11>>>>>>>
      <tree|<block|<tformat|<table|<row|<cell|9>>>>>|<tree|<block|<tformat|<table|<row|<cell|6>>>>>|<block|<tformat|<table|<row|<cell|2>>>>>|<math|\<rightarrow\><block|<tformat|<table|<row|<cell|6>|<cell|7>>>>>>>|<tree|<block|<tformat|<table|<row|<cell|10>|<cell|11>>>>>|<block|<tformat|<table|<row|<cell|9>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|10>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|11>|<cell|14>>>>>>>
      <tree|<block|<tformat|<table|<row|<cell|9>>>>>|<tree|<block|<tformat|<table|<row|<cell|6>>>>>|<block|<tformat|<table|<row|<cell|2>|<cell|4>>>>>|<math|\<rightarrow\><block|<tformat|<table|<row|<cell|6>|<cell|7>>>>>>>|<tree|<block|<tformat|<table|<row|<cell|10>|<cell|11>>>>>|<block|<tformat|<table|<row|<cell|9>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|10>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|11>|<cell|14>>>>>>>

      <item><tree|<block|<tformat|<table|<row|<cell|9>>>>>|<tree|<block|<tformat|<table|<row|<cell|6>>>>>|<block|<tformat|<table|<row|<cell|2>|<cell|4>>>>>|<math|\<rightarrow\><block|<tformat|<table|<row|<cell|6>|<cell|7>>>>>>>|<tree|<block|<tformat|<table|<row|<cell|10>|<cell|11>>>>>|<block|<tformat|<table|<row|<cell|9>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|10>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|11>|<cell|14>>>>>>>
      <tree|<block|<tformat|<table|<row|<cell|9>>>>>|<tree|<block|<tformat|<table|<row|<cell|6>>>>>|<block|<tformat|<table|<row|<cell|4>>>>>|<math|\<rightarrow\><block|<tformat|<table|<row|<cell|6>|<cell|7>>>>>>>|<tree|<block|<tformat|<table|<row|<cell|10>|<cell|11>>>>>|<block|<tformat|<table|<row|<cell|9>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|10>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|11>|<cell|14>>>>>>>
      <tree|<block|<tformat|<table|<row|<cell|9>>>>>|<tree|<block|<tformat|<table|<row|<cell|6>>>>>|<block|<tformat|<table|<row|<cell|4>>>>>|<math|\<rightarrow\><block|<tformat|<table|<row|<cell|6>|<cell|7>>>>>>>|<tree|<block|<tformat|<table|<row|<cell|10>|<cell|11>>>>>|<block|<tformat|<table|<row|<cell|9>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|10>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|11>>>>>>>
      <tree|<block|<tformat|<table|<row|<cell|9>>>>>|<tree|<block|<tformat|<table|<row|<cell|7>>>>>|<block|<tformat|<table|<row|<cell|6>>>>>|<math|\<rightarrow\><block|<tformat|<table|<row|<cell|7>>>>>>>|<tree|<block|<tformat|<table|<row|<cell|10>|<cell|11>>>>>|<block|<tformat|<table|<row|<cell|9>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|10>>>>><math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|11>>>>>>>
      <tree|<block|<tformat|<table|<row|<cell|9>>>>>|<tree|<block|<tformat|<table|<row|<cell|7>>>>>|<block|<tformat|<table|<row|<cell|6>>>>>|<math|\<rightarrow\><block|<tformat|<table|<row|<cell|7>>>>>>>|<tree|<block|<tformat|<table|<row|<cell|11>>>>>|<block|<tformat|<table|<row|<cell|9>>>>>|<math|\<rightarrow\>>|<block|<tformat|<table|<row|<cell|11>>>>>>>
    </enumerate-roman>
  </enumerate-Alpha>

  <section|>

  <\enumerate-Alpha>
    <item>

    <\enumerate-roman>
      <item>

      <\enumerate-alpha>
        <item>

        <item>

        <item>

        <item>
      </enumerate-alpha>

      <item>

      <\enumerate-alpha>
        <item>

        <item>

        <item>
      </enumerate-alpha>
    </enumerate-roman>

    \;
  </enumerate-Alpha>

  <section|>

  <\enumerate-Alpha>
    <item><math|B<around*|(|R|)>=1500000/30,B<around*|(|S|)>=5000/10= M=101
    So using the nested loop alg we get B<around*|(|S|)>+*<around*|(|B<around*|(|R|)>B<around*|(|S|)>/M-1|)>.
    500+*<around*|(|50000\<cdot\>500/101-1|)>=><with|font-series|bold|250500
    block IO's>

    <item><math|5\<cdot\><around*|(|B<around*|(|R|)>+B<around*|(|S|)>|)>=5\<cdot\><around*|(|50000+500|)>=<with|font-series|bold|252500
    block IO<rprime|'>s>>. M1\<gtr\>M2 <math|101\<gtr\>sqrt<around*|(|min<around*|(|B<around*|(|R|)>,B<around*|(|S|)>|)>|)>\<sim\>101\<ngtr\>500.
    But we ignore this as instructed.>

    <item><math|3\<cdot\><around*|(|50000+500|)>=<with|font-series|bold|151500
    block IO<rprime|'>s>>
  </enumerate-Alpha>

  <section|>

  <\enumerate-Alpha>
    <item>Yes, R1(z)R2(x)R1(x)R2(y)R1(y) eqv.

    <item>Not serializable. Because we write at W2(y) and later come back to
    read at R1(y) so it is not in chronological order and is a cycle which we
    cannot have for a schedule.

    <item>No, because we wrote to W2(x) but did not read to it after it
    before writing again with W1(x). So its overwritten and value was not
    locked.
  </enumerate-Alpha>

  <section|>

  Let T1=R1(A) W1(A) R1(B) W1(B)

  T2=R2(A) W2(A) R2(B) W2(B)

  T3=R3(B) W3(B) R3(A) W3(A)

  S=R1(A) W1(A) R2(A) W2(A) R1(B) W1(B) R2(B) W2(B) R3(B) W3(B) R3(A) W3(A)

  S1=R1(B) W1(B) R1(A) W1(A) R2(A) W2(A) \ R2(B) W2(B) R3(B) W3(B) R3(A)
  W3(A)

  S2= R2(A) W2(A) R1(A) W1(A) R1(B) W1(B) R2(B) W2(B) R3(B) W3(B) R3(A) W3(A)

  <section|>

  Let T1=R1(A) W1(A) R1(B) W1(B)

  T2=R2(A) W2(A) R2(B) W2(B)

  T3=R3(B) W3(B) R3(A) W3(A)

  S=R1(A) W1(A) R2(A) W2(A) R1(B) W1(B) R2(B) W2(B) R3(B) W3(B) R3(A) W3(A)

  Yes, because since there are no conflictinig pairs then any number of non
  conflicting swaps and adjacent swaps can transform them to be serial
  schedules.

  <section|>

  S=R1(A) W1(A) R1(B) W1(B) R1(C) W1(C) R2(A) R2(B) W2(A) W2(B) R2(C) R3(C)
  W3(A) W3(B) W3(C)

  T1=R1(A)W1(A)R1(B)W1(B)R1(C)W1(C)

  T2=R2(A)R2(B)W2(A)W2(B)R2(C)W2(C)

  T3=R3(A)R3(B)W3(A)W3(B)R3(C)W3(C)

  <section|>

  <\enumerate-Alpha>
    <item><math|For schedule <around*|(|T<rsub|1>,T<rsub|2>|)>,A=0 and B=0.
    After first transaction B=1,since A=0 and we write to B. So we have A=0
    and B=1. Then we do transaction2 and nothing happens>

    <\math>
      because B is not 0. So we end up with A=0 and B=1,thus since at least
      one of the values are 0 the\ 

      the consistency requirement is met.
    </math>

    <\math>
      For <around*|(|T<rsub|2>,T<rsub|1>|)> A=0 and B=0,then after
      T<rsub|2>we get A=1 because B=0 and we increment and write\ 

      to A. Then we go to T<rsub|1> and since A\<neq\>0 nothing changes. So
      we end up with A=1 and B=1,thus since we have at least on e of the
      values are 0 then the consistency requirement is met.
    </math>

    <item><math|S=R1<around*|(|A|)> R2<around*|(|B|)> R1<around*|(|B|)>
    R2<around*|(|A|)> W1<around*|(|B|)> W2<around*|(|A|)>>

    <item><math|No,because each serial schedule results with T<rsub|1> action
    and T<rsub|2> action conflict with each other,therefore there cannot be a
    schedule made non-serial that will be a serializable schedule.>
  </enumerate-Alpha>
</body>

<initial|<\collection>
</collection>>

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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>