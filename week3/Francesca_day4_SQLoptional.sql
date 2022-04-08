-- 1. In the table actor, what last names are not repeated?
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd.
-- These three actors have the same last name. So we do not want to include this last name in our output.
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

use sakila;

select last_name from actor 
group by last_name having count(last_name) <2;

-- option 2:

select last_name from actor 
group by last_name having count(last_name) = 1;
 
 
-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time 
-- we want to include the last names of the actors where the last name was present more than once

select last_name from actor 
group by last_name having count(last_name) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.

select first_name, second_name, count(staff_id) from rental
inner join staff using (staff_id)
group by staff_id;



