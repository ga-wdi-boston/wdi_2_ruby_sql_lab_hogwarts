\c hogwarts

-- Get all current students (i.e. not alumni) sorted alphabetically.
SELECT students.name
  FROM students
  WHERE students.alumni_status = 0::boolean
  ORDER BY students.name;

-- For a given student, find all spell categories they know spells in.
SELECT DISTINCT spells.category
  FROM students, spells, known_spells
  WHERE known_spells.students_id = students.id
    AND known_spells.spells_id = spells.id
    AND students.name = 'Harry Potter';


-- For a given student, get their average proficiency level across all spells they know.
SELECT AVG(known_spells.proficiency) AS avg_proficiency
  FROM students, known_spells
  WHERE known_spells.students_id = students.id
    AND students.name = 'Harry Potter';

-- For a given student, find all spells at their level or lower that they don't know.
SELECT spells.name
  FROM spells, students
  WHERE students.year >= spells.level
  AND students.name = 'Padma Patil'
EXCEPT
SELECT spells.name
  FROM students, spells, known_spells
  WHERE known_spells.students_id = students.id
    AND known_spells.spells_id = spells.id
    AND students.name = 'Padma Patil';


-- For a given spell, find all students who are at the spell's level or higher,
-- but don't know it.
SELECT DISTINCT students.name
  FROM students, spells
  WHERE students.year >= spells.level
    AND spells.name = 'Confundus Charm'
EXCEPT
SELECT students.name
  FROM students, spells, known_spells
  WHERE known_spells.students_id = students.id
    AND known_spells.spells_id = spells.id
    AND spells.name = 'Confundus Charm';

-- Get a roster of all current students:
-- SQL: Sort the students by house, by year within houses, and alphabetically
-- within years. The name of the house should be included in the results.
SELECT houses.name, students.year, students.name
  FROM houses, students
  WHERE students.house_id = houses.id
  AND students.alumni_status = 0::boolean
  GROUP BY houses.name, students.year, students.name
  ORDER BY students.year, students.name;

-- For a given spell category, houses have a "total proficiency",
-- which is the sum of the proficiency scores of all students in the house
-- for all spells in that category. Find out which spell category each house
-- is most proficient in, using this metric.
SELECT houses.name, spells.category, SUM(known_spells.proficiency) AS total_proficiency
  FROM houses, students, spells, known_spells
  WHERE students.house_id = houses.id
    AND known_spells.students_id = students.id
    AND known_spells.spells_id = spells.id
  GROUP BY houses.name, spells.category;
