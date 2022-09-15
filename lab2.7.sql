USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name AS category, count(film_id) AS n_films
FROM sakila.category c INNER JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.name;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT CONCAT(s.first_name,' ',s.last_name) as name, SUM(amount) as total_amount
FROM sakila.staff s INNER JOIN sakila.payment p
ON s.staff_id = p.staff_id
GROUP BY name
ORDER BY total_amount DESC;

-- 3. Which actor has appeared in the most films? -> Gina Degeneres
SELECT a.actor_id,CONCAT(a.first_name,' ',a.last_name),count(film_id) as n_films
FROM sakila.film_actor fa JOIN sakila.actor a
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY n_films DESC;

-- 4. Most active customer (the customer that has rented the most number of films) -- Eleanor hunt
SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS client,count(rental_id) as total_rented_films
FROM sakila.customer c INNER JOIN sakila.rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY total_rented_films DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name,s.last_name,a.address
FROM sakila.staff s INNER JOIN sakila.address a 
ON a.address_id = s.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title, count(actor_id) as n_actors
FROM sakila.film f INNER JOIN sakila.film_actor fa
on f.film_id = fa.film_id
GROUP BY f.title
ORDER BY n_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.last_name,c.first_name,SUM(amount) AS total_spent
FROM sakila.customer c INNER JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id,c.last_name,c.first_name
ORDER BY last_name;

-- 8. List number of films per category.
SELECT c.name,COUNT(film_id) as n_films
FROM sakila.film_category fc INNER JOIN sakila.category c
on fc.category_id = c.category_id
GROUP BY c.name
ORDER BY n_films DESC;