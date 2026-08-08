--Problem Link: https://www.hackerrank.com/challenges/weather-observation-station-9/problem
SELECT distinct city
FROM station
where  city not LIKE '[aeiou]%'