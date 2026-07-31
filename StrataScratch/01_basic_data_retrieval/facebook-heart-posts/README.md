# Find Posts with Heart Reactions ❤️

## 📌 Problem
Find all posts that have received at least one "heart" reaction.

You are given two tables:

- `facebook_posts`
- `facebook_reactions`

## 🎯 Goal
Return all columns from the `facebook_posts` table for posts that were reacted to with a "heart".

---

## 🧠 Approach

- Join `facebook_posts` with `facebook_reactions` using `post_id`
- Filter reactions where `reaction = 'heart'`
- Use `DISTINCT` to avoid duplicate posts (since a post can have multiple reactions)

---

## 💻 SQL Solution

```sql
SELECT DISTINCT p.*
FROM facebook_posts p
JOIN facebook_reactions r
  ON p.post_id = r.post_id
WHERE r.reaction = 'heart';