## 🕒 Users By Average Session Time

### Description
Calculate each user's average session time, where a session is defined as the time difference between a `page_load` and a `page_exit` event. Each user is assumed to have only one session per day. If there are multiple `page_load` or `page_exit` events on the same day, only the **latest** `page_load` and the **earliest** `page_exit` are considered. Sessions are only valid when the `page_load` occurs before the `page_exit` on the same day.

**Source:** StrataScratch – Users By Average Session Time (ID 10352, PostgreSQL, Medium)

### Table Schema

**facebook_web_log**

| Column      | Type      | Description                                  |
|-------------|-----------|-----------------------------------------------|
| user_id     | integer   | Unique identifier of the user                 |
| action      | varchar   | Event type (`page_load`, `page_exit`, etc.)   |
| timestamp   | timestamp | Date and time the event occurred              |

### Goal
Output the `user_id` and their `avg_session_duration`, where the session duration is measured as the difference between the earliest `page_exit` and the latest `page_load` on a given day, averaged across all valid session-days for that user.

### Approach
1. **Isolate loads and exits per day** — using two CTEs (`loads` and `exits`), filter the log by `action` and group by `user_id` + `DATE(timestamp)` to get the latest `page_load` (`MAX`) and the earliest `page_exit` (`MIN`) per user per day.
2. **Join on user and day** — combine `loads` and `exits` on `user_id` and `day`, which naturally discards any day missing either event (no match = no row).
3. **Filter valid sessions** — keep only rows where `load_time < exit_time`, since a session is only valid if the load happened before the exit.
4. **Compute session duration** — use `EXTRACT(EPOCH FROM (exit_time - load_time))` to convert the interval into a numeric value (seconds).
5. **Average per user** — group the resulting per-day session durations by `user_id` and take the `AVG()`.

**Mistakes made along the way (and why they mattered):**
- Used `SUM()` on a `timestamp` column — timestamps aren't summable; needed `MAX`/`MIN` instead.
- Referenced a `SELECT`-level alias inside another expression in the *same* `SELECT` — PostgreSQL evaluates aliases only after that level completes, so this errors out. Fix: move the dependent expression to the next query level up.
- Used `HAVING` without a `GROUP BY` in the outer query — `HAVING` only makes sense after grouping; without it, `WHERE` is the correct clause.
- Mixed `*` with `GROUP BY` in the final aggregation step — every selected column must either be in the `GROUP BY` or wrapped in an aggregate function.
- Divided by 60 to convert to minutes, but the expected output was in **seconds**, not minutes — always verify units against the expected output sample.

### SQL
```sql
WITH loads AS (
  SELECT
    user_id,
    DATE(timestamp) AS day,
    MAX(timestamp) AS load_time
  FROM facebook_web_log
  WHERE action = 'page_load'
  GROUP BY user_id, DATE(timestamp)
),
exits AS (
  SELECT
    user_id,
    DATE(timestamp) AS day,
    MIN(timestamp) AS exit_time
  FROM facebook_web_log
  WHERE action = 'page_exit'
  GROUP BY user_id, DATE(timestamp)
),
sessions AS (
  SELECT
    l.user_id,
    l.load_time,
    e.exit_time,
    EXTRACT(EPOCH FROM (e.exit_time - l.load_time)) AS session_duration
  FROM loads l
  JOIN exits e
    ON l.user_id = e.user_id AND l.day = e.day
  WHERE l.load_time < e.exit_time
)
SELECT
  user_id,
  AVG(session_duration) AS avg_session_duration
FROM sessions
GROUP BY user_id;
```

### Key Takeaway
When a problem needs "the first/last event of type X, matched against the first/last event of type Y, on the same grouping key" — two separate filtered aggregates (CTEs or subqueries) joined on the shared key is usually cleaner and more readable than cramming both conditions into a single `CASE WHEN` aggregate on one table scan. Also: always double-check the **unit** of a computed value (seconds vs. minutes) against the expected output before assuming a "wrong" answer is a logic error.