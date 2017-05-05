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