/*1. Query all information about regions.*/
SELECT *
FROM regions;
/*2. Query for all employees: name, department_id, salary.*/
SELECT first_name,
        department_id,
        salary,
        last_name
FROM employees;
/*3. Query for all employees: id, email, date of 1 week before hire date.*/
SELECT employee_id,
        email,
        hire_date -7 "One week before hire date"
FROM employees;
/*4. Form a query in the following format: Donald(SH_Clerk) for all employees.*/
SELECT first_name || '(' || job_id || ')' our_employees
FROM employees;
/*5. Form a query for unique names of employees.*/
SELECT DISTINCT first_name
FROM employees;
/*6. Form a query from table jobs with the following information:
 1. job_title
 2. "min = 20080, max = 40000" where 20080 - min.salary, 
 40000 - max.salary
 3. largest salary
 4. new_salary which is calculated by formula: max_salary * 2 - 2000.*/
SELECT job_title,
        'min = ' || min_salary || ', max = ' || max_salary info,
        max_salary max,
        max_salary * 2 - 2000 new_salary
FROM jobs;
/*7. Print "Peter's dog is very clever".*/
SELECT 'Peter''s dog is very clever'
FROM dual;
/*8. Print "Peter's dog is very clever" using another method.*/
SELECT q '<Peter' s dog is very clever > ' FROM dual;

/*9. Print the amount of seconds in one century 
(assuming that 1 year = 365.25 days).*/
SELECT 100 * 365.25 * 24 * 60 seconds_per_century FROM dual;