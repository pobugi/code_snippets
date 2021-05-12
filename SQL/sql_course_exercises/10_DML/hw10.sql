/*1. Create locations2 table with the same structure as locations table.*/
CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);
-- DELETE FROM locations2 WHERE location_id = 4100;

/*2. Insert 2 rows in locations2 (location id, address, city, country id).*/
INSERT ALL
    INTO locations2 (location_id, street_address, city, country_id) 
        VALUES      (4100, 'Via Lagrange 51', 'Torino', 'IT')
    INTO locations2 (location_id, street_address, city, country_id) 
        VALUES      (4200, 'Via Castelfidardo 61', 'Genova', 'IT')
SELECT * FROM dual;    

/*3. Commit.*/
COMMIT;

/*4. Insert 2 rows in locations2 (don't specify columns).*/
INSERT INTO locations2 
VALUES 
    (4300, '47 Boulevard Aristide Briand', 06110, 'Cannes', 'Provence Alpes Cote d', UPPER('fr'));
INSERT INTO locations2 
VALUES 
    (4400, '138 Rue Joseph Vernet', 92220, 'Dijon', 'Provence Alpes Cote d', UPPER('fr'));

/*5. Commit.*/
COMMIT;

/*6. Insert into locations those rows from locations2 that have state_province > 9.*/
INSERT INTO locations2
    (SELECT * FROM locations WHERE LENGTH(state_province) > 9);

/*7. Commit.*/
COMMIT;

/*8. Create locations4europe table with the same structure as locations2 table.*/
CREATE TABLE locations4europe AS 
    (SELECT * FROM locations WHERE 1=2);

/*9. Insert into locations2 all data from locations, into locations4europe - location id, address, city, country id from locations table 
where cities are located in Europe. Use 1 statement.*/
INSERT ALL
WHEN 1=1    
THEN 
    INTO locations2 VALUES
        (location_id, street_address, postal_code, city, state_province, country_id)
WHEN country_id IN 
    (SELECT country_id FROM countries 
        WHERE region_id = 
            (SELECT DISTINCT region_id FROM regions WHERE region_name = 'Europe'))
THEN
    INTO locations4europe (location_id, street_address, city, country_id) VALUES
        (location_id, street_address, city, country_id)
SELECT * FROM locations;

SELECT * FROM locations2;
SELECT * FROM locations4europe;