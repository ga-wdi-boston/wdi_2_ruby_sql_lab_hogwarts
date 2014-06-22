\c hogwarts
-- All current stodents, alphabetically
SELECT s.name
  FROM students s
  WHERE s.alumn = '0'
  ORDER BY s.name;

-- For a given student, all categories they know spells in
-- hard-coded id 7
SELECT DISTINCT sp.category
  FROM spells sp
  INNER JOIN known_spells ks
    on ks.spell_id = sp.id AND ks.student_id = 7;

-- For a given student, average proficiency of all spells they know
-- hard-coded id 7
SELECT sum(ks.proficiency) / COUNT(ks.*) AS average_proficiency
  FROM known_spells ks
  WHERE ks.student_id = 7;

-- Fir a givin student, all spells at their level or lower that they don't know
-- hard-coded id 7
SELECT sp.name
  FROM spells sp
  WHERE sp.id NOT IN (
    SELECT sp.id
    FROM spells sp
    INNER JOIN students s
      on s.id = 7 AND s.class_year >= sp.level
    INNER JOIN known_spells ks
      on ks.student_id = s.id AND ks.spell_id = sp.id
  );

-- For a given spell, all students who are at the
--spells level or higher but don't know it
-- hard-coded id 3
--works, but returns students AT OR BELOW that spells level...
-- i.e. bob and kevin, jake
SELECT s.name
  FROM students s
  WHERE s.id NOT IN (
    SELECT s.id
    FROM students s
    LEFT JOIN spells sp
      on sp.id = 3 AND sp.level <= s.class_year
    INNER JOIN known_spells ks
      on ks.student_id = s.id AND ks.spell_id = sp.id
    ) ;

--hard code fix with spell level, which does work
--AND s.id NOT IN (
 --       SELECT s.id
 --       FROM students s
 --       WHERE s.class_year <= 5 )


-- Roster, sort by house, within by year, within alphabetically
  SELECT h.name AS house_name, s.name, s.class_year
    FROM students s
    INNER JOIN houses h
      on s.house_id = h.id
    ORDER BY h.name, s.class_year, s.name;

-- houses best spell category by highest total proficiency
SELECT h.name, sp.category, SUM(ks.proficiency) AS total_proficiency
  FROM houses h
  INNER JOIN students s on s.house_id = h.id
  INNER JOIN known_spells ks on ks.student_id = s.id
  INNER JOIN spells sp on sp.id = ks.spell_id
  GROUP BY h.name, sp.category
  ORDER BY h.name, total_proficiency DESC;
