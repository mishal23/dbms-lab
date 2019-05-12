create database if not exists lab5;

use lab5;

create table if not exists actor(
	act_id int(10),
	act_name varchar(100),
	act_gender varchar(6)
);

create table if not exists director(
	dir_id int(10),
	dir_name varchar(50),
	dir_phone int(10)
);

create table if not exists movies(
	mov_id int(10),
	mov_title varchar(100),
	mov_year int(4),
	mov_lang varchar(50),
	dir_id int(10)
);

create table if not exists movie_cast(
	act_id int(10),
	mov_id int(10),
	role varchar(100)
);

create table if not exists rating(
	mov_id int(10),
	rev_stars int(10),
	reviewer varchar(50)
);


-- 1. List the titles of all movies directed by ‘Michael’.
select m.mov_title
from movies as m, director as d
where m.dir_id = d.dir_id and d.dir_name = "Michael";


-- 2. Find the movie names where one or more actors acted in two
-- or more movies.
select distinct mov_title from movies, movie_cast
where movies.mov_id=movie_cast.mov_id and 
	(select count(mov_id) from movie_cast mc where movie_cast.act_id=mc.act_id) > 1;


-- 3. List all actors who acted in a movie before 2010 and also in a
-- movie after 2017.
select distinct act_name
from actor, movies m1, movies m2, movie_cast
where actor.act_id = movie_cast.act_id and movie_cast.mov_id = m1.mov_id and 
	movie_cast.mov_id = m2.mov_id and m1.mov_year<2010 and m2.mov_year>2017;


-- 4. Find the title of movies and number of stars for each movie
-- that has at least one rating and find the highest number of stars
-- that movie received. Sort the result by movie title.
select mov_title, maxrating from movies,  
(select mov_id, max(rev_stars) as maxrating from rating group by mov_id) AS m
where rating.mov_id = movies.mov_id
order by mov_title;


-- 5. Update rating of all movies directed by ‘Stephen’ to 4.
update rating, movies, director
set rating.rev_stars=4 
where movies.mov_id=rating.mov_id 
and movies.dir_id=director.dir_id and director.dir_name="Stephen";


-- 6. find the name of the director who directed a movie that casted
-- a role for 'The Innocents'.
select director.dir_name from director,  movies, movie_cast
where director.dir_id=movies.dir_id and movies.mov_id=movie_cast.mov_id 
and movie_cast.role="The Innocents";


-- 7.Find the title of all movies that has no ratings.
select mov_title from movies, rating
where movies.mov_id=rating.mov_id and rating.rev_stars is NULL;


-- 8. Find the reviewer's name and the title of the movie for those
-- reviewers who rated more than one movies.
select distinct reviewer, mov_title from rating, movies where movies.mov_id=rating.mov_id
and (select count(distinct mov_id) from rating r where r.reviewer=rating.reviewer)>1;