--testing the data from dvdrental that i'm using for my portfolio project
SELECT * FROM actor;

--analyzing a different table
SELECT * FROM customer;

--this SQL statement grabs the customers full names and their email 
SELECT first_name, last_name, email
FROM customer;

 --to determine how many release years are there on the film table
SELECT DISTINCT(release_year)
FROM film;

--what is the email for the customer with the name Nancy Thomas
SELECT email FROM customer
WHERE first_name='Nancy' AND last_name='Thomas';

--description for the movie "Outlaw Hanky"
SELECT description FROM film
WHERE title='Outlaw Hanky';

--customer Ids of the first 10 customers who created payments
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

--titles of 5 shortest 5 movies in length
SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;

--transactions that were greater then $5.00
SELECT COUNT(amount) FROM payment
WHERE amount >5;

--actors with first name starting with 'P'
SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

--the number of unique districts the customers come from
SELECT COUNT(DISTINCT (district))
FROM address;

--films with R ratings and replacement cost between $5 and $15
SELECT COUNT(*) FROM film
WHERE rating= 'R'
AND replacement_cost BETWEEN 5 AND 15;

--films with 'Truman' in the title
SELECT COUNT(*) FROM film
WHERE Title LIKE '%Truman%';

--payments handled by staff member 1 and 2, and who got the bonus based on most payments handled
SELECT staff_id,COUNT(amount)
FROM payment
GROUP BY staff_id;

--average replacement cost per MPAA rating
SELECT rating,ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

--customer ids of top 5 customers by total spend
SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

--customer ids eligible for platinum status
SELECT customer_id, COUNT(*)
FROM payment
GROUP BY customer_id
HAVING COUNT(*)>=40;

--customer ids of customers who have spent more that $100 in payment with staff_id 2
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id='2'
GROUP BY customer_id
HAVING SUM(amount)>100;

--emails of customers who live in California
SELECT district,email FROM address
INNER JOIN customer ON 
address.address_id=customer.address_id
WHERE district='California';

--list of movies with 'Nick Wahlberg' in it
SELECT title,first_name,last_name
FROM film_actor INNER JOIN actor 
ON film_actor.actor_id=actor.actor_id
INNER JOIN film
ON film_actor.film_id=film.film_id
WHERE first_name='Nick'
AND last_name='Wahlberg';


--comparing various amounts of film that are there per movie rating
SELECT 
SUM(
CASE rating
WHEN 'R'THEN 1 ELSE 0
END
) AS r,
SUM(
CASE rating
WHEN 'PG'THEN 1 ELSE 0
END
) AS pg,
SUM(
CASE rating
WHEN 'PG-13'THEN 1 ELSE 0
END
) AS pg13
FROM film;
					