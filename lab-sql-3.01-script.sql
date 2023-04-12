-- Lab-sql-3.01

use sakila;

-- 1. Drop column picture from staff.
alter table staff
drop column picture;
select * from staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY 
-- SANDERS, and she is a customer. Update the database accordingly.
select store_id from staff
where first_name = "jon";

select * from customer
where first_name = "Tammy";

insert into staff(staff_id, first_name, last_name, address_id,
email, store_id, username, password, last_update)
values
(3, "Tammy", "Sanders", 79, "sanders@sakila.com", 2, "tamsan", 
"fakepass", CURRENT_DATE());

select * from staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte 
-- Hunter from Mike Hillyer at Store 1. You can use current 
-- date for the rental_date column in the rental table.

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select inventory_id, title, i.film_id from film f
join inventory as i
on f.film_id = i.film_id
where title = "Academy Dinosaur";

insert into inventory(film_id, store_id, last_update)
values
(1, 1, CURRENT_DATE());

insert into rental(rental_date, inventory_id, customer_id, staff_id, last_update)
values
(current_date(), 4582, 130, 1, current_date());

-- For the db-diagram, I would've removed the twoo tables
-- which are film_actor and film_category. But when I imported
-- the new_test file, I observed that those tables were gone.
-- I attached a screenshot.
