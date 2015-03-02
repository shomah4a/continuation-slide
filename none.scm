;; 何もしない例

(define result
  ; 引数として渡した手続きに現在の継続を渡して呼び出す手続き
  (call-with-current-continuation
   ; cont を呼び出すと call/cc の次に遷移する
   ; cont に渡した値は call/cc の返り値として使われる
   (lambda (cont)
     (cont 20))))

(print result) ; 20
