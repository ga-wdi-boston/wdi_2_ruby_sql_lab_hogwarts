-- WDI SQL/Ruby Lab
-- Blair Caple
-- June 20, 2014

--
-- Get all current students (i.e. not alumni) sorted alphabetically.
--
SELECT s.name FROM students s WHERE s.alumni_status = false ORDER BY s.name;

--
-- For a given student, find all spell categories they know spells in.
--
SELECT st.name, sp.category
  FROM students st
  JOIN known_spells ks ON ks.student_id = st.id
  JOIN spells sp ON ks.spell_id = sp.id
  WHERE st.name = 'Harry Potter'
  GROUP BY st.name, sp.category
  ORDER BY st.name, sp.category;

--
-- For a given student, get their average proficiency level across all spells
-- they know.
--
SELECT st.name, ROUND(avg(ks.proficiency), 2) AS avg_proficiency
FROM students st
JOIN known_spells ks ON ks.student_id = st.id
WHERE st.name = 'Harry Potter'
GROUP BY st.name
ORDER BY st.name;

--
-- For a given student, find all spells at their level or lower that they
-- don't know.
-- Note: This won't return any spells since we are by definition teaching
-- every student spells appropriate to their level. What may be a more
-- informative query is to return all spells at which they suck, defined
-- by a proficiency of 30 or less.
--
SELECT st.name, sp.name AS spell, ks.proficiency
  FROM students st
  JOIN known_spells ks ON ks.student_id = st.id AND ks.proficiency <= 30
  JOIN spells sp ON sp.id = ks.spell_id
  WHERE st.name = 'Harry Potter'
  ORDER BY st.name;

--
-- For a given spell, find all students who are at the spell's level or higher,
-- but don't know it.
-- Again, since all students are taught all spells for their level, return the
-- name of the student who sucks at the given spell.
--
SELECT sp.name AS spell, st.name, ks.proficiency
  FROM spells sp
  JOIN known_spells ks ON ks.spell_id = sp.id AND ks.proficiency <= 30
  JOIN students st ON ks.student_id = st.id
  WHERE sp.name = 'Levitation'
  ORDER BY st.name;

--
-- Get a roster of all current students: Sort the students by house, by year
-- within houses, and alphabetically within years. The name of the house
-- should be included in the results.
--
SELECT h.name AS house, st.year, st.name
  FROM students st
  JOIN houses h ON h.id = st.house_id
  WHERE st.alumni_status = false
  ORDER BY h.name, st.year, st.name;

--
-- For a given spell category, houses have a "total proficiency", which is the
-- sum of the proficiency scores of all students in the house for all spells
-- in that category. Find out which spell category each house is most
-- proficient in, using this metric.
-- Note: There are significantly more charms than spells or curses in this
-- data set, and curses are not formally taught in any year, so by definition
-- each house will have their highest total proficiency score in the charms
-- category. Al alternative query would be to compute the weighted average
-- proficiency, which is included below.
--
SELECT h.name, sp.category, SUM(ks.proficiency) AS total_proficiency
  FROM houses h
  JOIN students st ON st.house_id = h.id
  JOIN known_spells ks ON ks.student_id = st.id
  JOIN spells sp ON sp.id = ks.spell_id
  GROUP BY h.name, sp.category
  ORDER BY h.name, total_proficiency DESC;

SELECT h.name, sp.category,
    ROUND(AVG(ks.proficiency)) AS weighted_avg_proficiency
  FROM houses h
  JOIN students st ON st.house_id = h.id
  LEFT JOIN known_spells ks ON ks.student_id = st.id
  JOIN spells sp ON sp.id = ks.spell_id
  GROUP BY h.name, sp.category
  ORDER BY h.name, weighted_avg_proficiency DESC;
