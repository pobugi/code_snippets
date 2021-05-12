/*1. Create table friends using subquery so that it would include:
employee id, firstname, lastname of employees that have commission.
The columns must be named id, name, surname*/
CREATE TABLE friends AS
SELECT employee_id id, first_name name, last_name surname FROM employees
    WHERE commission_pct IS NOT NULL;
    
/*2. Add new column 'email' into table 'friends'.*/
SELECT * FROM friends;
ALTER TABLE friends
    ADD email VARCHAR2(50);
    
/*3. Update 'email' column, make it have default value 'no email'*/
UPDATE friends
    SET email = 'NO EMAIL' WHERE 1 = 1;
    
ALTER TABLE friends
MODIFY (email VARCHAR(50) DEFAULT 'no email');
    
/*4. Check if the default email works correctly*/
INSERT INTO friends (id, name, surname)
VALUES (650, 'Bad', 'Vlad');

/*5. Chanhe the name of id colums (make it 'friends_id')*/
ALTER TABLE friends
RENAME COLUMN id TO friends_id;

/*6. Delete table friends*/
DROP TABLE friends;

/*7. Create table friends with the following columns:
id, name, surname, email, salary, city, birthdate. Salary and birthday columns must have default values.*/
SELECT * FROM friends;
DROP TABLE friends;

CREATE TABLE friends (
    id INTEGER,
    name VARCHAR2(20),
    surname VARCHAR2(20),
    email VARCHAR2(50),
    salary NUMBER(7,3) DEFAULT 0,
    city VARCHAR2(20),
    birthday DATE DEFAULT TO_DATE('10-MAR-1985', 'DD-MON-YYYY')
);

/*8. Insert 1 row into friends table.*/
INSERT INTO friends VALUES
    (1, 'Vasya', 'Pupkin', 'vasya@pupkin.com', 5500, 'Vorkuta', '15-MAY-1986');
    
/*9. Insert 1 row into friends table (with no salary and birthday values).*/
INSERT INTO friends 
    (id, name, surname, email, city)
    VALUES
    (2, 'Petya', 'Vasechkin', 'petya@vasechkin.com', 'Murmansk');
    
/*10. Commit*/
COMMIT;

/*11. Remove salary column from the table*/
ALTER TABLE friends
    DROP COLUMN salary;

/*12. Set email column unused.*/
ALTER TABLE friends
    SET UNUSED COLUMN email;
    
/*13. Set birthday column unused.*/
ALTER TABLE friends
    SET UNUSED COLUMN birthday;
    
/*14. Remove unused columns*/

ALTER TABLE friends DROP UNUSED COLUMNS;

/*15. Set table friends into read only mode*/
ALTER TABLE friends READ ONLY;

/*16. Check if read only works correctly*/
INSERT INTO friends 
    (id, name, surname, city)
    VALUES
    (2, 'Kolya', 'Ivanov', 'kolya@ivanov.com', 'Moscow'); /*not allowed*/
    
/*17. Remove all data of the friends table*/
ALTER TABLE friends READ WRITE;
TRUNCATE TABLE friends;
/*18. Delete table friends*/
DROP TABLE friends;
