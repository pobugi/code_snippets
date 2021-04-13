tens = {
    9: 'ninety',
    8: 'eighty',
    7: 'seventy',
    6: 'sixty',
    5: 'fifty',
    4: 'fourty',
    3: 'thirty',
    2: 'twenty',
    19: 'nineteen',
    18: 'eighteen',
    17: 'seventeen',
    16: 'sixteen',
    15: 'fifteen',
    14: 'fourteen',
    13: 'thirteen',
    12: 'twelve',
    11: 'eleven',
    10: 'ten',
}

ones = {
    0: ' ',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
}

def spell_number(n):
    millions = n // 1000000
    rest = n % 1000000
    thousands = rest // 1000
    units = rest % 1000

    result = ''

    def spell_100_999(n):

        def spell_0_99(n):
            if n:
                if n >= 20:
                    desyatki = n // 10
                    edinicy = n % 10
                    if edinicy:
                        return tens[desyatki] + '-' + ones[edinicy]
                    return tens[desyatki] + ones[edinicy]
                elif 20 > n >= 10:
                    return tens[n]
                elif 10 > n > 0:
                    return ones[n]
            return ''

        res = ''
        if n:
            hundreds = n // 100
            decs = n % 100
            if hundreds:
                res += ones[hundreds] + ' hundred '
            if decs:
                res += appnd + spell_0_99(decs)
            return res
        return ''
    if n > 999999:
        appnd = ''
        result += spell_100_999(millions) + ' million '
    if n > 999:
        appnd = ''
        result += spell_100_999(thousands) + ' thousand '
    appnd = 'and ' if 100 < units < 1000 else ''
    result += spell_100_999(units)

    return result


for i in range(1, 10000):
    print(spell_number(i))







