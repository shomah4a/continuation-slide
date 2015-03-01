#-*- coding:utf-8 -*-
def fib(n):
    u'''
    普通のフィボナッチ数計算
    '''

    if n <= 1:
        return 1

    return fib(n-1) + fib(n-2)


for i in range(10):
    print fib(i)
