/*1. Query all about regions and amount of employees working in every region.*/

SELECT region_name, emps_per_region FROM
    (SELECT region_id, SUM(emps_per_country) emps_per_region FROM
        (SELECT country_id, SUM(emps_per_location) emps_per_country FROM
            ((SELECT location_id, SUM(emps_per_department) emps_per_location FROM
                (SELECT department_id, emps_per_department, department_name, location_id FROM departments d
                INNER JOIN
                    (SELECT department_id, COUNT(employee_id) emps_per_department FROM employees GROUP BY department_id) emps_deps
                    USING(department_id))
                GROUP BY location_id)) q1
                INNER JOIN locations USING(location_id)
                GROUP BY country_id)
        INNER JOIN countries USING(country_id)
        GROUP BY region_id)
    INNER JOIN regions USING (region_id);
    
SELECT  region_name, 
        COUNT(*) 
    FROM employees
        INNER JOIN departments USING (department_id)
        INNER JOIN locations USING (location_id)
        INNER JOIN countries USING (country_id)
        INNER JOIN regions USING (region_id)
    GROUP BY region_name;
    

/*2. Query detailed information about all employees: name, surname, department name, job id, address, country, region.*/
SELECT  first_name, 
        last_name, 
        department_name, 
        job_title, 
        country_name, 
        region_name, 
        city, 
        street_address 
    FROM employees
        INNER JOIN departments USING (department_id)
        INNER JOIN jobs USING (job_id)
        INNER JOIN locations USING (location_id)
        INNER JOIN countries USING (country_id)
        INNER JOIN regions USING (region_id);

/*3. Form a list of managers that have >6 employees and total amount of employees (per manager).*/

SELECT  COUNT(*), 
        man.first_name 
    FROM employees emp
        JOIN employees man ON (emp.manager_id = man.employee_id)
        GROUP BY man.first_name
        HAVING COUNT(*) > 6;

/*4. Form a list of departments that have >30 employees and total amount of employees (per department).*/

SELECT  department_name, 
        COUNT(*) 
    FROM employees
        INNER JOIN departments d USING(department_id)
            GROUP BY department_name
                HAVING COUNT(*) > 30;

/*5. Query all department names which don't include any employees.*/
SELECT DISTINCT department_id, 
                department_name 
        FROM employees 
            RIGHT JOIN departments USING (department_id)
    WHERE employee_id IS NULL;
        
/*6. Query all information about employees hired before 2005, 
whose managers were hired in 2005.*/
SELECT * FROM employees e
JOIN
    (SELECT employee_id FROM employees
    WHERE employee_id IN 
        (SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL)
        AND TO_CHAR(hire_date, 'YYYY') = 2005) managers_2005
ON e.manager_id = managers_2005.employee_id
WHERE e.hire_date < TO_DATE('01-01-2005', 'DD-MM-YYYY');
  
/*7. Query country name + region name.*/
SELECT country_name, region_name 
    FROM countries
    NATURAL JOIN regions;

/*8. Query name, surname of employees that have salary lower than the minimal salary by their speciality + 1000.*/
SELECT  first_name, 
        last_name,
        job_id,
        salary, 
        target_salary
    FROM employees INNER JOIN 
                    (SELECT job_id, min_salary + 1000 target_salary 
                        FROM jobs) USING (job_id)
    WHERE salary < target_salary
    ORDER BY job_id;
    
SELECT first_name, last_name, salary 
    FROM employees e JOIN jobs j
        ON e.job_id = j.job_id AND e.salary < j.min_salary + 1000;

/*9. Query unique name, surname of employees, country names, where they work. 
Include countries with no information about employees and employees with no information about countries.*/
SELECT DISTINCT first_name, last_name, country_name
    FROM employees e
        FULL OUTER JOIN departments d ON (e.department_id = d.department_id)
        FULL OUTER JOIN locations l ON (d.location_id = l.location_id)
        FULL OUTER JOIN countries c ON (c.country_id = l.country_id);
    
/*10. Query name, surname of employees, country names. Join employees and countries tables using no logic.*/
SELECT  first_name,
        last_name,
        country_name
    FROM employees CROSS JOIN countries
        ORDER BY country_name, first_name, last_name;
























