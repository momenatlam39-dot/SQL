# Ollivander's Inventory 

## Problem Description
Harry Potter and his friends are at Ollivander's replacing Ron's broken wand. The goal is to assist Hermione in finding the **minimum number of gold galleons** needed to buy each **non-evil wand** of high **power** and **age**.

The result should be sorted in descending order of `power`. If more than one wand has the same power, it should be sorted in descending order of `age`.

---

## Technical Approach & Concept

### The Challenge
A naive `GROUP BY` on `power` and `age` fails here. Why? Because the query requires us to output the unique `id` of each wand. Including `id` in a standard `GROUP BY` breaks the aggregation granularity, as every single row becomes unique, failing to filter out the more expensive wands.

### The Solution (Correlated Subquery)
To bypass this limitation, I implemented a **Correlated Subquery** approach:
1. **Base Join:** Performed an `INNER JOIN` between `Wands` and `Wands_Property` using the `code` column to map each wand to its respective age and alignment.
2. **Scout Mechanism:** Inside the `WHERE` clause, a subquery scans the dataset for each row evaluated by the outer query. It dynamically calculates the `MIN(coins_needed)` for wands that strictly match the outer row's current `power` and `age`.
3. **Filtering:** The outer query only retains the row if its price matches this minimum calculated value, effectively filtering out all overpriced duplicates.