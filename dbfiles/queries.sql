\c hogwarts

SELECT name FROM students WHERE alumni_status = 'f' ORDER BY name;

SELECT DISTINCT spells.category FROM spells
  INNER JOIN known_spells
  ON known_spells.spell_id = spells.id
  INNER JOIN students
  ON known_spells.student_id = students.id
  WHERE students.name = 'Dumbledore';

SELECT AVG(proficiency) FROM known_spells
  INNER JOIN students
  ON known_spells.student_id = students.id
  WHERE students.name = 'Harry';


--This is wrong. I want it to not include killing and cruciatus but it does.
SELECT spells.name FROM spells
  EXCEPT
    (SELECT spells.name FROM spells
      LEFT OUTER JOIN known_spells
      ON known_spells.spell_id = spells.id
      INNER JOIN students
      ON known_spells.student_id = students.id
      WHERE (students.name = 'Harry') OR spells.level > 4);

SELECT students.name FROM students
  EXCEPT
    (SELECT students.name FROM students
      INNER JOIN known_spells
      ON known_spells.student_id = students.id
      INNER JOIN spells
      ON known_spells.spell_id = spells.id
      WHERE students.year < spells.level OR spells.name = 'Patronus Charm');
