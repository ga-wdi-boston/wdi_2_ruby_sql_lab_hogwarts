\c hogwarts

INSERT INTO students (name, gender, birth_date) VALUES
  ('Neville', 'male', '2004-06-22');

UPDATE students SET
  admission_date = current_date,
  year = 1,
  house_id = 1
  WHERE name = 'Neville';

UPDATE houses SET
  points = points + 20
  WHERE id IN (
    SELECT houses.id
    FROM houses
    INNER JOIN students
    ON students.house_id = houses.id
    WHERE students.name = 'Harry');

BEGIN;
  --I dont know how to add a new known spell if it does not already exist.
  UPDATE known_spells SET
    proficiency = LEAST(proficiency + 10, 100)
    WHERE id IN (
      SELECT known_spells.id
      FROM known_spells
      INNER JOIN students
      ON known_spells.student_id = students.id
      INNER JOIN spells
      on known_spells.spell_id = spells.id
      WHERE spells.name = 'Gouging Spell' AND spells.level <= students.year);

COMMIT;

SELECT temp.name FROM
 (SELECT houses.name, MAX(houses.points) AS max_points
  FROM houses
  GROUP BY houses.name
  ORDER BY max_points DESC
  LIMIT 1
  ) AS temp;
