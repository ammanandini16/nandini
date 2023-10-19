USE sakila;
select * from actor;
#TASK 1 
# To find the full name
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM actor;

#TASK 2i
#To find repeated and distinct of first names
SELECT first_name, COUNT(*) AS count FROM actor GROUP BY first_name ORDER BY count DESC;
#TASK 2ii
SELECT DISTINCT first_name FROM actor;

#TASK 3i
#To find repeated and distinct of last names
SELECT last_name, COUNT(*) AS count FROM actor GROUP BY last_name ORDER BY count DESC;
#TASK 3ii
SELECT DISTINCT last_name FROM actor;

#task 4i
#To analyze the movie is suitable for the children based on the based on the rating 
SELECT title,rating FROM film WHERE rating = 'R';
#task 4ii
SELECT title,rating FROM film WHERE rating != 'R';
#task 4ii
SELECT title,rating FROM film WHERE rating = 'G' OR rating = 'PG';

#TASK 5i
#To display the movies with replacement cost upto$11 , between $11 and  $20 and arrange movies in descending order by replacement cost.
SELECT  title,replacement_cost  FROM film WHERE replacement_cost <= 11.00;
#TASK 5ii
SELECT  title,replacement_cost FROM film WHERE replacement_cost BETWEEN 11 AND 20;
#TASK 5iii
SELECT  title,replacement_cost  FROM film ORDER BY replacement_cost DESC;

#TASK 6
#To fetch the top 3 movies with highest count of actors
SELECT film.title, COUNT(film_actor.actor_id) AS COUNT_OF_ACTOR FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id GROUP BY film.title ORDER BY COUNT_OF_ACTOR  DESC LIMIT 3;

#TASK 7
#To fetch the movie names starting with K & Q
SELECT title FROM film WHERE title LIKE 'K%' OR title LIKE 'Q%' ORDER BY title;

#TASK 8
#To fetch the names of the actors who acted in Agent Truman
SELECT actor.first_name, actor.last_name FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id WHERE film.title = 'AGENT TRUMAN';

#TASK 9
#To fetch the movie name under the category family
SELECT film.title FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id WHERE category.name = 'Family';

#TASK 10i
#To fetch  maximum ,minimum and average rental ratings and also fetch the movies that is   rented most
SELECT rating,
       MAX(rental_rate) AS maximum_rental,
       MIN(rental_rate) AS minimum_rental,
       AVG(rental_rate) AS average_rental FROM film GROUP BY rating ORDER BY average_rental DESC;
#TASK 10ii
SELECT film.title, COUNT(rental.rental_id) AS count_of_rent
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id GROUP BY film.title ORDER BY count_of_rent  DESC;

#TASK 11i
#To fetch the film categories, the difference between average replacement cost and average film rate is greater than 15.
SELECT category.name AS category_name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
HAVING (AVG(film.replacement_cost) - AVG(film.rental_rate)) > 15;
#TASK 11ii
#Fetch the average film replacement cost and average film rental rate of above find film category
SELECT category.name AS category_name,
AVG(film.replacement_cost) AS avg_replacement_cost,
AVG(film.rental_rate) AS avg_rental_rate FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category_name;
#TASK 12
#To fetch the categories where number of movies is greater than 70
SELECT category.name AS category_name, COUNT(*) AS count_of_movie FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
HAVING COUNT(*) > 70;














