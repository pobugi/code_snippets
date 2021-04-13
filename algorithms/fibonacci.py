"""Slow recursive solution"""

def fib1(n):
    assert n >= 0
    if n == 0:
        return 0
    elif n == 1:
        return 1
    return fib1(n - 1) + fib1(n - 2)

# print(fib1(10))


"""More fast solution using an array"""

def fib2(n):
    assert n >= 0
    arr = [0, 1]
    for i in range(2, n + 1):
        arr.append(arr[i - 1] + arr[i - 2])
    return arr[n]

# print(fib2(10))

"""вывод k+1 последних цифр числа Фибоначчи"""
def fib_digit(n, ord):
    assert n >= 0
    l = [0 , 1]
    k = 10 ** (ord + 1)
    for i in range(1, n):
        next = l[i] % k + l[i-1] % k
        l.append(next)
    return l[-1] % k

# print(fib_digit(200, 10))

"""recursive + cache"""
cache = {}
def fib3(n):
    assert n >= 0, 'n must be >= 0!'
    if n not in cache:
        cache[n] = n if n <= 1 else fib3(n - 2) + fib3(n - 1)
    return cache[n]    

# print(fib3(3))
# print(cache)

"""recursive + decorator lru_cache"""




"""iteration"""

def fib4(n):
    assert n >= 0
    f0, f1 = 0, 1
    for i in range(n - 1):
        f0, f1 = f1, f1 + f0
    return f1

print(fib4(10))
