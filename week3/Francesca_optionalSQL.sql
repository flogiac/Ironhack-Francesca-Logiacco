-- Lab | SQL Joins on multiple tables
-- In this lab, you will be using the Sakila database of movie rentals.

use sakila;

-- Instructions

-- 1. Write a query to display for each store its store ID, city, and country.
select store_id, address, city from store
inner join address using(address_id)
inner join city using(city_id)
inner join country using(country_id)
group by store_id;


-- 2. Write a query to display how much business, in dollars, each store brought in.
select store_id, amount from store
inner join customer using(store_id)
inner join payment using(customer_id)
group by store_id;

-- 3. What is the average running time(length) of films by category?


-- 4. Which film categories are longest(length)? (Hint: You can rely on question 3 output.)


-- 5. Display the most frequently(number of times) rented movies in descending order.


-- 6. List the top five genres in gross revenue in descending order.


-- 7. Is "Academy Dinosaur" available for rent from Store 1?