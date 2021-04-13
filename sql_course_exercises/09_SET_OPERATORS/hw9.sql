/*1. Print out in one report:
information about sums of salaries of groups of manager_id, job_id, department_id.
The report must have 4 columns: manager_id, job_id, department_id, sum salary.*/
SELECT manager_id, TO_NUMBER(null) department_id, TO_CHAR(null) job_id, SUM(salary) FROM employees GROUP BY manager_id
UNION
SELECT TO_NUMBER(null) manager_id, department_id, TO_CHAR(null) job_id, SUM(salary) FROM employees GROUP BY department_id
UNION
SELECT TO_NUMBER(null) manager_id, TO_NUMBER(null) department_id, job_id, SUM(salary) FROM employees GROUP BY job_id;

/*2. Select department ids where manager #100 is working and #145, 201 are not working.*/

SELECT department_id 
    FROM employees
        WHERE manager_id = 100
MINUS

SELECT department_id 
    FROM employees
        WHERE manager_id IN (145, 201);

/*3. Select unique firstname, lastname, salary of employees that have 'a' as the 2nd letter of the firstname and who have 's' in the lastname.
Sort the list by descending salary. Use SET operators.*/
SELECT first_name, last_name, salary 
    FROM employees 
        WHERE LOWER(first_name) LIKE '_a%'
    
INTERSECT

SELECT first_name, last_name, salary 
    FROM employees 
        WHERE LOWER(last_name) LIKE '%s%'
ORDER BY salary DESC;

/*4. Select location id, postal code, city for locations in Italy or Germany and for those which postal code include '9' digit.*/
SELECT location_id, postal_code, city 
    FROM locations
        WHERE country_id IN ('IT', 'DE')
        
UNION ALL         
        
SELECT location_id, postal_code, city 
    FROM locations
        WHERE INSTR(TO_CHAR(postal_code), '9') > 0;
        
/*5. Select all unique data for those countries which names have more than 8 letters. And for those which are not located in Europe.
The columns must be named: id, coutry, region. Sort the list by country names (descending).*/
SELECT country_id, country_name, region_id 
    FROM countries 
        WHERE LENGTH(country_name) > 8
UNION
SELECT country_id, country_name, region_id 
    FROM countries 
        WHERE region_id NOT IN 
            (SELECT region_id FROM regions WHERE region_name = 'Europe')
ORDER BY country_name DESC;
