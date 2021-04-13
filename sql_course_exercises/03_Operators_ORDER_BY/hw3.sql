/*1. Form a list of all employees with name David.*/
SELECT * FROM employees
WHERE first_name = 'David';

/*2. Form a list of all employees with job_id = FI_ACCOUNT.*/
SELECT * FROM employees
WHERE job_id='FI_ACCOUNT';

/*3. Form a query for all employees (first_name, last_name, salary, 
department_id) working in 50th department and having salary higher than 4000.*/
SELECT first_name, last_name, salary, department_id
FROM employees
WHERE department_id=50 AND salary > 4000;

/*4. Form a list of all employees working in 20th or 30th department.*/
SELECT * FROM employees
WHERE department_id IN (20, 30); 

/*5. Form a list of all employees with the last letter of 'a' in their name.*/
SELECT * FROM employees
WHERE first_name LIKE '_a%a';

/*6. Form a list of all employees working in 50th or 80th department and 
having bonus. Order the list by email column.*/
SELECT * FROM employees
WHERE department_id IN (50, 80) AND commission_pct IS NOT NULL
ORDER BY 4;

/*7. Form a list of all employees with at least 2 'n' letters in their name.*/
SELECT * FROM employees
WHERE first_name LIKE '%n%n%';

/*8. Form a list of all employees with length of name higher than 4. Sort the
list by department_id and put null values at the end of it.*/
SELECT * FROM employees 
WHERE LENGTH(first_name) > 4
ORDER BY department_id DESC NULLS LAST;

/*9. Form a list of all employees with salary between 3000 and 7000 (inclusive), 
no bonus and job_id PU_CLERK, ST_MAN or ST_CLERK.*/
SELECT * FROM employees
WHERE 
    salary BETWEEN 3000 AND 7000 
    AND commission_pct IS NULL AND 
    job_id IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

/*10. Form a list of all employees with a symbol '%' in their name.*/
SELECT * FROM employees
WHERE first_name LIKE '%/%%' ESCAPE '/';

/*11. Form a list of all employees (job_id, first_name, salary) 
with employee_id higher than 120 and job_id is not IT_PROG. Sort the list 
by job_id (ascending) and first_name (descending).*/
SELECT job_id, first_name, salary FROM employees
WHERE employee_id >= 120 AND job_id != 'IT_PROG'
ORDER BY job_id, first_name DESC;