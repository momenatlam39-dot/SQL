-- Problem Link: https://www.hackerrank.com/challenges/weather-observation-station-4/problem
SELECT 
    count(city) - count(distinct city)
from station
