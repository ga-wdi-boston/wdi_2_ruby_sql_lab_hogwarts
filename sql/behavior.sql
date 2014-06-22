\c hogwarts

# Admit a student
INSERT INTO students (gender, name, birth_date, alumni_status) VALUES
  ('Male', 'Tommy', '2003-07-13'::date, '0'::boolean);

UPDATE students
  SET year = 1, admission_date = CURRENT_DATE, house_id = (SELECT id FROM houses WHERE name = 'Gryffindor')
  WHERE id = (SELECT id FROM students WHERE name = 'Tommy');
