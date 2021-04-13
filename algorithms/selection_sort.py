from random import randint


def find_max_index(lst):
    """Finds index of the biggest element in a list"""
    max_index = 0
    for i in range(1, len(lst)):
        if lst[i] > lst[max_index]:
            max_index = i
    return max_index    


def find_min_index(lst):
    """Finds index of the smallest element in a list"""
    min_index = 0
    for i in range(1, len(lst)):
        if lst[i] < lst[min_index]:
            min_index = i
    return min_index


def selection_sort_desc(lst):
    """Sorts an unsorted list in descending order"""
    print('List to be processed:')
    print('\t', lst)
    sorted = []

    for i in range(len(lst)):
        max_index = find_max_index(lst)
        sorted.append(lst.pop(max_index))
    return print('Sorted list in descending order:\n\t', sorted)


def selection_sort_asc(lst):
    """Sorts an unsorted list in descending order"""
    print('List to be processed:')
    print('\t', lst)
    sorted = []

    for i in range(len(lst)):
        min_index = find_min_index(lst)
        sorted.append(lst.pop(min_index))
    return print('Sorted list in ascending order:\n\t', sorted)

l1 = []
l2 = []

for i in range(10):
    l1.append(randint(-10, 10))
    l2.append(randint(-10, 10))

selection_sort_asc(l1)
selection_sort_desc(l2)
