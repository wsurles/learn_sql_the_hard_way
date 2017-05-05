DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS person_pet;
DROP TABLE IF EXISTS pet;

-- ex2
CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	age INTEGER
);

CREATE TABLE pet (
	id INTEGER PRIMARY KEY,
	name TEXT,
	breed TEXT,
	age INTEGER,
	dead INTEGER
);

CREATE TABLE person_pet (
	person_id INTEGER,
	pet_id INTEGER
);

-- ex3
INSERT INTO person (id, first_name, last_name, age)
	VALUES (0, "Zed", "Shaw", 37);

INSERT INTO pet (id, name, breed, age, dead)
	VALUES (0, "Fluffy", "Unicorn", 1000, 0);

INSERT INTO pet 
	VALUES (1, "Gigantor", "Robot", 1, 1);

-- ex3b
INSERT INTO person (id, first_name, last_name, age)
	VALUES (1, "Dan", "Swanny", 27);

INSERT INTO pet (id, name, breed, age, dead)
	VALUES (2, "Leia", "Fluffball", 3, 0);

-- ex 4
INSERT INTO person_pet (person_id, pet_id)
	VALUES(0,0);

INSERT INTO person_pet (person_id, pet_id)
	VALUES(0,1);

INSERT INTO person_pet (person_id, pet_id)
	VALUES(1,2);

-- ex5 and ex6 are just select statements
-- ex7
-- make sure there's dead pets
SELECT name, age FROM pet WHERE dead = 1;

-- poor robot
DELETE FROM pet where dead = 1;

-- make sure the robot is gone
SELECT * FROM pet;

-- lets resurrect the robot
INSERT INTO pet 
	VALUES (1, "Gigantor", "Robot", 1, 0);

-- the robot lives!
SELECT * FROM pet;