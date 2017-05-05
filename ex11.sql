-- Replacing data
-- This is not simple in postgres. 
-- There is a bunch of confusing discussion on the web of how
--   to do an upsert in postgres. Not that simple.

-- This should fail because 0 is already taken.
insert into person (id, first_name, last_name, age)
	values (0, 'Frank', 'Smith', 100);

-- We can force it by doing an insert or replace.
insert or replace into person (id, first_name, last_name, age)
	values (0, 'Frank', 'Smith', 100);

select * from person;

-- And shorthand for that is just replace.
replace into person (id, first_name, last_name, age)
	values (0, 'Zed', 'Shaw', 37);

-- now you can see I'm back.
select * from person;

