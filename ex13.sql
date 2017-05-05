-- Migrating and evolving data

-- add a dead columnto person thats like the one in pet
alter table person add column dead integer;

-- add a phone_number column to person
alter table person add column phone_number text;

-- add a salary column to person that is float
alter table person add column salary float;

-- add a dob column to both person and pet that is a datetime
alter table person add column dob datetime;
alter table pet add column dob datetime;

-- add a purchased_on column to person_pet of type datetime
alter table person_pet add column purchased_on datetime;

-- add a parent to pet column thats an integer and holds the id for this pets parent
alter table pet add column parent integer;

-- update the existing database records with the new column data using update staements.
update person set dead = 0;
update person set phone_number = '123-456-7890' where first_name = 'Zed';
update person set phone_number = '098-765-4321' where first_name = 'Dan';
update person set salary = 90.45 where first_name = 'Zed';
update person set salary = 20.12 where first_name = 'Dan';
update person set dob = '1976-08-10' where first_name = 'Zed';
update person set dob = '1987-06-15' where first_name = 'Dan';

update pet set dob = '1900-01-01' where name = 'Fluffy';
update pet set dob = '1999-01-01' where name = 'Gigantor';
update pet set dob = '2012-01-01' where name = 'Leia';

update person_pet set purchased_on = '1990-01-01' where pet_id = 0;
update person_pet set purchased_on = '1999-01-01' where pet_id = 1;
update person_pet set purchased_on = '2014-07-01' where pet_id = 2;

-- Add 4 more people
INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (2, "William", "Surles", 30, 0, '303-513-7641', 20, '1984-03-20');

INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (3, "Kevin", "Vanharn", 27, 0, '111-111-1111', 25, '1987-01-01');

INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (4, "Jason", "Wood", 34, 0, '222-222-2222', 26, '1980-01-01');

INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (5, "Mike", "Soltys", 31, 0, '333-333-3333', 22, '1983-06-01');

-- Insert 5 more pets
-- Set purchased_on date for new pets
INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (3, "little bear", "wild bear", 3, 0, '2012-01-01', NULL);

INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (2, 3, '2013-11-01');

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (4, "olie", "austrailian shepard", 5, 0, '2010-01-01', NULL);

INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (NULL, 4, '2012-01-01');

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (5, "nestle", "lab", 14, 1, '1986-01-01', 6);

INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (2, 5, '1986-03-01');

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (6, "nestle mom", "lab", 13, 1, '1976-01-01', NULL);

INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (NULL, 6, '1977-01-01');

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (7, "rocky", "rock", 1000, 0, '1014-01-01', NULL);

INSERT INTO person_pet (person_id, pet_id, purchased_on)
	VALUES (3, 7, '2013-11-01');

-- assign parents to the pets
update pet set parent = 7 where id = 0;
update pet set parent = NULL where id = 1;
update pet set parent = NULL where id = 2;

-- Check
select * from person;
select * from pet;
select * from person_pet;

-- Find all names of pets and their owners bought after 2014
select name, first_name
from pet
inner join person_pet pp
	on pp.pet_id = pet.id
inner join person
	on person.id = pp.person_id
where purchased_on >= '2004-01-01';

-- Find the pets that are childen of a given pet
select name 
from pet
where parent = 6;
