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