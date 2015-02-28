;; 普通の関数
(define (add x y)
  (+ x y))

(print (add 10 20)) ;; 30 と出力される

;; 継続渡し関数
(define (add-cont x y cont)
  ;; 受け取った継続に計算結果を渡して呼び出す
  ;; 渡した値は call/cc の結果になる
  (cont (+ x y)))

(define result
  ;; 受け取った関数に現在の継続を渡して呼び出す
  (call-with-current-continuation
   (lambda (cont)
     ;; 継続を渡して呼び出す
     (add-cont 10 20 cont))))

(print result) ;; 30 と出力される
