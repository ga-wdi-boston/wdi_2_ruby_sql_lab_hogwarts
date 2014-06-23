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
