\c hogwarts
-- All current stodents, alphabetically
SELECT s.name
  FROM students s
  WHERE s.alumn = '0'
  ORDER BY s.name;

-- For a given student, all categories they know spells in
SELECT DISTINCT sp.category
  FROM spells sp
  INNER JOIN known_spells ks
    on ks.spell_id = sp.id AND ks.student_id = 7;

-- For a given student, average proficiency of all spells they know
