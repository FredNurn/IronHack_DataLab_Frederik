USE sakila;

#1 Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, count(fa.film_id)
FROM film_actor AS fa INNER JOIN actor AS a
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY count(fa.film_id) DESC
LIMIT 1;

#2 Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, count(r.rental_id) AS count
FROM customer AS c INNER JOIN rental AS r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY count(r.rental_id) DESC
LIMIT 1;

#3 List number of films per category.
SELECT cat.name, count(fc.film_id)
FROM category as cat INNER JOIN film_category AS fc
ON cat.category_id = fc.category_id
GROUP BY cat.category_id
ORDER BY cat.name;

#4 Display the first and last names, as well as the address, of each staff member.
SELECT staff.first_name, staff.last_name, ad.address
FROM staff INNER JOIN address AS ad
ON staff.address_id = ad.address_id;

#5 Get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT f.title, l.name
FROM film as f INNER JOIN language as l
ON f.language_id = l.language_id
WHERE f.title LIKE 'M%' AND l.name IN ('english', 'italian')
ORDER BY f.title desc;

#6 Display the total amount rung up by each staff member in August of 2005.
SELECT staff.first_name, staff.last_name, sum(p.amount)
FROM staff INNER JOIN payment as p
USING (staff_id)
WHERE  p.payment_date LIKE '2005-08%'
GROUP BY staff_id;

#7 List each film and the number of actors who are listed for that film.
SELECT film.title, count(fa.actor_id)
FROM film INNER JOIN film_actor as fa
USING (film_id)
GROUP BY film.title
ORDER BY count(fa.actor_id) DESC
LIMIT 10;

#8 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, sum(p.amount) AS total
FROM customer AS c INNER JOIN payment AS p
USING (customer_id)
GROUP BY customer_id
ORDER BY c.last_name;

#9 Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT a.first_name, a.last_name, count(fa.film_id)
FROM film_actor AS fa INNER JOIN actor AS a
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING count(fa.film_id)=0;


#10 get the addresses that have NO customers, and ends with the letter "e"
SELECT address.address
from customer RIGHT JOIN address
USING (address_id)
WHERE customer_id IS NULL AND address.address LIKE '%e'; 

#Optional: What is the most rented film?
SELECT film.title
FROM film 
    INNER JOIN inventory 
        USING (film_id)
    INNER JOIN rental
        USING (inventory_id)
GROUP BY film.title
ORDER BY count(rental_id) DESC
LIMIT 1;