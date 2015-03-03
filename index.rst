.. Continuation documentation master file, created by
   sphinx-quickstart on Mon Feb 23 20:15:54 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

============
 継続勉強会
============

継続勉強会
==========

2015/03/03

桃の節句

.. s6:: styles

    h2: {fontSize:'130%', textAlign:'center', marginTop:'10%'},
    p: {fontSize:'50%', textAlign:'center', marginLeft: 'auto', marginRight: 'auto', marginBottom: '5px', marginTop: '5px'},
    'p[0]': {marginTop: '100px'},
    'p[1]': {marginBottom: '40px'},


やること
========

- 継続とは
- 継続渡しスタイル

  - CPS 変換
  - JS における継続渡し

- call/cc
  - 限定継続


.. s6:: styles

   ul: {'fontSize': '60%'}


まえがき
========

| プログラミングの世界の概念には、禅の公案のようなものがある。それを説明する文章はほんの一文なのに、最初に目にする時、その文は全く意味をなさない、暗号のように感じられる。だがひとたびその概念を理解すると、その概念の説明は確かにその一文で説明されているのがわかるのだ。
| そんな、「分かれば分かる」という禅問答の中でも「継続」は最も謎めいたものの一つと言えるだろう。文献を紐解くと、継続とは「これから行われるであろう計算をパッケージ化したもの」とある。そして、lambdaだらけの説明が後に続くのが普通だ。実は、分かってしまえばlambdaを使うのが最も正確かつ簡潔な説明なのだが、分かるまではあまり役に立たない。

`なんでも継続 <http://practical-scheme.net/docs/cont-j.html>`__ より


.. s6:: styles

   'div': {fontSize: '40%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', background: '#cccccc'},
   'p': {textAligh: 'right', fontSize: '40%'}


継続とは
========

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


継続とは
========

次に処理するべき内容をまとめたもの

.. s6:: styles

   p: {fontSize: '70%', width: '100%', textAlign: 'center'}


何言ってるかよくわからない?
===========================

.. s6:: styles

   h2: {fontSize:'100%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


多分普通です
============

.. s6:: styles

   h2: {fontSize:'100%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


継続渡しスタイル
================

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


継続渡しスタイル
================

- 継続とは

  - 次に処理するべき手続きのこと

- 継続を渡すとは

  - 関数の引数として次に処理するべき継続を渡すこと

- 継続渡しスタイルとは

  - 呼び出す関数の引数に次に処理するべき継続を渡していって、次へ次へと処理を進めるスタイル
  - Continuation Passing Style (CPS)


.. s6:: styles

   ul: {'fontSize': '50%'}


ここに普通の関数があるじゃろ?
=============================

.. literalinclude:: notcps1.py

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


関数呼び出し
============

.. seqdiag::
   :width: 1200

   {
     main -> add [label='Call add'];
     main <-- add [label='return to main'];
   }


.. s6:: styles

   div: {height:'100%', width:'100%', fontSize:'15%'}


関数呼び出し
============

- main から add を呼び出す
- add に処理が移る
- add が終わったら main に戻る
- add を呼び出した後の処理を **継続** する


.. s6:: styles

   ul: {'fontSize': '50%'}


( ^ω^) こうじゃ
===============

.. literalinclude:: cps1.py

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


関数呼び出しと継続
==================

- main から add を呼び出す時に継続を渡す
- add に処理が移る
- add の最後で main から渡ってきた **継続** を呼び出す

.. s6:: styles

   ul: {'fontSize': '50%'}


こんな感じ
==========

.. seqdiag::
   :width: 1200

   {
     main -> add [label='Call add with continuation'];
     add -> Continuation [label='call continuation that passed from main'];
   }


.. s6:: styles

   div: {height:'100%', width:'100%', fontSize:'15%'}


話は変わりますが
================

.. s6:: styles

   h2: {fontSize:'100%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


こんなの見たことありませんか?
=============================

.. s6:: styles

   h2: {fontSize:'90%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


こんなのとか
============

.. literalinclude:: get.js
   :language: javascript


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'},
   p: {fontSize: '50%'}



こんなのとか
============

.. literalinclude:: file.js
   :language: javascript


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


Node.js のコールバックスタイル
==============================

- 最後に渡すコールバックはそれぞれの関数の処理が終わったら呼び出される

  - 関数の後に処理するべき **継続**

- コールバックスタイルは継続渡しスタイルと言える
- Promise も同様

.. s6:: styles

   ul: {'fontSize': '50%'}


再帰関数を継続渡しスタイルに
============================

.. literalinclude:: notcps2_.py

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


再帰関数を継続渡しスタイルに
============================

.. literalinclude:: cps2_.py

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


再帰関数を継続渡しスタイルに
============================

- 結果を受け取った後に n を掛ける必要があるので結果を受け取る継続を作る
- 作った継続の中で結果に n を掛けて元の継続に渡す

.. s6:: styles

   ul: {'fontSize': '50%'}


簡単だよね?
===========

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


もうちょっと複雑な再帰関数
==========================

.. literalinclude:: notcps3.py


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


もうちょっと複雑な再帰関数
==========================

.. literalinclude:: cps3.py

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


継続渡しスタイルへの変換
========================

- fib(n-1) の継続を用意する

  - その中で fib(n-2) の継続を用意する

    - その中で fib(n-1) の結果と fib(n-2) の結果を足して元の関数に渡ってきた継続に渡す
    - 再帰するたびクロージャ増えるね

      - ぽぽぽぽーん


.. s6:: styles

   ul: {'fontSize': '50%'}


Callback Hell!!
===============

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


ちょっと変更
============

.. literalinclude:: notcps2.py

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


再帰関数を継続渡しスタイルに
============================

.. literalinclude:: cps2.py

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


再帰関数を継続渡しスタイルに
============================

- fact の他に計算途中の値も受け取る `fact_` を作る

  - `fact_` の中で `fact_` 自身を呼び出す
  - 終了条件に到達したら渡ってきた継続に値を渡して呼び出す
  - そうでなければ `fact_` 自身を呼び出す

- 再帰的に呼び出してもクロージャが増えない

  - ぽぽぽぽーんしない

- fib の場合はどうがんばってもぽぽぽぽーんする

.. s6:: styles

   ul: {'fontSize': '50%'}


fib と fact の違い
==================

- fact2 と fact1, fib の違いは末尾呼び出しであるかどうか
- 末尾呼び出しの場合においては、呼び出す関数に渡す継続はその関数に渡ってきた継続と同じになる

  - 処理中の関数の状態を破棄していい

- 末尾呼び出しでない関数の場合は、その関数の結果を受け取る継続を作ってその中で処理を続ける必要がある

  - 継続を作って、その時の実行環境と共に次の関数に渡す
  - 処理中の関数の状態を破棄できない


.. s6:: styles

   ul: {'fontSize': '50%'}


継続渡しスタイルのなにが嬉しい?
===============================

- 継続渡しスタイルは処理の続きを明示的に関数に渡していく

  - 手続きからの復帰が継続の呼び出しとして表される
  - 計算の途中の値がすべて陽に名前を与えられる
  - 引数の評価順序が陽に表される
  - 末尾呼び出しは呼び出される手続きに呼び出し側と同じ継続を渡すことにあたる

- CPS はコンパイル時の中間表現として使われる

  - 上記利点から最適化などを行う前段階としてつかうことがあるらしい
  - 静的単一代入形式(SSA)と等価なもの
  - 処理系を作る人には嬉しいらしい

- `Wikipedia より <http://ja.wikipedia.org/wiki/%E7%B6%99%E7%B6%9A%E6%B8%A1%E3%81%97%E3%82%B9%E3%82%BF%E3%82%A4%E3%83%AB>`__


.. s6:: styles

   ul: {'fontSize': '50%'}


現在の継続を取り出す
====================

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


現在の継続を取り出す
====================

- 「現在の処理の直後の継続を取り出す」という関数

  - `call-with-current-continuation(call/cc) <http://community.schemewiki.org/?call-with-current-continuation>`__  (scheme)
  - `Kernel.#callcc <http://ruby-doc.org/core-2.2.0/Kernel.html#method-i-callcc>`__ (Ruby)

- `Stackless Python <http://www.stackless.com/>`__ なんてのもいたよね


.. s6:: styles

   ul: {'fontSize': '60%'}


使ってみる
==========

.. literalinclude:: none.scm
   :language: scheme


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%'}



goto してみる
=============

.. literalinclude:: goto.scm
   :language: scheme


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%'}


break してみる
==============

.. literalinclude:: break.scm
   :language: scheme


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%'}


他にも…
========

- try ~ catch ~ finally なんかも call/cc 使うと書ける
- 処理の流れをぶった切ってほげほげやるとかは大体できる


ちょっと戻って
==============

- call/cc を使うと先ほどの話が実現できる

  - 次に処理するべき呼び出し元の継続を渡す
  - リターンするときには継続を呼び出す

.. s6:: styles

   ul: {'fontSize': '60%'}


関数に渡す
==========

.. literalinclude:: callcc.scm
   :language: scheme


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%'}



ありがちな例(階乗計算)
======================

.. literalinclude:: factorial.scm
   :language: scheme


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


call/cc と継続渡しスタイル
==========================

- call/cc で作った継続を継続渡しスタイルの関数に呼ぶと、関数の最後の呼び出しで call/cc の直後に移動する
- 末尾呼び出しな継続渡しスタイルである場合、そのまま末尾再帰最適化みたいな感じになる(のか?)

.. s6:: styles

   ul: {'fontSize': '50%'}


Generator の話
==============

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


Generator って何?
=================

- Python とか JS にある機能
- ある関数の処理を中断して、呼び出し元に処理を戻す
- 中断したところから再開できる


.. s6:: styles

   ul: {'fontSize': '50%'}


Generator in Python
===================

.. literalinclude:: generator.py


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


Generator
=========

- Generator は call/cc を使うと表現できる

  - Generator は渡ってくる前の継続を受け取る
  - yield で Generator の処理の継続と共に継続に値を渡す
  - yield の返り値は渡した継続を呼び出すときに渡ってきた値


.. s6:: styles

   ul: {'fontSize': '50%'}


Generator in Scheme (定義)
==========================

.. literalinclude:: generator.scm
   :language: scheme

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


Generator in Scheme (使い方)
============================


.. literalinclude:: usegen.scm
   :language: scheme

.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


Generator
=========

- 多分マクロ使うといい場面
- Scheme力が足りない

.. s6:: styles

   ul: {'fontSize': '50%'}


限定継続
========

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


限定継続
========

- Scala にあるやつ

  - shift/reset

- "限定" とは継続の範囲を限定しているという意味
- 抜けたら reset の後に戻ってくる
- async/await も似たようなもん? (よくしらない)
- 古いけどここらへんで遊んでました

  - `Scala の限定継続を試してみる <http://d.hatena.ne.jp/shomah4a/20110113/1294934879>`__

- Generator みたいなのも書けます
  `Scala で Python の Generator みたいな何か(継続版) <http://d.hatena.ne.jp/shomah4a/20110114/1295012813>`__

.. s6:: styles

   ul: {'fontSize': '50%'}


限定継続の例
============


.. literalinclude:: continuation.scala
   :language: scala

.. s6:: styles

   div: {fontSize: '35%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}



参考文献
========

- `何でも継続 <http://practical-scheme.net/docs/cont-j.html>`__
- `12 継続渡し形式(CPS) - Javascriptプログラミング <http://www.h4.dion.ne.jp/~unkai/js/js12.html>`__
- `プログラミング Gauche <http://www.oreilly.co.jp/books/9784873113487/>`__
- `継続渡しスタイル Wikipedia <http://ja.wikipedia.org/wiki/%E7%B6%99%E7%B6%9A%E6%B8%A1%E3%81%97%E3%82%B9%E3%82%BF%E3%82%A4%E3%83%AB>`__

.. s6:: styles

   ul: {'fontSize': '50%'}



おしまい
========

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}
