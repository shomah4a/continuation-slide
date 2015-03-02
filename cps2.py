#-*- coding: utf-8 -*-
def fact_(n, result, cont):
    u'''
    結果を受け取って次に渡す
    '''
    if n <= 1:
        cont(result)
    else:
        fact_(n-1, n*result, cont)

def fact(n, cont):
    u'''
    継続渡しスタイルでの階乗計算
    '''
    fact_(n, 1, cont)


def p(x):
    print x

fact(5, p)
