#-*- coding:utf-8 -*-
def fib_cont(n, cont):
    u'''
    継続渡しスタイルのフィボナッチ数計算
    '''
    def f1_cont(n1):
        # fib(n-1) の計算結果の継続

        def f2_cont(n2):
            # fib(n-2) の計算結果の継続
            cont(n1+n2)

        fib_cont(n-2, f2_cont)

    if n <= 1:
        cont(1)
    else:
        fib_cont(n-1, f1_cont)

def p(v):
    print v

for i in range(10):
    fib_cont(i, p)
