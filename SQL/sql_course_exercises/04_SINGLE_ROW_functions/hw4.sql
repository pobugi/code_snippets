/*1. Form a list of all employees with the length of first name higher than 
10 letters.*/
SELECT * FROM employees
WHERE LENGTH(first_name) > 10;

/*2. Form a list of all employees having salary multiple of 1000.*/
SELECT * FROM employees
WHERE MOD(salary, 1000) = 0;

/*3. Form a list of phone numbers and first 3 digits of phone number of all
employees whose phone number is represented in the format XXX.XXX.XXXX.*/
SELECT phone_number, SUBSTR(phone_number, 0, 3) 
FROM employees
WHERE phone_number LIKE '___.___.____';

/*4. Form a list of all employees whose name length is more than 5 and the
last letter of the name is 'm'.*/
SELECT * FROM employees
WHERE first_name LIKE '%m' AND LENGTH(first_name) > 5;

SELECT * FROM employees
WHERE SUBSTR(first_name, -1) = 'm' AND LENGTH(first_name) > 5;

/*5. Print the date of the next Friday.*/
SELECT NEXT_DAY(SYSDATE, 05) FROM dual;

/*6. Form a list of all employees who has been working in the company more than
12.5 years (150 months).*/
SELECT *
FROM employees
WHERE MONTHS_BETWEEN(sysdate, hire_date) > 150;

/*7. Form a list of all phone numbers with '.' replaced by '-'.*/
SELECT REPLACE(phone_number, '.', '-') phone FROM employees;

/*8. Query first_name, email, job_id of all employees in the following format:
STEVEN sking Ad_pres.*/
SELECT UPPER(first_name), LOWER(email), INITCAP(job_id) FROM employees;

/*9. Query first_name, salary of all employees in the following format:
Steven24000.*/
SELECT first_name || salary FROM employees;
SELECT CONCAT(first_name, salary) FROM employees;

/*10. Form a list of hire dates, hire dates rounded  up to 1st day of month,
date of the 1st day of year for all employees.*/
SELECT hire_date, ROUND(hire_date, 'MONTH'), TRUNC(hire_date, 'YEAR') FROM employees;

/*11. Print first name (10 symbols, fill the rest from the right with '$'), 
last name (15 symbols, fill the rest from the left with '$') for all employees.*/
SELECT RPAD(first_name, 10, '$'), LPAD(last_name, 15, '$') FROM employees;

/*12. Print first name and the position of the second appearance of the 
letter 'a' in first name for all employees.*/
SELECT first_name, INSTR(first_name, 'a', 1, 2) FROM employees;

/*13. Print '!!!HELLO!! MY FRIEND!!!!!!!!' and the same text with no 
exclamation marks at the beginning ant the end of the string.*/
SELECT '!!!HELLO!! MY FRIEND!!!!!!!!', TRIM('!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!') FROM dual;

/*14. Query the following for all employees:
                1. salary;
                2. salary multiplicated by 3.1415 (new salary);
                3. new salary rounded to the nearest integer;
                4. an integer amount of thousands of the new salary.*/
SELECT salary, salary * 3.1415 new_salary, ROUND(salary * 3.1415), TRUNC(ROUND(salary * 3.1415) / 1000)  FROM employees;

/*15. Query the following for all employees:
                1. hire date;
                2. date after 6 months after hire date;
                3. last day of month of hire date.*/
SELECT hire_date, ADD_MONTHS(hire_date, 6), LAST_DAY(hire_date)  FROM employees;
