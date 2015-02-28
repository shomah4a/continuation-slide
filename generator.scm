;; yield は generator の中の継続と値を渡ってきた関数に渡す
(define (yield value c)
  (call/cc
   (lambda (cc)
     (c value cc)
     )))

;; generator を実行する関数
;; gen は generator
;; callback は generator の yield ごとにその値と共に呼び出す関数
(define (run_generator gen callback)
  ;; 最後に戻ってくるところ
  (call/cc
   (lambda (outcont)
     ;; yield するたびに呼ばれるやつ
     (define (continue value c)
       (c (callback value)))
     (outcont (gen continue)))))
