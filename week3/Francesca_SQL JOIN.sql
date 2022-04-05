use sakila;

-- 1 Which actor has appeared in the most films?

select * from film;

select COUNT(actor_id), first_name, last_name from actor 
inner join first_actor on actor.actor_id = first_actor.actor_id
order by first_actor.actor_id desc limit 1;


-- 2 Most active customer (the customer that has rented the most number of films)

select * from customer;

select count(*), customer_id, first_name, last_name from customer 
inner join rental using(customer_id) 
order by first_name desc limit 1;


-- 3 List number of films per category.
SELECT COUNT(film_id), name from category
left join film_category on category.category_id = film_category.category_id
group by category.category_id;


-- 4 Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff inner join address using(address_id);


-- 5 Display the total amount rung up by each staff member in August of 2005.
select first_name, last_name, SUM(amount) from staff inner join payment using(staff_id)
group by staff_id
ORDER BY last_name;


-- 6 List each film and the number of actors who are listed for that film.
select title, COUNT(actor_id) from film 
inner join film_actor using(film_id) 
group by film.title;



-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

Select customer.last_name, customer.first_name, SUM(payment.amount) as 'total_paid' from customer
inner join payment on customer.customer_id = payment.customer_id group by customer.last_name order by customer.last_name;





