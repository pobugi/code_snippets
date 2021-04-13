/*1. Create table emp1000 using subquery so that it would contain the following data from employees table:
first name, last name, salary, department id.*/
CREATE TABLE emp1000
AS 
    (SELECT     first_name, 
                last_name, 
                salary, 
                department_id 
        FROM employees);

/*2. Create a view v1000 based upon select  that joins emp1000 and departments tables using department id column.
It should contain first name, last name, salary, department name, city.*/
CREATE FORCE VIEW v1000 AS
    SELECT first_name, last_name, salary, department_name, e.city 
        FROM emp1000 e  JOIN departments d ON (e.department_id = d.department_id);

/*3. Add city column to the emp1000 table*/
ALTER TABLE emp1000
ADD(city VARCHAR2(30));

/*4. Compile view v1000*/
ALTER VIEW v1000 COMPILE;

/*5. Create a synonym syn100 of v1000*/
CREATE SYNONYM syn1000 FOR v1000;

/*6. Delete view v1000*/
SELECT * FROM syn1000;
DROP VIEW v1000;

/*7. Delete synonym s1000*/
DROP SYNONYM syn1000;

/*8. Delete table emp1000*/
DROP table emp1000;

/*9. Create a sequence seq1000 starting from 10, incrementing by 5, has max value 100 and a cycle*/
CREATE SEQUENCE seq1000
INCREMENT BY 5
START WITH 10
MAXVALUE 100
CYCLE;
DROP SEQUENCE seq1000;

SELECT seq1000.NEXTVAL FROM dual;

/*10. Update sequence - remove cycle and max value*/
ALTER SEQUENCE seq1000
NOMAXVALUE
NOCYCLE;
SELECT seq1000.NEXTVAL FROM dual;

/*11. Add 2 rows into locations2 table using seq1000*/
INSERT INTO locations2 (location_id, city, country_id)
    VALUES  (seq1000.NEXTVAL, 'Samara', 'RU'); 
INSERT INTO locations2 (location_id, city, country_id)
    VALUES  (seq1000.NEXTVAL, 'Saratov', 'RU');     
    
    
SELECT * FROM locations2;

/*Commit*/
COMMIT;
