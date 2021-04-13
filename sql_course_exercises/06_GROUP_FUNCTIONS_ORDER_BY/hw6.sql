/*1. Query min and max salary, min and max hire date for all departments, sort by number of employees (descending).*/
SELECT department_id, 
        MIN(salary), 
        MAX(salary), 
        MIN(hire_date), 
        MAX(hire_date), 
        COUNT(employee_id) total
    FROM employees
GROUP BY department_id
ORDER BY total DESC;

/*2. Query the first letter of employee name and number of employees with the same first letter in their names. Print only 
those rows where number of employees more than 1. Sort by amount.*/
SELECT SUBSTR(first_name, 0, 1) first_letter, COUNT(SUBSTR(first_name, 0, 1)) qty /*or COUNT(*)*/
FROM employees
GROUP BY SUBSTR(first_name, 0, 1)
HAVING COUNT(SUBSTR(first_name, 0, 1)) > 1 /*or COUNT(*)*/
ORDER BY qty DESC;

/*3. Query department id, salary and number of employees working in the same dept and having equal salary.*/
SELECT department_id, 
        salary, 
        COUNT(*)
    FROM employees
GROUP BY department_id, salary;

/*4. Query weekday and number of employees hired in that day*/
SELECT TO_CHAR(hire_date, 'DAY') hire_weekday, 
        COUNT(*) qty
    FROM employees
GROUP BY TO_CHAR(hire_date, 'DAY')
ORDER BY qty DESC;

/*5. Query all department ids with more than 30 employees and cumulative salary of more than 300000.*/
SELECT department_id, 
        COUNT(employee_id) qty, 
        SUM(salary) total_salary 
    FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 30 AND SUM(salary) > 300000;

/*6. Query all region ids from countries table with cumulative length of country names more than 50.*/
SELECT region_id 
    FROM countries
GROUP BY region_id
HAVING SUM(LENGTH(country_name)) > 50;

/*7. Query job id and rounded average salary for each job id.*/
SELECT job_id, 
        ROUND(AVG(salary)) 
    FROM employees
GROUP BY job_id;

/*8. Query a list of department ids that include employees with more than 1 job_id.*/
SELECT department_id,   
        COUNT(DISTINCT(job_id))
    FROM employees
GROUP BY department_id
HAVING COUNT(DISTINCT(job_id)) > 1
ORDER BY department_id;

/*9. Query department id, job id, max and min salary for each combination of department_id-job_id with average salary > 10000.*/
SELECT department_id, 
        job_id, 
        MAX(salary), 
        MIN(salary)
    FROM employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 10000;

/*10. Query a list of managers whose employees don't have commission and have average salary lays between 6000 and 9000.*/
SELECT manager_id, 
        AVG(salary) 
    FROM employees
WHERE commission_pct IS NULL
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 6000 AND 9000;

/*11. Query max of average salaries (by department), rounded to the nearest thousand.*/
SELECT ROUND(MAX(AVG(salary)), -3) 
    FROM employees
GROUP BY department_id;


