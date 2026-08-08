-- Problem Link:https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
from wands as w
INNER join wands_Property as wp
    ON w.code = wp.code
WHERE wp.is_evil = 0
  AND w.coins_needed = (
      SELECT min(w2.coins_needed)
      from wands as w2
      INNER join wands_Property as wp2
          ON w2.code = wp2.code
      WHERE w2.power = w.power   
        AND wp2.age = wp.age     
  )
ORDER BY 
    w.power DESC,
    wp.age DESC; 