(define values
  (list 1 2 3 4 5 10 20 5))

;; 10 以上の値が来たら処理をやめる
;; それまでは値を出力
(call/cc
 (lambda (c)
   (for-each
    (lambda (v)
      (if (< v 10)
          (print v)
          ;; 継続を呼び出して for-each を抜ける
          ;; break みたいなこと
          (c)))
    values)))
