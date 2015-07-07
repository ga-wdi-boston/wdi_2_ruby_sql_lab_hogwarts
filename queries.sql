\c hogwarts

-- select all non-alumni students in alpha order

SELECT * FROM students WHERE alumni_status IS FALSE ORDER BY name;

SELECT students.name, spells.category
  FROM students
    INNER JOIN known_spells
      ON students.id = known_spells.student_id
    INNER JOIN spells
      ON known_spells.spell_id = spells.id

  WHERE students.name = 'Harry Potter'
  GROUP BY spells.category, students.name;

