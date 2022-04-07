-- Lab | SQL Subqueries
-- In this lab, you will be using the Sakila database of movie rentals. Create appropriate joins wherever necessary.

use sakila;

-- Instructions
-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?
select title, count(inventory_id) from film
inner join inventory 
on film.film_id = inventory.film_id
where title = "Hunchback Impossible"; 

-- option 2:

select title, count(inventory_id) from film
inner join inventory 
using(film_id)
where title = "Hunchback Impossible"; 

-- option 3:

select title, count(inventory_id) from inventory
inner join film 
using(film_id)
where title = "Hunchback Impossible"; 


-- 2. List all films whose length is longer than the average of all the films.
select film.title, film.length from sakila.film
where film.length > (SELECT AVG(film.length) FROM film);

-- control check of the average of the film length.
SELECT AVG(film.length) FROM film;



-- 3. Use subqueries to display all actors who appear in the film Alone Trip.

select first_name, last_name from actor 
where actor_id IN
(
select actor_id from film_actor
where film_id IN
(
select film_id from film
where title = "Alone Trip"
));


-- NOTE: to select the full title of the film in a folder from a part of the title:

select distinct title
from film where title like 'alo%';


-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion.
-- Identify all movies categorized as family films.

select title from film 
where film_id IN
(
select film_id from film_category
where category_id IN
(
select category_id from category
where name = "Family"
));



-- 5. Get name and email from customers from Canada using subqueries. 


select email, first_name, last_name from customer 
where address_id IN
(
select address_id from address
where city_id IN
(
select city_id from city
where country_id in
(
select country_id from country
where country = "Canada"
)));


-- 5.2 Do the same with joins.
-- Note that to create a join, you will have to identify the correct tables with their primary keys 
-- and foreign keys, that will help you get the relevant information.


select email, first_name, last_name from customer 
inner join address using (address_id)
select address_id from address 
inner join city using (city_id)
select country_id from city 
inner join country using (country_id)
where country = "Canada";


-- explaination:
-- for the inner joints you write first all the joins complete, one after the other one:

select email, first_name, last_name from customer 
inner join address using (address_id)

inner join city using (city_id)

inner join country using (country_id)
where country = "Canada";

-- and after you remove the select sentences.



-- Optional

-- 6. Which are films starred by the most prolific actor?
-- Most prolific actor is defined as the actor that has acted in the most number of films.
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.


select title from film where film_id in (
select film_id from film_actor 
where actor_id = 
(select actor_id from film_actor 
inner join actor using(actor_id)
group by actor_id
order by count(*) desc limit 1
));

-- NOTE: to merge subqueries with inner join put =


-- 7. Films rented by most profitable customer. 
-- You can use the customer table and payment table to find the most profitable customer ie the customer that 
-- has made the largest sum of payments

select title from film where film_id in(
select film_id from inventory
where store_id in (
select store_id from payment
where customer_id = 
(select customer_id from customer 
inner join rental using(customer_id) 
group by customer_id
order by count(*) desc limit 1
)));



-- NOTE: before you wrote the following to identify the most profitable customer:
(select customer_id, first_name, last_name, count(*) as 'total_rent' from customer 
inner join rental using(customer_id) 
group by customer_id
order by count(*) desc limit 1
);
 -- and after you delete/modified parts as shown above.



-- 8. Customers who spent more than the average payments.

