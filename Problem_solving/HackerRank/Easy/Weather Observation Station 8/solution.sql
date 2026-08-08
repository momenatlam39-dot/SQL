--Problem Link: https://www.hackerrank.com/challenges/weather-observation-station-8/problem
SELECT distinct city
FROM station 
WHERE city LIKE '[aeiou]%' AND city LIKE'%[aeiou]'