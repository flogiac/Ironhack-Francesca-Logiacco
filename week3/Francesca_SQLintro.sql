USE sakila;
-- Database changed

-- 1. Review the tables in the database.
show full tables;
-- SELECT COUNT(*) FROM film;
-- SELECT COUNT(*) FROM film_text;

-- 2. Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from language
select * from staff
select * from payment
select * from actor
select * from address
select * from category
select * from city
select * from country
select * from costumer
select * from film
select * from film_actor
select * from film_category
select * from film_text
select * from inventory
select * from payment
select * FROM rental
select * FROM STORE


-- 3. Select one column from a table. Get film titles.
select title FROM film

-- 4. Select one column from a table and alias it. Get unique list of film languages under the alias language.
-- Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select name FROM language AS language

select title, name from film, language AS film_language


-- 5.
-- 5.1 Find out how many stores does the company have?
SELECT count(*) FROM store; 

-- 5.2 Find out how many employees staff does the company have?
SELECT count(staff_id) FROM staff; 


-- 5.3 Return a list of employee first names only?
SELECT first_name FROM staff; 







