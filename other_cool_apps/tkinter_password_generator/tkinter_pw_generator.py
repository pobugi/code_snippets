"""
An extremely simple password generator using GUI Tkinter
"""


import tkinter as tk
from tkinter import ttk
from string import digits, ascii_letters, punctuation
from random import choice

root = tk.Tk()
root.geometry('400x120+750+350')
root.title('Simple password generator')
root.resizable(False, False)


password_length = tk.StringVar()
password_value = tk.StringVar()

alpha_check = tk.IntVar()
digits_check = tk.IntVar()
special_check = tk.IntVar()
length = tk.IntVar()
# alpha.set(0)

def generate_password(*args):

    try:
        length_ = length.get()
        alpha_ = alpha_check.get()
        digits_ = digits_check.get()
        special_ = special_check.get()


        possible_characters = ''
        if alpha_:
            possible_characters += ascii_letters
        if digits_:
            possible_characters += digits
        if special_:
            possible_characters += punctuation

        res = ''
        if not possible_characters:
            possible_characters = ascii_letters + digits + punctuation
        if not length_:
            length_ = 8
        for i in range(length_):
            res += choice(possible_characters)

        password_value.set(res)
    except:

        password_value.set('The length must be an integer!')



main_frame = ttk.Frame(root, padding=(20, 10))
main_frame.grid()


password_length_label = ttk.Label(main_frame, text='Password length:')
submit = ttk.Entry(main_frame, width=10, textvariable=length)

password_label = ttk.Label(main_frame, text='Your password:')
password_display_label = ttk.Label(main_frame, textvariable=password_value)



generate_button = ttk.Button(main_frame, text='Generate', command=generate_password)

check_alpha = ttk.Checkbutton(main_frame, text='Letters:', variable=alpha_check, onvalue=1, offvalue=0)
check_digits = ttk.Checkbutton(main_frame, text='Digits:', variable=digits_check, onvalue=1, offvalue=0)
check_special = ttk.Checkbutton(main_frame, text='Special Symbols:', variable=special_check, onvalue=1, offvalue=0)

password_length_label.grid(row=0, column=0, sticky='W', padx=5, pady=5)
submit.grid(row=0, column=1, sticky='WE', padx=5, pady=5)
submit.focus()


password_label.grid(row=1, column=0, sticky='W', padx=5, pady=5)
password_display_label.grid(row=1, column=1, sticky='WE', padx=5, pady=5)
generate_button.grid(row=2, column=0, columnspan=2, padx=5, pady=5)

check_alpha.grid(row=0, column=2, sticky='WE')
check_digits.grid(row=1, column=2, sticky='WE')
check_special.grid(row=2, column=2, sticky='WE')

root.mainloop()