from random import randint

def binary_search(l: list, n: int, start: int, stop: int) -> int:
    '''
    :param l: list of items (must be sorted in ascending order)
    :param n: number to search in list
    :param start: start index
    :param end: end index
    :return: index of n in list
    '''
    if start > stop:
        return False
    else:
        mid = (start + stop) // 2
        if n == l[mid]:
            return mid
        if n < l[mid]:
            return binary_search(l, n, start, mid - 1)
        else:
            return binary_search(l, n, mid + 1, stop)
    return '{} is not in the list'.format(n)


l = [3,5,7,9,12,13,14,15,16,18,160,250]
n = 14
start = 0
stop = len(l)
print(binary_search(l, n, start, stop))
