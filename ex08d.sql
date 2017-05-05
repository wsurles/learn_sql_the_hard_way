-- Delete any people with dead pets

select * from person;

delete from person where person.id in (
	select person.id from person
	left join person_pet pp on pp.person_id = person.id
	left join pet on pet.id = pp.pet_id
	where pet.dead = 1
	);