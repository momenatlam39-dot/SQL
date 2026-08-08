Problem Link: https://www.hackerrank.com/challenges/full-score/problem
SELECT s.hacker_id, h.name
FROM submissions as s
INNER JOIN challenges as c
on s.challenge_id = c.challenge_id
INNER JOIN difficulty as d
on c.difficulty_level = d.difficulty_level
INNER JOIN Hackers as h 
on s.hacker_id = h.hacker_id
WHERE s.score = d.score
GROUP BY s.hacker_id, h.name
HAVING count(distinct s.challenge_id) > 1
ORDER BY count(distinct s.challenge_id)desc ,s.hacker_id ASC