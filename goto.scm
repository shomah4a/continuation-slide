;; goto できる
(let
    ;; call/cc で生成された継続をそのまま返す
    ((cont (call/cc (lambda (c) (c c)))))
  (begin
    (print 10)
    ;; call/cc 呼び出し直後に移動
    (cont cont)
    ))
