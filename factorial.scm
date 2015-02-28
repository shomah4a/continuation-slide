;; 再帰で階乗を計算する
(define (factorial x)
  (if (<= x 1)
      1
      (* x (factorial (- x 1)))))

(print (factorial 5))

;; 継続渡し形式での階乗計算
(define (_fact x result cont)
    (if (<= x 1)
        ;; 計算結果を渡ってきた継続(= factorial-cont の呼び出し元)に渡して呼び出す
        (cont result)
        (_fact (- x 1)
               (* result x)
               cont)))

(define (factorial-cont x cont)
  (_fact x 1 cont))

(print
 (call/cc ; call-with-current-continuation の短縮名
  (lambda (cont)
    (factorial-cont 5 cont))))
