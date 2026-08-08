# Type of Triangle (Advanced Select)

## Problem Description
Write a query identifying the type of each record in the **TRIANGLES** table using its three side lengths (A, B, C).

## Logic & Edge Cases
1. **Triangle Inequality Theorem**: Before checking the types, we must filter out invalid triangles. A triplet cannot form a triangle if the sum of any two sides is less than or equal to the third side (`A + B <= C`).
2. **Order of Evaluation**: The `CASE WHEN` statement evaluates sequentially. We must place the `Not A Triangle` condition first to avoid false positives (e.g., sides like `20, 20, 50` triggering `Isosceles`).

## Solution
```sql
SELECT 
    CASE
        WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle'
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR C = A THEN 'Isosceles'
        ELSE 'Scalene' 
    END AS triangle
FROM triangles;