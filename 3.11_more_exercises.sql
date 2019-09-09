SELECT language, percentage FROM countrylanguage
JOIN city USING(CountryCode)
WHERE Name='Santa Monica'
ORDER BY percentage ASC;


SELECT Region, COUNT(*) FROM country
GROUP BY Region
ORDER BY COUNT(*) ASC;

SELECT Region, SUM(Population) as population FROM country
GROUP BY Region
ORDER BY population DESC;


SELECT Continent, SUM(Population) as population FROM country
GROUP BY Continent
ORDER BY population DESC;

SELECT AVG(LifeExpectancy) FROM country;

SELECT Continent, AVG(LifeExpectancy) AS LifeExpectancy FROM country
GROUP BY Continent
ORDER BY LifeExpectancy ASC;

SELECT Region, AVG(LifeExpectancy) AS LifeExpectancy FROM country
GROUP BY Region
ORDER BY LifeExpectancy ASC;

use sakila;
SELECT LOWER(CONCAT(first_name, ' ', last_name)) as Name FROM actor;

SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = 'JOE';

SELECT * FROM actor WHERE last_name LIKE('%gen%');

SELECT * FROM actor WHERE last_name LIKE('%li%')
ORDER BY last_name, first_name ASC;

SELECT last_name, COUNT(*) FROM actor
GROUP BY last_name;

SELECT last_name, COUNT(*) FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

SELECT CONCAT(first_name, ' ', last_name), address FROM staff
JOIN address.address USING(address_id);

SELECT CONCAT(first_name, ' ', last_name) as Name, SUM(amount) as total FROM payment
JOIN staff ON staff.staff_id = payment.staff_id
WHERE payment_date LIKE '2005-05-%'
GROUP BY Name;

SELECT title, COUNT(*) as count FROM film_actor
JOIN film ON film.film_id = film_actor.film_id
GROUP BY title;

SELECT title, COUNT(*) AS count FROM inventory
JOIN film ON film.film_id = inventory.film_id
WHERE title = 'Hunchback Impossible'
GROUP BY title;

SELECT title FROM film
WHERE language_id IN (
SELECT language_id FROM language
WHERE name = 'English' 
) AND title LIKE ('Q%') OR title LIKE ('K%');

SELECT DISTINCT CONCAT(first_name, ' ', last_name) AS Name FROM film_actor
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE actor.actor_id IN (
SELECT actor_id FROM film_actor
WHERE film_id IN (
SELECT film_id FROM film
WHERE title = 'Alone Trip'))
GROUP BY Name;


SELECT CONCAT(first_name, ' ', last_name) AS Name, email, country
FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
WHERE country = 'Canada';

SELECT title FROM film_category
JOIN film USING (film_id)
JOIN category USING (category_id) WHERE name = 'Family';

-- staff exclusivly work at same store, yielding the same result
SELECT staff_id as store_id, SUM(amount) as total FROM payment
GROUP BY staff_id;


SELECT store_id, address, city, country FROM store
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id);



SELECT name, SUM(amount) as gross FROM payment
JOIN rental USING (rental_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY name
ORDER BY gross DESC;


SELECT * FROM actor;
SELECT last_name FROM actor;

SELECT DISTINCT last_name FROM actor;
SELECT DISTINCT address FROM address;
SELECT DISTINCT rating FROM film;

SELECT title, description, rating FROM film
WHERE length >= 180;
SELECT payment_id, amount, payment_date FROM payment
WHERE payment_date >= 2005-05-27;
SELECT payment_id, amount, payment_date FROM payment
WHERE payment_date = 05/27/2005;
SELECT * FROM customer
WHERE last_name LIKE ('S%') AND first_name LIKE ('%N');
SELECT * FROM customer 
WHERE active = 1 AND last_name LIKE ('M%');
SELECT * FROM film_category
JOIN film USING (film_id)
JOIN category USING(category_id)
WHERE film_id >= 4 AND category_id > 3
AND title LIKE ('C%') or title LIKE ('T%') or title LIKE ('S%');
SELECT * FROM staff;

SELECT phone, district FROM address
WHERE district IN ('England', 'California', 'Taipei', 'West Java');
SELECT payment_id, amount, payment_date FROM payment
WHERE payment_date = ISDATE('05/25/2005');
SELECT * FROM film
WHERE rating = 'G' OR
rating = 'PG-13' OR
rating = 'NC-17';

SELECT * FROM payment 
WHERE payment_id BETWEEN DATE(2005-05-25 24:00:00) AND DATE(2005-06-25 23:59:59);

SELECT title FROM film
WHERE LENGTH(description) >= 100 AND LENGTH(description) <= 120;

SELECT title, description FROM film
WHERE description LIKE ('A Thoughtful%');
SELECT title, description FROM film 
WHERE description LIKE ('%Boat');
SELECT title, description, length FROM film
WHERE description LIKE ('%Database%') AND length > 180;

SELECT * FROM payment LIMIT 20;
SELECT payment_date, amount FROM payment
WHERE amount > 5
LIMIT 1001 OFFSET 999;
SELECT * FROM customer
LIMIT 100
OFFSET 100;

SELECT * FROM film
ORDER BY CHAR_LENGTH(title) ASC;
SELECT DISTINCT rating FROM film
ORDER BY rating DESC;
SELECT title, description, special_features, length, rental_duration FROM film
WHERE (rental_duration BETWEEN 5 AND 7)
AND special_features LIKE ('%Behind the Scenes%')
AND length < 120
LIMIT 10;

SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name
, CONCAT(actor.first_name, ' ', actor.last_name) AS actor_name
FROM customer
LEFT JOIN actor ON customer.last_name = actor.last_name
WHERE actor.last_name = customer.last_name;



SELECT AVG(replacement_cost) FROM film;
SELECT rating, AVG(replacement_cost) FROM film
GROUP BY rating;

SELECT name, COUNT(*) FROM film_category
JOIN category USING(category_id) 
GROUP BY name;

SELECT title, COUNT(*) FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
GROUP BY title
ORDER BY COUNT(*) DESC
LIMIT 5;

SELECT title, SUM(amount) AS amount FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN payment USING (rental_id)
GROUP BY title
ORDER BY amount DESC
LIMIT 5;

SELECT CONCAT(last_name, ', ', first_name) AS name, SUM(amount) AS total FROM customer
JOIN payment USING (customer_id)
GROUP BY name
ORDER BY total DESC
LIMIT 1;


SELECT CONCAT(last_name, ', ', first_name) AS actor_name, COUNT(*) as total 
FROM film_actor
JOIN actor USING (actor_id)
GROUP BY actor_name
ORDER BY total DESC
LIMIT 5;


SELECT (payment date), staff_id AS store_id, SUM(amount) FROM payment
GROUP BY payment_date, store_id;


SELECT MONTH(payment_date)as m, store_id, SUM(amount) FROM payment
JOIN staff USING (staff_id)
JOIN store USING (store_id)
WHERE YEAR(payment_date) <> 2006
GROUP BY m, store_id
ORDER BY m ASC, store_id DESC, SUM(amount) ASC;

SELECT MONTH(payment_date) as m, SUM(amount), store_id FROM rental
JOIN payment USING (rental_id)
JOIN staff ON staff.staff_id = rental.staff_id
JOIN store USING (store_id)
WHERE YEAR(payment_date) = 2005
GROUP BY m, rental.staff_id
