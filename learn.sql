SELECT population FROM world
  WHERE name = 'Germany'
;

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')
;

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
;

SELECT name FROM world
WHERE population >= 200000000

SELECT name, gdp/population FROM World
WHERE population >= 200000000

SELECT name, population/1000000 FROM World
WHERE continent = 'South America'

SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')

SELECT name FROM world
WHERE name LIKE '%United%'

SELECT name, population, area FROM world
WHERE population > 250000000 OR area > 3000000

SELECT name, population, area FROM world
WHERE (population > 250000000 OR area > 3000000) AND NOT (population > 250000000 AND area > 3000000)


SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2) FROM world
WHERE continent = 'South America'

SELECT name, ROUND(GDP/population, -3) FROM world
WHERE gdp >= 1000000000000

SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

SELECT name, capital
FROM world
WHERE  LEFT(name, 1) =  LEFT(capital, 1) AND name <> capital  

SELECT name
FROM world
WHERE name LIKE '%o%' AND name LIKE '%a%' AND name LIKE '%i%' AND name LIKE '%u%' AND name LIKE '%e%'
AND name NOT LIKE '% %'

SELECT name FROM world
WHERE name LIKE 'Y%'

SELECT name FROM world
WHERE name LIKE '%y'

SELECT name FROM world
WHERE name LIKE '%x%'

SELECT name FROM world
WHERE name LIKE '%land'

SELECT name FROM world
WHERE name LIKE 'C%ia'

SELECT name FROM world
WHERE name LIKE '%oo%'

SELECT name FROM world
WHERE name LIKE '%a%a%a%'

SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name

SELECT name FROM world
WHERE name LIKE '%o__o%'

SELECT name FROM world
WHERE name LIKE '____'


SELECT name
FROM world
WHERE name LIKE capital

SELECT name
FROM world
WHERE capital LIKE '%City'

SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%')

SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%') AND capital <> name

SELECT name, REPLACE(capital, name, '') AS 'ext'
FROM world
WHERE capital LIKE concat('%', name, '%') AND capital <> name



SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature'

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

SELECT winner
FROM nobel
WHERE subject = 'peace' AND yr >=2000

SELECT *
FROM nobel
WHERE subject = 'literature' AND yr BETWEEN 1980 AND 1989

SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

SELECT winner FROM nobel
WHERE winner LIKE 'John%'

SELECT * FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984

SELECT * FROM nobel
WHERE subject NOT IN ('Chemistry', 'Medicine') AND yr = 1980

SELECT * FROM nobel
WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr > 2003

SELECT * FROM nobel
WHERE winner = 'Peter Grünberg'

SELECT * FROM nobel
WHERE winner = 'Eugene O''Neill'

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY 'yr' DESC, 'name' ASC

SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('physics','chemistry'), subject, winner


SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

SELECT name FROM world
WHERE gdp/population >
(SELECT gdp/population FROM world
WHERE name = 'United Kingdom') AND continent = 'Europe'

SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world
      WHERE name = 'Argentina' OR name = 'Australia')
ORDER BY name

SELECT name, population FROM world
  WHERE population > (SELECT population FROM world
      WHERE name = 'United Kingdom') AND population < (SELECT population FROM world
      WHERE name = 'Germany')


SELECT name, CONCAT(ROUND(population*100/(SELECT population FROM world WHERE name = 'Germany')), '%') FROM world 
WHERE continent = 'Europe'


SELECT name FROM world
 WHERE gdp > ALL(SELECT gdp FROM world
WHERE continent = 'Europe' AND gdp > 0)


SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent)


SELECT name, continent, population FROM world x
  WHERE 25000000>=ALL (SELECT population FROM world y WHERE x.continent=y.continent)



SELECT name, continent FROM world x
  WHERE population/3 >= ALL (SELECT population FROM world y WHERE x.continent=y.continent AND x.name != y.name)


  
-- SUM and COUNT

SELECT SUM(population)
FROM world

select distinct continent from world

select sum(gdp) from world where continent = 'Africa'


SELECT COUNT(name) FROM world WHERE area >= 1000000

SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')


SELECT continent, COUNT(name) FROM world
GROUP BY continent

SELECT continent, COUNT(name) FROM world WHERE population >= 10000000
GROUP BY continent

SELECT continent FROM world 
GROUP BY continent
HAVING SUM(population) >= 100000000


-- JOINS

SELECT title, artist
FROM album JOIN track
  ON (album.asin=track.album)
WHERE song = 'Alison'


SELECT artist FROM album JOIN track ON (album.asin=track.album) WHERE song = 'Exodus'

SELECT track.song FROM album JOIN track ON (track.album=album.asin) WHERE album.title = 'Blur'

SELECT album.title, COUNT(track.song)
FROM album JOIN track ON (album.asin=track.album)
GROUP BY album.title


SELECT album.title, COUNT(track.song) 
FROM album JOIN track ON (album.asin=track.album)
WHERE track.song LIKE '%Heart%'
GROUP BY album.title


SELECT track.song
FROM album JOIN track ON (album.asin=track.album)
WHERE track.song LIKE album.title


SELECT album.title
FROM album
WHERE album.title LIKE album.artist


SELECT album.title, album.price, COUNT(track.song)
FROM album JOIN track ON album.asin = track.album
GROUP BY album.title, album.price -- why add price here?
HAVING (album.price/COUNT(track.song)) < 0.5



SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER'


SELECT id,stadium,team1,team2
FROM game
WHERE id = '1012'


SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER' 



SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'


SELECT player, teamid, coach, gtime
FROM goal JOIN eteam on teamid=id
WHERE gtime<=10


SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'


SELECT goal.player
  FROM game JOIN goal ON (matchid=id)
WHERE stadium = 'National Stadium, Warsaw'


SELECT DISTINCT player
FROM game JOIN goal ON matchid = id
WHERE (team1='GER' AND team2='GRE' AND teamid!='GER') -- didn't work


SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname


