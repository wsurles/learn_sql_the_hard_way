-- Destroying and altering tables

-- Only drop table if it exists
drop table if exists person;

-- Create again to work with it.
create table person (
	id integer primary key,
	first_name text,
	last_name text,
	age integer
	);

-- Rename the table to peoples.
alter table person rename to peoples;

-- Add a hatred column to peoples
alter table peoples add column hatred integer;

-- rename peoples back to person.
alter table peoples rename to person;

.schema person

-- we don't need that
drop table person;
