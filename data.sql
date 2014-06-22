\c hogwarts

INSERT INTO houses (name, animal, points) VALUES
  ('Gryffindor', 'Lion', 0),
  ('Hufflepuff', 'Badger', 0),
  ('Ravenclaw', 'Eagle', 0),
  ('Slytherin', 'Snake', 0);

INSERT INTO spells (name, incantation, category, level) VALUES
  ('Houdini ', 'HOUDINI!', 'Charms', 'First Year'),
  ('Big Head Curse', 'Biggus Headus', 'Transfiguration', 'First Year'),
  ('Cageify Curse', 'Nicolas Cagus', 'Transfiguration', 'Fourth Year'),
  ('Calming Charm', 'Slowus Rollus', 'Charms', 'Second Year'),
  ('The Killing Curse', 'Avada Kevadra', 'Dark Arts', 'Seventh Year'),
  ('Summoning Charm', 'Accio', 'Charms', 'First Year'),
  ('Sarcastify', 'Sarco Barko', 'Charms', 'Fifth Year'),
  ('Memory Charm', 'Obliviate', 'Charms', 'Second Year'),
  ('Body-Bind Curse', 'Petrificus Totalus', 'Dark Arts', 'Sixth Year'),
  ('Slug Vomiting Charm', 'Slugus Barfus', 'Charms', 'Third Year');

WITH temp (name, gender, year, birth_date, admission_date, alumni_status, house) AS
(VALUES
  ('Harry Potter', 'male', 'Second Year', '1980-07-31', current_timestamp, FALSE, 'Gryffindor'),
  ('Hermione Granger', 'female', 'Second Year', '1979-09-19', current_timestamp, FALSE, 'Gryffindor'),
  ('Ron Weasley', 'male', 'Second Year', '1980-03-01', current_timestamp, FALSE, 'Gryffindor'),
  ('Fred Weasley', 'male', 'Third Year', '1978-04-01', current_timestamp, FALSE, 'Gryffindor'),
  ('George Weasley', 'male', 'Third Year', '1978-04-01', current_timestamp, FALSE, 'Gryffindor'),
  ('Ginny Weasley', 'female', 'First Year', '1981-08-11', current_timestamp, FALSE, 'Gryffindor'),
  ('Draco Malfoy', 'male', 'Second Year', '1980-06-05', current_timestamp, FALSE, 'Slytherin'),
  ('Luna Lovegood', 'female', 'First Year', '1981-05-02', current_timestamp, FALSE, 'Ravenclaw'),
  ('Cedric Diggory', 'male', 'Fourth Year', '1977-10-31', current_timestamp, FALSE, 'Hufflepuff'),
  ('Vincent Crabbe', 'male', 'Second Year', '1980-01-01', current_timestamp, FALSE, 'Slytherin')
)
INSERT INTO students
  (name, gender, year, birth_date, admission_date, alumni_status, house_id)
SELECT
  temp.name, temp.gender, temp.year, temp.birth_date, temp.admission_date, temp.alumni_status, houses.id
FROM
  houses JOIN temp
    ON temp.house = houses.name;





