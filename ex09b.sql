
-- use update to change my name back to zed by my person_id 

update person set first_name = "Zed"
	where person.id = 0; 

-- write an update that renames any dead animals to deceased. 

update pet set name = "deceased"
	where dead = 1;

-- try ising a subquery with this just like with delete

update person set first_name = "funny guy" 
	where person.id in (
		select person.id from person
		left join person_pet pp on pp.person_id = person.id
		left join pet on pet.id = pp.pet_id
		where pet.name = "deceased"
		);