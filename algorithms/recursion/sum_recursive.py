def sum_list(lst):
    if not lst:
        return 0
    if len(lst) == 1:
        return lst[0]
    return lst[0] + sum_list(lst[1:])

print(sum_list([1,2,3,4,5]))


def len_list(lst):
    res = 0
    if len(lst) == 1:
        return 1

    return len_list(lst[:1]) + len_list(lst[1:])

print(len_list([1,2,3]))