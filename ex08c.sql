-- Delete any dead pets owned by Zed

select * from pet;

delete from pet where pet.id in (
	select pet.id from pet
	left join person_pet pp on pp.pet_id = pet.id
	left join person on person.id = pp.person_id
	where person.first_name = 'Zed' and pet.dead = 1
	);

select * from pet;

delete from person_pet where person_pet.pet_id not in (
	select pet.id from pet
	);

select * from person_pet;