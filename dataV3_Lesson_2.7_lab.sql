-- How many films are there for each of the categories in the category table?  Use appropriate join to write this query.
SELECT c.name AS category_name, COUNT(f.film_id) AS number_of_films
FROM category c
JOIN film_category fc 
USING (category_id)
JOIN film f 
USING (film_id)
GROUP BY c.name
ORDER BY number_of_films DESC;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE YEAR(p.payment_date) = 2005 AND MONTH(p.payment_date) = 8
GROUP BY s.staff_id
ORDER BY total_amount DESC;

-- Which actor has appeared in the most films?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS number_of_films
FROM actor a
JOIN film_actor fa 
USING (actor_id)
GROUP BY a.actor_id
ORDER BY number_of_films DESC
LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS number_of_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY number_of_rentals DESC
LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM staff as s
JOIN address as a
USING (address_id);

-- List each film and the number of actors who are listed for that film.
SELECT title, COUNT(actor_id) as actors
FROM film as f
LEFT JOIN film_actor as fa
USING (film_id)
GROUP BY film_id
ORDER BY actors desc;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

SELECT last_name, first_name, SUM(amount) as payment_amount
FROM customer as c
JOIN payment as p
USING (customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;

-- List the titles of films per category
SELECT c.name AS category_name, f.title AS film_title
FROM category c
JOIN film_category fc 
USING (category_id)
JOIN film f 
USING (film_id)
ORDER BY category_name, film_title;