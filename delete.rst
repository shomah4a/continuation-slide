継続渡しスタイルへの変換
========================

- 関数の引数に継続を受け取る
- 計算結果は引数として積んでいく
- 結果に辿り着いたら継続を呼び出す



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


関数呼び出しにおける継続
========================

- FunctionB から FunctionA に処理を戻す際に必要な **継続** とは

  - リターンアドレス
  - スタックに積まれた変数群

- これらの情報があれば FunctionB を呼び出した時の FunctionA の実行状態が復元できる

  - これが関数呼び出しとリターンにおける継続


.. s6:: styles

   ul: {'fontSize': '50%'}


関数呼び出しと継続
==================

- FunctionA から FunctionB を呼び出す時に FunctionA の継続を渡す
- FunctionB に処理が移る
- FunctionB の最後で FunctionA から渡ってきた **継続** を呼び出す

.. s6:: styles

   ul: {'fontSize': '50%'}


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
