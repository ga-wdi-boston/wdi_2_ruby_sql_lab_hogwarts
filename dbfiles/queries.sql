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
