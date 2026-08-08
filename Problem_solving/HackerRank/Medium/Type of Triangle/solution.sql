--Problem Link: https://www.hackerrank.com/challenges/what-type-of-triangle/problem
SELECT 
    case
        when A + B <= C or B+ C <= A or C+ A <= B then 'Not A Triangle'
        when A = B and B= C then 'Equilateral'
        when A = B or B = C or C = A then 'Isosceles'
        else 'Scalene' 
    End as triangle
from triangles

