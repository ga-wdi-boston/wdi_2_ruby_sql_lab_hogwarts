\c hogwarts

-- Admit a student
INSERT INTO students (gender, name, birth_date, alumni_status) VALUES
  ('Male', 'Tommy', '2003-07-13'::date, '0'::boolean);

UPDATE students
  SET year = 1, admission_date = CURRENT_DATE, house_id = (SELECT id FROM houses WHERE name = 'Gryffindor')
  WHERE id = (SELECT id FROM students WHERE name = 'Tommy');

-- Adjust house points
UPDATE houses
  SET points = points + 100
  WHERE id = (SELECT house_id FROM students WHERE name = 'Tommy');

-- Spell Workshop
-- BEGIN TRANSACTION
--   FOR id IN (SELECT students.id FROM students WHERE students.year >= (SELECT spells.level FROM spells WHERE spells.id = 1)) LOOP
--     INSERT INTO known_spells (spells_id, students_id, proficiency) VALUES (1, students.id, 0)
--   END LOOP;


--   UPDATE known_spells
--     IF known_spells.spells_id = 1 THEN
--       IF known_spells.proficiency < 0.9 THEN
--         SET proficiency = proficiency + 0.1;
--       ELSE
--         SET proficiency = 1.0;
--       END IF;
--     END IF;
-- END;
