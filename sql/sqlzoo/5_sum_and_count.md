# SUM and COUNT

[链接](https://napier.sqlzoo.net/wiki/SUM_and_COUNT)

- Show the total population of the world.
  `world(name, continent, area, population, gdp)`

```sql
SELECT SUM(population)
FROM world
```

- List all the continents - just once each.

```sql
select distinct continent
from world
```

- Give the total GDP of Africa

```sql
select sum(gdp)
from world
where continent = 'Africa'
```

- How many countries have an area of at least 1000000

```sql
select count(name)
from world
where area >= 1000000
```

- What is the total population of ('Estonia', 'Latvia', 'Lithuania')

```sql
select sum(population)
from world
where name in ('Estonia', 'Latvia', 'Lithuania')
```

- For each continent show the continent and number of countries.

```sql
select continent, count(name)
from world
group by continent
```

- For each continent show the continent and number of countries with populations of at least 10 million.

```sql
select continent, count(name)
from world
where population >= 10000000
group by continent
```

- List the continents that have a total population of at least 100 million.

```sql
select continent
from world
group by continent
having sum(population) >= 100000000
```

## 进阶练习

[链接](https://napier.sqlzoo.net/wiki/The_nobel_table_can_be_used_to_practice_more_SUM_and_COUNT_functions.)

- Show the total number of prizes awarded.

```sql
SELECT COUNT(winner) FROM nobel
```

- List each subject - just once

```sql
select distinct subject
from nobel
```

- Show the total number of prizes awarded for Physics.

```sql
select count(winner)
from nobel
where subject = 'Physics'
```

- For each subject show the subject and the number of prizes.

```sql
select subject, count(winner)
from nobel
group by subject
```

- For each subject show the first year that the prize was awarded.

```sql
select subject, min(yr)
from nobel
group by subject
```

- For each subject show the number of prizes awarded in the year 2000.

```sql
select subject, count(winner)
from nobel
where yr = 2000
group by subject
```

- Show the number of different winners for each subject.

```sql
select subject, count(distinct winner)
from nobel
group by subject
```

- For each subject show how many years have had prizes awarded.

```sql
select subject, count(distinct yr)
from nobel
group by subject
```

- Show the years in which three prizes were given for Physics.

```sql
select yr
from nobel
where subject = 'Physics'
group by yr
having count(winner) = 3
```

- Show winners who have won more than once.

```sql
select winner
from nobel
group by winner
having count(winner) > 1
```

- Show winners who have won more than one subject.

```sql
select winner
from nobel x
group by winner
having 1 < (select count(distinct subject) from nobel y where x.winner = y.winner)
```

- Show the year and subject where 3 prizes were given. Show only years 2000 onwards.

```sql
select yr, subject
from nobel
where yr >= 2000
group by yr, subject
having count(winner) = 3
```
