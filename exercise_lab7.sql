USE sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name, count(film_id) AS "Films_num" FROM film_category AS fc
JOIN category AS c
ON fc.category_id = c.category_id
GROUP BY fc.category_id; -- done

-- 2. Display the total amount rung up by each staff member in August of 2005.
select * from rental;
SELECT s.first_name,s.last_name, count(r.rental_id) AS "Num_rentals" FROM rental AS r
JOIN staff AS s
ON s.staff_id = r.staff_id
WHERE left(r.rental_date,7) = "2005-08"
GROUP BY r.staff_id; -- done

-- 3. Which actor has appeared in the most films?
SELECT a.actor_id, a.first_name AS "name", a.last_name AS "last", count(film_id) AS "num_films" FROM film_actor AS fa
JOIN actor as a
ON a.actor_id = fa.actor_id
GROUP BY actor_id
ORDER BY num_films DESC; -- Done

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT c.first_name,c.last_name, count(r.customer_id) AS "Num_rentals" FROM rental AS r
JOIN customer AS c
ON c.customer_id = r.customer_id
GROUP BY r.customer_id
ORDER BY Num_rentals DESC; -- done

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address FROM staff AS s
JOIN address AS a
ON s.address_id = a.address_id; -- done

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title, count(fa.actor_id) AS "Num_actors" FROM film_actor AS fa
JOIN film AS f
ON fa.film_id = f.film_id
GROUP BY fa.film_id
ORDER BY Num_actors DESC; -- done


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select * from payment;
select * from customer;

SELECT 
	c.last_name,
    c.first_name,
    sum(p.amount)  AS "Total_paid"  
FROM payment AS p
JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY c.last_name; -- done


-- 8. List number of films per category.
SELECT c.name, count(film_id) AS "Films_num" FROM film_category AS fc
JOIN category AS c
ON fc.category_id = c.category_id
GROUP BY fc.category_id; -- done
