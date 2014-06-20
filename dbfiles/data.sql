\c hogwarts

INSERT INTO houses (animal, name, points) VALUES
  ('Raven', 'Ravenclaw', 100),
  ('Lion', 'Gryffindor', 70),
  ('Badger', 'Hufflepuff', 30),
  ('Serpent', 'Slytherin', 120);

INSERT INTO students (name, gender, year, birth_date, admission_date, alumni_status) VALUES
  ('Harry', 'm', 4, '1994-04-12', '2004-05-31', 'f'),
  ('Hermione', 'f', 4, '1993-09-12', '2004-05-31', 'f'),
  ('Ron', 'm', 5, '1993-06-11', '2003-05-28', 'f'),
  ('Fred', 'm', 9, '1988-08-01', '1999-05-29', 't'),
  ('Dumbledore', 'm', 60, '1942-04-19', '1952-05-30', 't'),
  ('Ginny', 'f', 1, '1997-08-12', '2006-05-28', 'f'),
  ('Tom', 'm', 40, '1962-07-06', '1969-05-04', 't');

INSERT INTO spells (name, incantation, category, level) VALUES
  ('Summoning Charm', 'Accio', 'Charm', 2),
  ('Gouging Spell', 'Defodio', 'Charm', 4),
  ('Severing Charm', 'Diffindo', 'Charm', 2),
  ('Cruciatus Curse', 'Crucio', 'Curse', 11),
  ('Patronus Charm', 'Expecto Patronum', 'Defence', 6),
  ('Disarming Charm', 'Expelliarmus', 'Defence', 5),
  ('Killing Curse', 'Avada Kedavra', 'Curse', 12);

WITH temp(name, incantation, proficiency) AS
  (VALUES
    ('Harry', 'Accio', 12),
    ('Harry', 'Defodio', 14),
    ('Harry', 'Expelliarmus', 23),
    ('Hermione', 'Accio', 50),
    ('Hermione', 'Defodio', 56),
    ('Hermione', 'Expecto Patronum', 45),
    ('Ron', 'Accio', 12),
    ('Fred', 'Expecto Patronum', 40),
    ('Fred', 'Accio', 40),
    ('Dumbledore', 'Defodio', 100),
    ('Dumbledore', 'Crucio', 100),
    ('Dumbledore', 'Expelliarmus', 100),
    ('Dumbledore', 'Expecto Patronum', 100),
    ('Ginny', 'Accio', 1),
    ('Tom', 'Avada Kedavra', 100),
    ('Tom', 'Expelliarmus', 100)
  )
  INSERT INTO known_spells
    (student_id, spell_id, proficiency)
  SELECT
    students.id, spells.id, temp.proficiency
  FROM
    spells JOIN temp
      ON temp.incantation = spells.incantation
      JOIN students
        ON students.name = temp.name;

