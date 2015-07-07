\c hogwarts

INSERT INTO houses (animal, name, points) VALUES
  ('Raven', 'Ravenclaw', 100),
  ('Lion', 'Gryffindor', 70),
  ('Badger', 'Hufflepuff', 30),
  ('Serpent', 'Slytherin', 120);

WITH temp (name, gender, year, birth_date, admission_date, alumni_status, house) AS
  (VALUES
    ('Harry', 'm', 4, to_date('1994-04-12','YYYY-MM-DD'), to_date('2004-05-31','YYYY-MM-DD'), 'f', 'Gryffindor'),
    ('Hermione', 'f', 4, to_date('1993-09-12','YYYY-MM-DD'), to_date('2004-05-31','YYYY-MM-DD'), 'f', 'Ravenclaw'),
    ('Ron', 'm', 5, to_date('1993-06-11','YYYY-MM-DD'), to_date('2003-05-28','YYYY-MM-DD'), 'f', 'Hufflepuff'),
    ('Fred', 'm', 9, to_date('1988-08-01','YYYY-MM-DD'), to_date('1999-05-29','YYYY-MM-DD'), 't', 'Gryffindor'),
    ('Dumbledore', 'm', 60, to_date('1942-04-19','YYYY-MM-DD'), to_date('1952-05-30','YYYY-MM-DD'), 't', 'Gryffindor'),
    ('Ginny', 'f', 1, to_date('1997-08-12','YYYY-MM-DD'), to_date('2006-05-28','YYYY-MM-DD'), 'f', 'Slytherin'),
    ('Tom', 'm', 40, to_date('1962-07-06','YYYY-MM-DD'), to_date('1969-05-04','YYYY-MM-DD'), 't', 'Slytherin')
  )
  INSERT INTO students
    (name, gender, year, birth_date, admission_date, alumni_status, house_id)
  SELECT
   temp.name, temp.gender, temp.year, temp.birth_date, temp.admission_date, temp.alumni_status, houses.id
    FROM houses JOIN temp
      ON houses.name = temp.house;

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

