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
    <item>

    <item>

    <item>
  </enumerate-Alpha>

  <section|>

  <\enumerate-Alpha>
    <item>

    <item>

    <item>
  </enumerate-Alpha>

  <section|>

  <section|>

  <section|>

  <section|>

  <\enumerate-Alpha>
    <item>

    <item>

    <item>
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