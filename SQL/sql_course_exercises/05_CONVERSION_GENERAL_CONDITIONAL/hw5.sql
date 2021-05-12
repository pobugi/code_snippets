/*1. Query all the columns in employees table with 'b' in first_name (case insensitive). Use functions.*/
SELECT first_name FROM employees 
WHERE first_name LIKE '%b%' OR first_name LIKE '%B%';

SELECT * FROM employees
WHERE INSTR(LOWER(first_name), 'b') > 0;

/*2. Query all the columns in employees table with at least 2 letters 'a' in first_name (case insensitive). Use functions.*/
SELECT * FROM employees
WHERE INSTR(LOWER(first_name), 'a', 1, 2) > 0;

SELECT * FROM employees
WHERE LOWER(first_name) LIKE '%a%a%';

/*3. Query first word of department name where department name consists of more than 1 word.*/
SELECT department_name, SUBSTR(department_name, 1, INSTR(department_name, ' ') - 1) FROM departments
WHERE INSTR(department_name, ' ') > 0;

/*4. Query first name of employees excluding the first and the last letters.*/
SELECT first_name, 
        SUBSTR(first_name, 2, LENGTH(first_name) - 2) 
    FROM employees;

/*5. Query a list of all employees who has at least 3 symbols after '_' in job_id. The expression after '_' must not be 'CLERK'*/
SELECT job_id, SUBSTR(job_id, INSTR(job_id, '_')+1) FROM employees
WHERE 
    LENGTH(SUBSTR(job_id, INSTR(job_id, '_')+1)) >=3 AND
    SUBSTR(job_id, INSTR(job_id, '_')+1) != 'CLERK';

/*6. Query list of all employees hired at the first day of month.*/
SELECT first_name, last_name, hire_date,   
        ADD_MONTHS(LAST_DAY(hire_date) + 1, -1) first_day 
FROM employees
WHERE hire_date = ADD_MONTHS(LAST_DAY(hire_date) + 1, -1);

SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'DD') = 1;

/*7. Query list of all employees hired in 2008.*/
SELECT * FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2008';

/*8. Print tomorrow date in the format: 'Tomorrow is second day of January'.*/
SELECT TO_CHAR(SYSDATE, 'fm"Tomorrow is "Ddspth" day of "Month') tomorrow FROM dual;

/*9. Query first name and hire date in the format '21st of June, 2007' for all employees.*/
SELECT hire_date FROM employees
WHERE SUBSTR(TO_CHAR(hire_date, 'DD'), LENGTH(TO_CHAR(hire_date, 'DD')), 1) = 7; /*select 2nd digit of the day of hire date*/

SELECT first_name, hire_date,
    TO_CHAR(hire_date, 'fmddth" day of "Month", "YYYY') hired
FROM employees;

/*10. Query list of employees with 20% increased salary (format - '$28,800.00')*/
SELECT first_name, 
        TO_CHAR(salary, '$999,999.00') salary, 
        TO_CHAR(salary * 1.2, '$999,999.00') new_salary 
    FROM employees;

/*11. Print current date, separately add 1 second, 1 minute, 1 hour, 1 day, 1 month, 1 year to it.*/
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS DD-Mon-YYYY') now,
        TO_CHAR(SYSDATE + 1 / 24 / 60 / 60, 'HH:MI:SS DD-Mon-YYYY') plus_second,
        TO_CHAR(SYSDATE + 1 / 24 / 60, 'HH:MI:SS  DD-Mon-YYYY') plus_minute,
        TO_CHAR(SYSDATE + 1 / 24, 'HH:MI:SS DD-Mon-YYYY') plus_hour,
        TO_CHAR(SYSDATE + 1, 'HH:MI:SS DD-Mon-YYYY') plus_day,
        TO_CHAR(ADD_MONTHS(SYSDATE, 1), 'HH:MI:SS DD-Mon-YYYY') plus_month,
        TO_CHAR(ADD_MONTHS(SYSDATE, 12), 'HH:MI:SS DD-Mon-YYYY') plus_year
    FROM dual;

/*12. Query first name, salary, salary + "$12,345.55" for all employees.*/
SELECT first_name, 
        salary, 
        salary + TO_NUMBER('$12,345.55', '$999,999.00') new_salary
    FROM employees;
    
/*13. Query first name, hire date and number of months between hire date and "SEP, 18:45:00 18 2009"*/
SELECT first_name, hire_date, MONTHS_BETWEEN(TO_DATE('SEP, 18:45:00 18 2009', 'MON, HH24:MI:SS DD YYYY'), hire_date) months_btwn FROM employees;

/*14. Query first name, salary, full salary (salary + commission_pct) using "$24,000.00" format for all employees.*/
SELECT first_name, 
        salary, 
        commission_pct,
        NVL2(commission_pct, TO_CHAR(salary + salary*commission_pct, '$999,999.00'), TO_CHAR(salary, '$999,999.00'))
            salary_plus_pct
    FROM employees;
    
/*15. Query first name, last name, "different length", if lengths of first and last names is not the same, else "same length". Do not use conditional functions.*/
SELECT first_name, 
        last_name, 
        NVL2(NULLIF(LENGTH(first_name), LENGTH(last_name)), 'diff. len', 'same len') 
            len_comparison
    FROM employees;


/*16. Query first name, commission pct, info - whether he has commission (yes/no) for all employees.*/
SELECT first_name, 
        commission_pct, 
        NVL2(commission_pct, 'Yes', 'No') 
    FROM employees;

    
/*17. SELECT first name and: commission_pct if present, else manager_id, if present, else salary.*/    
SELECT first_name, 
    COALESCE(commission_pct, manager_id, salary)
FROM employees;

/*18. Query first name, salary, salary level (<5000: 'LOW', between 5000 and 10000: 'MID', >=10000: 'HI' for all employees.)*/
SELECT first_name, 
        last_name, 
        salary, 
        CASE 
            WHEN salary < 5000 THEN 'LOW'
            WHEN salary >= 5000 AND salary < 10000 THEN 'MID'
            WHEN salary >= 10000 THEN 'HI'
            ELSE 'N/A'
        END
            salary_level
    FROM employees;
    
/*19. Query country name, region id, region name (1-Europe, 2-America, 3-Asia, 4-Africa) using DECODE function.*/
SELECT country_name, 
        region_id,
        DECODE(region_id, 1, 'Europe',
                        2, 'America',
                        3, 'Asia',
                        4, 'Africa') region_name
    FROM countries;

/*20. Solve #19 problem using CASE function.*/
SELECT country_name, 
        region_id,
        CASE
            WHEN region_id = 1 THEN 'Europe'
            WHEN region_id = 2 THEN 'America'
            WHEN region_id = 3 THEN 'Asia'
            WHEN region_id = 4 THEN 'Africa'
        END 
            region_name
FROM countries;
    
/*21. Query first name, salary, conditions level    (salary<10000, no commission_pct: 'BAD', 
                                                    salary between 10000 and 15000 or has commission_pct: 'NORMAL', 
                                                    >=15000: 'GOOD' for all employees.)*/
SELECT first_name,
        salary,
        CASE
            WHEN salary < 10000 AND commission_pct IS NULL THEN 'BAD'
            WHEN salary BETWEEN 10000 AND 15000 
                                    OR commission_pct IS NOT NULL THEN 'NORMAL'
            WHEN salary >= 15000 THEN 'GOOD'                        
        END
            conditions
    FROM employees;
            
            
            

