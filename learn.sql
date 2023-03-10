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