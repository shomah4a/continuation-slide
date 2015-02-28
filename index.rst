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

  - 関数呼び出し

- 継続渡しスタイル

  - 末尾再帰最適化
  - JS における継続渡し

- 限定継続


.. s6:: styles

   ul: {'fontSize': '60%'}


継続とは
========

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


継続とは
========

- プログラム特定時点から処理を続けるために必要な情報を持っているもの

  - プログラムカウンタ
  - ローカル変数・クロージャなどの環境
  - 必要ならスタックも

- 今から続く未来をオブジェクト化したもの


.. s6:: styles

   ul: {'fontSize': '50%'}



何言ってるかよくわからない?
===========================

.. s6:: styles

   h2: {fontSize:'100%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}



多分普通です
============

.. s6:: styles

   h2: {fontSize:'100%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


関数呼び出し
============

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}



関数呼び出し
============

.. seqdiag::
   :width: 1200

   {
     FuncthionA -> FunctionB [label='Call Function B'];
     FuncthionA <-- FunctionB [label='return to Function A'];
   }


.. s6:: styles

   div: {height:'100%', width:'100%', fontSize:'15%'}


関数呼び出し
============

- FunctionA から FunctionB を呼び出す
- FunctionB に処理が移る
- FunctionB が終わったら FunctionA に戻る
- FunctionB を呼び出した後の処理を **継続** する


.. s6:: styles

   ul: {'fontSize': '50%'}


関数呼び出しと継続
==================

- FunctionA から FunctionB を呼び出す時に FunctionA の継続を渡す
- FunctionB に処理が移る
- FunctionB が終わったら FunctionA から渡ってきた **継続** を呼び出す

.. s6:: styles

   ul: {'fontSize': '50%'}



関数呼び出しと継続
==================

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}



継続による関数呼び出し
======================

.. code-block:: python

   def func_a():

       # 呼び出すと func_b の呼び出し直後に遷移する
       # continuation_object なるものがあるとする
       func_b('hoge', continuation_object)

       # continuation_object を呼ぶとここに遷移する
       # result は不思議な力で受け取れているとする
       print result


   def func_b(arg, continuation_object):

       # なんか処理

       # この呼び出しで func_a で呼び出された直後に遷移する
       continuation_object(result)


.. s6:: styles

   div: {fontSize: '50%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%'}



こんな感じ
==========

.. seqdiag::
   :width: 1200

   {
     FuncthionA -> FunctionB [label='Call Function B with continuation'];
     FunctionB -> FunctionA [label='call continuation of Function A'];
   }


.. s6:: styles

   div: {height:'100%', width:'100%', fontSize:'15%'}



例えば関数が3つ
===============


.. code-block:: python

   def func_a():

       func_b('hoge', continuation_object)
       fuga = piyo
       print 'hello'


   def func_b(arg, cont_a):

       # なんか処理

       # func_a から受け取った継続を伴って func_c を呼ぶ
       func_c(cont_a)
       continuation_object(result)

   def func_c(arg, continuation):

       # なんか処理

       # 返す
       continuation(result)


.. s6:: styles

   div: {fontSize: '40%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%'}



例えば関数が3つ
===============

.. seqdiag::
   :width: 1200

   {
     FuncthionA -> FunctionB [label='Call Function B with continuation'];
     FunctionB -> FunctionC [label='Call Function C with continuation'];
     FunctionC -> FunctionA [label='call continuation of Function A'];
   }


.. s6:: styles

   div: {height:'100%', width:'100%', fontSize:'15%'}


継続を渡す
==========

このように **継続** を関数に渡していく形式を
「継続渡しスタイル (Continuation Passing Style: CPS)」という


.. s6:: styles

   p: {fontSize: '50%'}


継続を取り出す
==============

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


継続を取り出す
==============

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


CPS 変換
========

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


続・継続渡しスタイル
====================

- 最後に継続を呼び出して、呼び出したら戻ってこない

  - スタックを捨てていいということ

- 再帰的な処理にも関わらずスタックを使わないように書ける

  - 状態の持ち回り + 呼び出し元継続の持ち回り
  - ほぼループ

- 再帰をループに自動的に変換できる

  - CPS 変換といわれる

- 末尾呼び出しを自動的に CPS 変換するのが末尾再帰最適化

  - だったはず
  - 実際はループに書き換えてたりするらしい

- 色々ぶっ飛ばし過ぎなので `12 継続渡し形式(CPS) - Javascriptプログラミング <http://www.h4.dion.ne.jp/~unkai/js/js12.html>`__ を見てください


.. s6:: styles

   ul: {'fontSize': '50%'}


継続と非同期処理
================

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


こんなの見たことはありませんか?
===============================

.. literalinclude:: get.js
   :language: javascript


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'},
   p: {fontSize: '50%'}



こんなの見たことはありませんか?
===============================

.. literalinclude:: file.js
   :language: javascript


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}



Node.js のコールバックスタイル
==============================

- 最後に渡すコールバックはそれぞれの関数の処理が終わったら呼び出される

  - 関数の後に処理するべき **継続** とみなせる

- コールバックスタイルは継続っぽい
- Promise も同様に継続っぽい感じで理解すると割とすんなりと理解できるはず


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


Generator in Python
===================

.. literalinclude:: generator.py


.. s6:: styles

   div: {fontSize: '45%', width: '90%', marginTop: '1em', marginLeft: '5%', marginRight: '5%', height: '100%'}


Generator
=========

- Generator は継続を使うと表現できる

  - Generator は渡って来る前の継続を受け取る
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


継続あれこれ
============

.. s6:: styles

   h2: {fontSize:'150%', textAlign:'center', margin:'30% auto', background: '#ffffff', color: '#000000'}


継続あれこれ
============

- `Kahua <http://www.kahua.org/>`__

  - 継続ベースの Web Application Framework
  - Web のフォームとの値のやりとりを継続使って手続き的に書けるらしい

    - よくしらない


.. s6:: styles

   ul: {'fontSize': '50%'}



夢広がりんぐwww
===============

- 継続を受け渡して処理をスレッドとかプロセスまたいで持ちまわるとか

  - 通常はローカルで処理するけど、数値計算だけGPU処理の専用ノードに任せるとか
  - その際の受け渡しは継続をネットワークで渡すだけみたいな

- 継続ベースで map/reduce みたいな処理できたら楽しいよねみたいな

  - 楽しいけど頭が沸騰しそうな感じ


.. s6:: styles

   ul: {'fontSize': '50%'}



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
