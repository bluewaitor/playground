# More JOIN operations

[链接](https://napier.sqlzoo.net/wiki/More_JOIN_operations)

- List the films where the yr is 1962 [Show id, title]

```sql
SELECT id, title
 FROM movie
 WHERE yr=1962
```

- Give year of 'Citizen Kane'.

```sql
select yr
from movie
where title = 'Citizen Kane'
```

- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

```sql
select id, title, yr
from movie
where title like '%Star Trek%'
order by yr
```

- What id number does the actor 'Glenn Close' have?

```sql
select id
from actor
where name = 'Glenn Close'
```

- What is the id of the film 'Casablanca'

```sql
select id
from movie
where title = 'Casablanca'
```

- Obtain the cast list for 'Casablanca'.

what is a cast list?  
The cast list is the names of the actors who were in the movie.  
Use movieid=11768, (or whatever value you got from the previous question)  

```sql
select name
from movie join casting on movie.id = casting.movieid
  join actor on casting.actorid = actor.id
where title = 'Casablanca'
```

- Obtain the cast list for the film 'Alien'

```sql
select name
from movie join casting on movie.id = casting.movieid
  join actor on casting.actorid = actor.id
where title = 'Alien'
```

- List the films in which 'Harrison Ford' has appeared

```sql
select title
from movie join casting on movie.id = casting.movieid
  join actor on casting.actorid = actor.id
where actor.name = 'Harrison Ford'
```

- List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

```sql
select title
from movie join casting on movie.id = casting.movieid
  join actor on casting.actorid = actor.id
where actor.name = 'Harrison Ford' and casting.ord <> 1
```

- List the films together with the leading star for all 1962 films.

```sql
select title, name
from movie join casting on movie.id = casting.movieid
  join actor on casting.actorid = actor.id
where movie.yr = 1962 and casting.ord = 1
```

## 更难的问题

- Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

```sql
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
```

- List the film title and the leading actor for all of the films 'Julie Andrews' played in.

```sql
select title, name
  from movie join casting on (movieid=movie.id and ord=1)
             join actor on actorid = actor.id
 where movie.id in (
   SELECT movieid FROM casting
    WHERE actorid IN (
   SELECT id FROM actor
    WHERE name='Julie Andrews'
    )
 )
```

- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

```sql
select name
from actor join casting on (actor.id = casting.actorid and casting.ord = 1)
group by name
having count(*) >= 15
order by name
```

- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

```sql
select title, count(actorid)
from movie join casting on (movie.id = casting.movieid)
where yr = 1978
group by title
order by count(actorid) desc, title
```

- List all the people who have worked with 'Art Garfunkel'.

```sql
select name
from casting join actor on casting.actorid = actor.id
where casting.movieid in (
select movieid
from casting join actor on (actor.name = 'Art Garfunkel' and actor.id = casting.actorid)
) and name <> 'Art Garfunkel'
```
