#-*- coding: utf-8 -*-
def fibonacci():
    u'''フィボナッチ数を生成するジェネレータ
    '''
    x, y = 1, 1
    yield x

    while True:
        yield y
        x, y = y, x+y


# 無限ループするよ!
for x in fibonacci():
    print x
