# SELECT from Nobel Tutorial

[链接](https://napier.sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial)

- Change the query shown so that it displays Nobel prizes for 1950.

```sql
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
```

- Show who won the 1962 prize for Literature.

```sql
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
```

- Show the year and subject that won 'Albert Einstein' his prize.

```sql
select yr, subject
from nobel
where  winner = 'Albert Einstein'
```

- Give the name of the 'Peace' winners since the year 2000, including 2000.

```sql
select winner
from nobel
where yr >= 2000 and subject = 'Peace'
```

- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

```sql
select yr, subject, winner
from nobel
where subject = 'Literature' and yr >= 1980 and yr <= 1989
```

- Show all details of the presidential winners:

  - Theodore Roosevelt
  - Woodrow Wilson
  - Jimmy Carter
  - Barack Obama

```sql
SELECT * FROM nobel
where winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')
```

- Show the winners with first name John

```sql
select winner
from nobel
where winner like 'John%'
```

- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.

```sql
select yr, subject, winner
from nobel
where (subject = 'Physics' and yr = 1980) or (subject = 'Chemistry' and yr = 1984)
```

- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

```sql
select yr, subject, winner
from nobel
where yr = 1980 and subject not in ('Chemistry', 'Medicine')
```

- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

```sql
select yr, subject, winner
from nobel
where (subject = 'Medicine' and yr < 1910) or (subject = 'Literature' and yr >= 2004)
```

- Find all details of the prize won by PETER GRÜNBERG

```sql
select yr, subject, winner
from nobel
where winner = 'PETER GRÜNBERG'
```

- Find all details of the prize won by EUGENE O'NEILL

```sql
select yr, subject, winner
from nobel
where winner = 'EUGENE O\'NEILL'
```

- Knights in order

List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

```sql
select winner, yr, subject
from nobel
where winner like 'Sir%' order by yr desc, winner asc
```

- The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

```sql
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Chemistry','Physics'), subject, winner
```
