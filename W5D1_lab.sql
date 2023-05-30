#In the table actor, select the actors whose last names are not repeated.

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1
ORDER BY last_name;

#Select the last names that appear more than once in the table actor.
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1
ORDER BY last_name;

#Count the number of rentals processed by each employee in the rental table.
select staff_id, 
count(*)
FROM rental
GROUP BY staff_id;

#Count the number of films released each year in the film table.
SELECT release_year, 
count(*)
FROM film
GROUP BY release_year;


#Count the number of films for each rating in the film table.

SELECT rating,
count(*) as 'nb films'
FROM film
GROUP BY rating;

#Calculate the mean length of films for each rating, rounded to two decimal places.

SELECT DISTINCT rating, ROUND(AVG(length) OVER (PARTITION BY rating), 2) as mean_length
FROM film;

#Identify the ratings that have a mean duration of more than two hours.

SELECT rating, ROUND(AVG(length), 2) as mean_length
FROM film
GROUP BY rating
HAVING mean_length > 120;

