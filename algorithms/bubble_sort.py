from random import randint
while True:
    n = int(input('Input the length of a list fo be sorted \n(input number < 0 will stop the program): '))
    if n < 0:
        print('Game Over!')
        break
    l = []

    for y in range(n):
        l.append(randint(-100, 100))

    print('Unsorted list of random numbers:\t', l)

    for j in range(n - 1): 
        for i in range(n - j - 1):
            if l[i] > l[i + 1]:
                l[i], l[i + 1] = l[i + 1], l[i]

    print('The list after the bubble sorting:\t', l)
