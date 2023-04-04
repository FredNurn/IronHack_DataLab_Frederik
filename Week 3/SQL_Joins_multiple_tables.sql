#1 Write a query to display for each store its store ID, city, and country.
SELECT store.store_id, city.city, country.country
FROM store 
    INNER JOIN address 
        USING (address_id)
    INNER JOIN city
        USING (city_id)
	INNER JOIN country
        USING (country_id);
        
#2 Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, sum(payment.amount)
FROM store 
    INNER JOIN customer 
        USING (store_id)
	INNER JOIN payment
        USING (customer_id)
GROUP BY store_id;
# results are not the same...

SELECT store_id, sum(payment.amount)
FROM store 
    INNER JOIN staff 
        USING (store_id)
	INNER JOIN payment
        USING (staff_id)
GROUP BY store_id;
# Results are OK

#3 What is the average running time(length) of films by category?
SELECT category.name, round(avg(film.length),2)
FROM category 
    INNER JOIN film_category 
        USING (category_id)
	INNER JOIN film
        USING (film_id)
GROUP BY category.name
ORDER BY category.name;

#4 Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)

SELECT category.name, round(avg(film.length),2)
FROM category 
    INNER JOIN film_category 
        USING (category_id)
	INNER JOIN film
        USING (film_id)
GROUP BY category.name
ORDER BY avg(film.length) DESC
LIMIT 5;

#5 Display the top 5 most frequently(number of times) rented movies in descending order.
SELECT film.title
FROM film 
    INNER JOIN inventory 
        USING (film_id)
    INNER JOIN rental
        USING (inventory_id)
GROUP BY film.title
ORDER BY count(rental_id) DESC
LIMIT 5;

#6 List the top five genres in gross revenue in descending order.
SELECT category.name, sum(amount)
FROM category
	INNER JOIN film_category
		USING (category_id)
	INNER JOIN film
		USING (film_id)
	INNER JOIN inventory
		USING (film_id)
	INNER JOIN rental
		USING (inventory_id)
	INNER JOIN payment
		USING (rental_id)
GROUP BY category.name
ORDER BY sum(amount) DESC
LIMIT 5;

#7 Is "Academy Dinosaur" available for rent from Store 1?
SELECT film.title, inventory.store_id, count(rental.rental_date) - count(rental.return_date)  AS rented_out
	FROM film
		INNER JOIN inventory
			USING (film_id)
		LEFT JOIN rental
			USING (inventory_id)
WHERE film.title='academy dinosaur' AND inventory.store_id =1
GROUP BY inventory.store_id;
# All rented movies have been returned -> Academy Dinosaur is available.

