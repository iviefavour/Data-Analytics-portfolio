/* 1. pull out rental_duration,length,rating,and the maximum replacement_cost from film table
2. pull out length,relaease_year and the sum of rental_duration from film table
3. pull out the record of rental_rate,rating,and the count of film_id
4. select rating,length,from film_table where length is >50
5. select rating,count of film_id As count of film,minimum length as shortest length,max length as longest length
6. the record of length when length is less than 40 should be called nice one,when length is greater than 60 should be called big boy,
 when length is greater than 40 and >50 should be called big head 
 */
 
 --  1. pull out rental_duration,length,rating,and the maximum replacement_cost from film table
 
 select* from film;
 use mavenmovies;
 select
	  rental_duration,
      length,
      rating,
      max(replacement_cost) as Maximum_Replacement_cost
from film
group by rental_duration,length,rating;

-- 2. pull out length,relaease_year and the sum of rental_duration from film table

select
     length,
     release_year,
     sum(rental_duration)
from film
group by length, release_year;
     
 -- 3. pull out the record of rental_rate,rating,and the count of film_id
 
 select
      rating,
      rental_rate,
      count(film_id)
from film
group by rating,rental_rate;
 
 
 -- 4. select rating,length,from film_table where length is >50
 select
       rating,
       length
from film
where length > 50
group by rating,length;

/* 5. select rating,count of film_id As count of film
,minimum length as shortest length,max length as longest length*/

select
    rating,
    count(film_id) as Count_of_film,
    min(length) as Shortest_Length,
    max(length) as Longest_Length
from film
group by rating;


/* 6. the record of length when length is less than 40 should be called nice one,
when length is greater than 60 should be called big boy,
 when length is greater than 40 and >50 should be called big head 
 */

select

      length,
	case
    when length < 40 then " nice one "
    when length > 50 then " big boy"
    when length > 50 then " big head"
    ELSE 'please!!! check logic'
    END as length_record
    from film;
    
    
    select* from film;