/*1. Query all information about employees with the longest name.*/
SELECT * FROM employees
WHERE LENGTH(first_name) =
        (SELECT MAX(LENGTH(first_name)) FROM employees);

/*2. Query all information about employees with the salary higher than 
the average.*/
SELECT * FROM employees 
WHERE salary >
    (SELECT AVG(salary) FROM employees);

/*3. Query city/cities with the least total salary of employees.*/
SELECT city, sumsalary FROM
    (SELECT SUM(salary) sumsalary, city
        FROM employees
        INNER JOIN departments USING (department_id)
        INNER JOIN locations USING (location_id)
        GROUP BY city
        ORDER BY sumsalary) query_1
    WHERE ROWNUM = 1;
    
SELECT city, SUM(salary) FROM employees e 
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
GROUP BY city
HAVING SUM(salary) = 
        (SELECT MIN(SUM(salary)) 
            FROM employees e
                JOIN departments d ON (e.department_id = d.department_id)
                JOIN locations l ON (d.location_id = l.location_id)
            GROUP BY city);
       
/*4. Query all information about employees whose manager has salary 
higher than 15000.*/
SELECT * FROM employees
WHERE manager_id IN 
    (SELECT employee_id FROM employees WHERE salary > 15000);

/*5. Query all information about departments with no employees.*/
SELECT * FROM departments
WHERE department_id NOT IN
    (SELECT DISTINCT department_id 
    FROM employees 
    WHERE department_id IS NOT NULL);

/*6. Query all information about employees who are not managers.*/
SELECT * FROM employees
WHERE employee_id NOT IN
    (SELECT DISTINCT manager_id 
    FROM employees
    WHERE manager_id IS NOT NULL);

/*7. Query all information about managers who has more than 6 employees 
subordinated.*/
SELECT * FROM employees WHERE employee_id IN
    (SELECT manager_id FROM employees
    GROUP BY manager_id
    HAVING manager_id IS NOT NULL AND COUNT(*) > 6);

/*8. Query all information about employees working in departments with 'IT' in its names.*/
SELECT * FROM employees WHERE department_id IN
(SELECT department_id FROM departments WHERE department_name LIKE '%IT%');

/*9. Query all information about employees hired before 2005, 
and whose managers were hired in 2005.*/
SELECT * FROM employees
    WHERE manager_id IN
        (SELECT employee_id FROM employees
        WHERE employee_id IN
            (SELECT DISTINCT manager_id FROM employees
                WHERE manager_id IS NOT NULL)
            AND TO_CHAR(hire_date, 'YYYY') = 2005)
        AND TO_CHAR(hire_date, 'YYYY') < 2005;

SELECT * 
FROM employees
WHERE manager_id IN (SELECT employee_id 
                            FROM employees
                            WHERE TO_CHAR(hire_date, 'YYYY') = '2005')
        AND hire_date < TO_DATE('01012005', 'DDMMYYYY');

/*10. Query all information about employees with length of Job_title > 15 and
whose managers were hired in January (any year).*/
SELECT * FROM employees 
    INNER JOIN jobs USING(job_id)
        WHERE manager_id IN     
            (SELECT employee_id FROM employees WHERE TO_CHAR(hire_date, 'MM') = 01)
    AND LENGTH(job_title) > 15;
    
SELECT * FROM employees e
WHERE manager_id IN 
            (SELECT employee_id 
            FROM employees 
            WHERE TO_CHAR(hire_date, 'MM') = 01)
        AND (SELECT LENGTH(job_title) 
                FROM jobs 
                WHERE job_id = e.job_id) > 15;




