"""
Алгоритм нахождения НОД делением
Большее число делим на меньшее.
Если делится без остатка, то меньшее число и есть НОД (следует выйти из цикла).
Если есть остаток, то большее число заменяем на остаток от деления.
Переходим к пункту 1.
"""

def gcd(a, b):
    assert a >= 0 and b >= 0
    if a == 0:
        return b
    if b == 0:
        return a
    while a != 0 and b != 0:
        if a > b:
            a = a % b
        elif a < b:
            b = b % a
        else:
            return a
    return a + b

print(gcd(-48, 18))


"""recursive ver"""

def euclid_GCD(a, b):
    assert a >= 0 and b >= 0
    if a == 0:
        return b
    if b == 0:
        return a
    if a > b:
        a = a % b
        return euclid_GCD(a, b)
    else:
        b = b % a
        return euclid_GCD(a, b)

print(euclid_GCD(-1, 66))