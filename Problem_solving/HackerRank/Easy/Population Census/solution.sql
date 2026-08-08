--Problem Link: https://www.hackerrank.com/challenges/asian-population/problem
SELECT sum(city.population)
from city 
INNER JOIN country 
ON city.countrycode = country.code
where country.continent = 'Asia'
