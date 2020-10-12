# SELECT within SELECT Tutorial

[链接](https://napier.sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial)

- List each country name where the population is larger than that of 'Russia'.

`world(name, continent, area, population, gdp)`

```sql
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
```

- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

```sql
select name
from world
where continent = 'Europe' and gdp/population > (select gdp/population from world where name = 'United Kingdom')
```

- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

```sql
select name, continent
from world
where continent in (select continent from world where name in ('Argentina', 'Australia')) order by name
```

- Which country has a population that is more than Canada but less than Poland? Show the name and the population.

```sql
select name, population
from world
where population > (select population from world where name = 'Canada')
and population < (select population from world where name = 'Poland')
```

- Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

```sql
select name, concat(round(population/(select population from world where name = 'Germany') * 100), '%')
from world
where continent = 'Europe'
```

- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

```sql
select name
from world
where gdp > all(select gdp from world where gdp is not NULL and continent = 'Europe')
```

- Find the largest country (by area) in each continent, show the continent, the name and the area:

```sql
SELECT continent, name, area
FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent = x.continent
          AND area > 0)
```

- List each continent and the name of the country that comes first alphabetically.

```sql
select continent, name
from world x
where name = (select name from world y where x.continent = y.continent order by name limit 1)
```

- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

```sql
select name, continent, population
from world x
where 25000000 >= all(select y.population from world y where x.continent = y.continent and population > 0)
```

- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

```sql
select name, continent
from world x
where x.population >= all(select 3 * y.population from world y where x.continent = y.continent and x.name != y.name)
```
