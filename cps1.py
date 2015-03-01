def add_cps(x, y, cont):
    u'''
    3つ目の引数で継続を受け取る
    '''
    cont(x + y)


def output(v):
    print v

add_cps(10, 20, output)
