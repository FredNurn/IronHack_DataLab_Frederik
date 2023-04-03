USE sakila;

SELECT * FROM actor;
# Alternative: Table Inspector

SELECT title FROM film;

SELECT DISTINCT name AS language FROM language;

SELECT DISTINCT count(store_id) FROM store
WHERE store_id IS NOT NULL;

SELECT * FROM store;

SELECT sum(staff_id) from staff;

SELECT * FROM staff;

SELECT first_name FROM staff
WHERE first_name IS NOT NULL;