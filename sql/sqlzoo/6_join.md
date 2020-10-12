# The JOIN operation

[链接](https://napier.sqlzoo.net/wiki/The_JOIN_operation)

- The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime

Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

```sql
SELECT matchid, player FROM goal
  WHERE teamid = 'GER'
```

- From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.

Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.

`sShow id, stadium, team1, team2 for just game 1012`

```sql
SELECT id,stadium,team1,team2
  FROM game where id = 1012
```

- You can combine the two steps into a single query with a JOIN.

```sql
SELECT *
  FROM game JOIN goal ON (id=matchid)
```

The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say
`ON (game.id=goal.matchid)`

The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.

`Modify it to show the player, teamid, stadium and mdate for every German goal.`

```sql
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) where teamid = 'GER'
```

- Use the same `JOIN` as in the previous question.

`Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'`

```sql
select team1, team2, player
from game join goal on (id = matchid) where player like 'Mario%'
```

- The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

`Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10`

```sql
SELECT player, teamid, coach, gtime
  FROM goal join eteam on teamid = id
 WHERE gtime<=10
```

- To JOIN game with eteam you could use either
game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)

Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id

`List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.`

```sql
select mdate, teamname
from game join eteam on team1 = eteam.id
where coach = 'Fernando Santos'
```

- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

```sql
select player
from game join goal on id = matchid
where stadium = 'National Stadium, Warsaw'
```

## 较难的问题

- The example query shows all goals scored in the Germany-Greece quarterfinal.

`Instead show the name of all players who scored a goal against Germany.`

```sql
SELECT distinct player
  FROM game JOIN goal ON matchid = id
where teamid != 'GER' and (team1 = 'GER' or team2 = 'GER')
```

- Show teamname and the total number of goals scored.

```sql
SELECT distinct teamname, count(*)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
```

- Show the stadium and the number of goals scored in each stadium.

```sql
select distinct stadium, count(*)
from game join goal on id = matchid
group by stadium
```

- For every match involving 'POL', show the matchid, date and the number of goals scored.

```sql
SELECT matchid, mdate, count(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid, mdate
```

- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

```sql
select matchid, mdate, count(*)
from game join goal on matchid = id
where (team1 = 'GER' or team2 = 'GER') and teamid = 'GER'
group by matchid, mdate
```

- List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.

Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. `Sort your result by mdate, matchid, team1 and team2.`

```sql
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game left JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2
  ORDER BY mdate, matchid, team1, team2
```

## Music Tutorial

[链接](https://napier.sqlzoo.net/wiki/Music_Tutorial)

- Find the title and artist who recorded the song 'Alison'.

```sql
SELECT title, artist
  FROM album JOIN track
         ON (album.asin=track.album)
 WHERE song = 'Alison'

```

- Which artist recorded the song 'Exodus'?

```sql
select artist
from album join track on album.asin = track.album
where song = 'Exodus'
```

- Show the song for each track on the album 'Blur'

```sql
select song
from album join track on album.asin = track.album
where title = 'Blur'
```

- For each album show the title and the total number of track.

```sql
SELECT title, COUNT(*)
  FROM album JOIN track ON (asin=album)
 GROUP BY title
```

- For each album show the title and the total number of tracks containing the word 'Heart' (albums with no such tracks need not be shown).

```sql
select title, count(*)
from album join track on album.asin = track.album
where song like '%Heart%'
group by title
```

- A "title track" is where the song is the same as the title. Find the title tracks.

```sql
select song
from album join track on album.asin = track.album
where song = title
```

- An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur'). Show the eponymous albums.

```sql
select title
from album
where title = artist
```

- Find the songs that appear on more than 2 albums. Include a count of the number of times each shows up.

```sql
select song, count(distinct asin)
from track join album on track.album = album.asin
group by song
having count(distinct asin) > 2
```

- A "good value" album is one where the price per track is less than 50 pence. Find the good value album - show the title, the price and the number of tracks.

```sql
select title, price, count(song)
from album join track on album.asin = track.album
group by title, price
having price/count(song) < 0.5
```

- Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101 tracks.

List albums so that the album with the most tracks is first. Show the title and the number of tracks
Where two or more albums have the same number of tracks you should order alphabetically

```sql
select title, count(asin)
from album join track on album.asin = track.album
group by title
order by count(asin) desc, title
```
