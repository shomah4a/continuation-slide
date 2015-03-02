#-*- coding:utf-8 -*-
def fact_(m, result):
    u'''
    途中経過を関数の引数として持っておく
    '''
    if m <= 1:
        return result
    else:
        return fact_(m-1, result*m)


def fact(n):

    return fact_(n, 1)


print fact(5)
