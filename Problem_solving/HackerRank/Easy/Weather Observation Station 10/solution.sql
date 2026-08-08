-- Problem Link:https://www.hackerrank.com/challenges/weather-observation-station-10
SELECT distinct city
FROM station
WHERE  city NOT like '%[aeiou]'
