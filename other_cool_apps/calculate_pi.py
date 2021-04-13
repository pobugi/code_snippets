"""
Estimate PI using random functions that returns a number from 0 to 1
"""

from random import random


def estimate_pi(iters):

    circ = 0
    square = 0

    for i in range(iters):
        x, y = (random(), random())

        r = (x ** 2 + y ** 2) ** 0.5

        if r <= 1:
            circ += 1
        

    pi = 4 * circ / iters

    return 'PI = {}'.format(pi)

# print(estimate_pi(10000))     # 3.1556
# print(estimate_pi(100000))    # 3.13252
# print(estimate_pi(1000000))   # 3.141964
# print(estimate_pi(1000000))   # 3.141708
# print(estimate_pi(10000000))  # 3.141346
# print(estimate_pi(100000000))   # 3.14140408
