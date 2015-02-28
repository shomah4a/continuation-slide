;; generator っぽいもの
(define (generator cont)
  (define x (yield 10 cont))
  (define y (yield 20 cont))
  (+ x y)
  )

;; 引数一つ目に generator を
;; 二つ目に yield ごとに呼ぶ関数を渡す
;; yield の返り値は二つ目の関数の返り値
(print (run_generator
 generator
 (lambda (value)
   (print value)
   (* value 2))))
