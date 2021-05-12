/*1. Create table 'addres' with columns: id (inline constraint UNIQUE ad_id_un), country, city*/
CREATE TABLE address (
    id INTEGER CONSTRAINT ad_id_un UNIQUE,
    country VARCHAR2(30),
    city VARCHAR2(30)
);

SELECT * FROM address;

/*2. Create table 'friends' with columns: id, name, email, address_id, birthday.
Inline Foreign key constraint (address_id), linking with address.id, ON DELETE SET NULL.
CHECK Constraint (length of name > 3)*/
CREATE TABLE friends (
    id INTEGER,
    name VARCHAR2(30),
    email VARCHAR2(30),
    address_id INTEGER REFERENCES address(id) ON DELETE SET NULL,
    birthday DATE,
    CHECK (LENGTH(name) > 3)
    );
/*3. Create unique index (friends.id)*/
CREATE UNIQUE INDEX friends_id_index ON friends (id);

/*4. Using ADD, ALTER TABLE:
add PRIMARY KEY constraint on friends.id, fe_id_pk*/
ALTER TABLE address
ADD CONSTRAINT fr_id_pk PRIMARY KEY (id);

/*5. Create index fr_email_in on friends.email*/
CREATE INDEX friends_email_index ON friends (email);

/*6. Using MODIFY, ALTER TABLE:
create NOT NULL constraint fr_email_nn on friends.email */
ALTER TABLE friends
MODIFY (email CONSTRAINT fr_email_nn NOT NULL);

/*7. Drop table friends*/
DROP TABLE friends;


/*7. Drop table address*/
DROP TABLE address;