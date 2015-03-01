#-*- coding: utf-8 -*-
def fact_cont(n, cont):
    u'''
    継続渡しスタイルでの階乗計算
    '''

    def n1_cont(m):

        cont(n*m)

    if n == 0:
        cont(1)
    else:
        fact_cont(n-1, n1_cont)


def p(x):
    print x

fact_cont(5, p)
