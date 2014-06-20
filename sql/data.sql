\c hogwarts

INSERT INTO houses (name, animal, points) VALUES
  ('Gryffindor', 'Lion', 3000),
  ('Hufflepuff', 'Badger', 2000),
  ('Ravenclaw', 'Eagle', 1200),
  ('Slytherin', 'Snake', 600);

WITH ins (name, gender, year, birth_date, admission_date, alumni_status, house) AS
(VALUES
  ('Harry Potter', 'Male', 7, '1980-07-31', '1991-09-01', 0, 'Gryffindor'),
  ('Ron Weasley', 'Male', 7, '1980-03-01', '1991-09-01', 0, 'Gryffindor'),
  ('Hermione Granger', 'Female', 7, '1979-09-19', '1991-09-01', 0, 'Gryffindor'),
  ('Cedric Diggory', 'Male', 9, '1978-03-31', '1989-09-01', 1, 'Hufflepuff'),
  ('Hannah Abbott', 'Female', 7, '1980-02-10', '1991-09-01', 0, 'Hufflepuff'),
  ('Cho Chang', 'Female', 8, '1979-01-21', '1990-09-01', 1, 'Ravenclaw'),
  ('Padma Patil', 'Female', 7, '1980-01-01', '1991-09-01', 0, 'Ravenclaw'),
  ('Draco Malfoy', 'Male', 7, '1980-01-22', '1991-09-01', 0, 'Slytherin'),
  ('Bellatrix Lestrange', 'Female', 27, '1960-01-22', '1971-09-01', 1, 'Slytherin')
)
INSERT INTO students
  (name, gender, year, birth_date, admission_date, alumni_status, house_id)
SELECT
  ins.name, ins.gender, ins.year, ins.birth_date::date, ins.admission_date::date, ins.alumni_status::bit, houses.id
FROM
  ins JOIN houses
    ON ins.house = houses.name;

INSERT INTO spells (name, incantation, category, level) VALUES
  ('Summoning Charm', 'Accio', 'charms', 3),
  ('Killing Curse', 'Avada Kedavra', 'dark arts', 27),
  ('Confundus Charm', 'Confundo', 'defense', 5),
  ('Imperius Curse', 'Imperio', 'dark arts', 7),
  ('Light Charm', 'Lumos', 'charms', 2);

WITH tmp (student_name, spells_name, proficiency) AS
(VALUES
  ('Harry Potter', 'Summoning Charm', 0.8),
  ('Harry Potter', 'Confundus Charm', 0.9),
  ('Harry Potter', 'Light Charm', 0.95),
  ('Ron Weasley', 'Summoning Charm', 0.7),
  ('Ron Weasley', 'Confundus Charm', 0.8),
  ('Ron Weasley', 'Light Charm', 0.85),
  ('Hermione Granger', 'Summoning Charm', 1.0),
  ('Hermione Granger', 'Confundus Charm', 1.0),
  ('Hermione Granger', 'Light Charm', 1.0),
  ('Cedric Diggory', 'Summoning Charm', 0.5),
  ('Hannah Abbott', 'Summoning Charm', 0.9),
  ('Hannah Abbott', 'Light Charm', 0.7),
  ('Cho Chang', 'Summoning Charm', 0.9),
  ('Cho Chang', 'Light Charm', 0.9),
  ('Padma Patil', 'Summoning Charm', 0.8),
  ('Draco Malfoy', 'Summoning Charm', 0.7),
  ('Draco Malfoy', 'Imperius Curse', 0.8),
  ('Bellatrix Lestrange', 'Summoning Charm', 0.8),
  ('Bellatrix Lestrange', 'Imperius Curse', 0.8),
  ('Bellatrix Lestrange', 'Killing Curse', 1.0)
)
INSERT INTO known_spells
  (students_id, spells_id, proficiency)
SELECT
  students.id, spells.id, tmp.proficiency
FROM
  tmp JOIN students ON students.name = tmp.student_name
  JOIN spells ON spells.name = tmp.spells_name;
