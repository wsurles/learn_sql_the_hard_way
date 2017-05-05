-- Delete any pets owned by "Dan"

SELECT * FROM pet;

DELETE FROM pet 
	WHERE id in (
		SELECT pet.id 
		FROM pet
		LEFT JOIN person_pet pp 
		  ON pp.pet_id = pet.id
		LEFT JOIN person
		  ON person.id = pp.person_id
		WHERE person.first_name = "Dan"
	);

SELECT * FROM pet;

SELECT * FROM person_pet;

DELETE FROM person_pet 
	WHERE pet_id NOT IN (
		SELECT pet.id FROM pet
	);

SELECT * FROM person_pet;