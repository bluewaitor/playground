# Using Null

[链接](https://napier.sqlzoo.net/wiki/Using_Null)

- List the teachers who have NULL for their department.

```sql
select name
from teacher
where dept is null
```

- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

```sql
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
```

- Use a different JOIN so that all teachers are listed.

```sql
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
```

- Use a different JOIN so that all departments are listed.

```sql
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
```

- Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'

```sql
select name, coalesce(mobile, '07986 444 2266')
from teacher
```

- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.

```sql
select teacher.name, COALESCE(dept.name, 'None')
from teacher left join dept on dept.id = teacher.dept
```

- Use COUNT to show the number of teachers and the number of mobile phones.

```sql
select COUNT(id), COUNT(mobile)
from teacher
```

- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

```sql
select name, case when dept = 1 or dept = 2 then 'Sci' else 'Art' end
from teacher
```

- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

```sql
select name, case when dept = 1 or dept = 2 then 'Sci' when dept = 3 then 'Art' else 'None' end
from teacher
```

## Scottish Parliament（苏格兰议会）

[链接](https://napier.sqlzoo.net/wiki/Scottish_Parliament)

- One MSP was kicked out of the Labour party and has no party. Find him.

```sql
select name
from msp
where party is null
```

- Obtain a list of all parties and leaders.

```sql
select name, leader
from party
```

- Give the party and the leader for the parties which have leaders.

```sql
select name, leader
from party
where leader is not null
```

- Obtain a list of all parties which have at least one MSP.

```sql
select distinct party.name
from party join msp on msp.party = party.code
where msp.name is not null
```

- Obtain a list of all MSPs by name, give the name of the MSP and the name of the party where available. Be sure that Canavan MSP, Dennis is in the list. Use ORDER BY msp.name to sort your output by MSP.

```sql
select msp.name, party.name
from msp left join party on msp.party = party.code
order by msp.name
```

- Obtain a list of parties which have MSPs, include the number of MSPs.

```sql
select party.name, count(msp.name) as mspname
from party left join msp on party.code = msp.party
group by party.name
having mspname > 0
```

- A list of parties with the number of MSPs; include parties with no MSPs.

```sql
select party.name, count(msp.name)
from party left join msp on party.code = msp.party
group by party.name
```
