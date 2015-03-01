def fact(x):
    u'''
    再帰関数による階乗計算
    '''

    if not x:
        return 1

    return x * fact(x-1)


print fact(5)
