from random import randint
import time

def quick_sort(lst):
    if len(lst) < 2:
        return lst
    mid = len(lst) // 2
    pivot = lst[mid]
    rest = lst[:mid] + lst[mid+1:]

    lower = [i for i in rest if i <= pivot]
    higher = [i for i in rest if i > pivot]

    return quick_sort(lower) + [pivot] + quick_sort(higher)

l = [randint(1, 100) for i in range(1000)]

start = time.time()
quick_sort(l)
end = time.time()

print('QUICK SORT EXECUTED IN {} SECONDS'.format(end-start))


