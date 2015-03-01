#-*- coding:utf-8 -*-
def fact_cont(n, cont):
    u'''
    継続渡しスタイルの階乗計算
    '''

    def fact_(m, result):

        if m == 1:
            cont(result)
        else:
            fact_(m-1, result*m)

    fact_(n, 1)


def p(x):
    print x

fact_cont(5, p)
