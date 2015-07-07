\c hogwarts

INSERT INTO houses (id, name, animal, points) VALUES
  (1, 'Gryffindor', 'Griffin', 300),
  (2, 'Slytherin', 'Snake', 100),
  (3, 'Hufflepuff', 'Jigglypuff', 200),
  (4, 'Ravenclaw', 'Raven', 250);

INSERT INTO students(id, name, gender, class_year, bday, admission, alumn, house_id) VALUES
  (1, 'Bob', 'male', 1, '1992-10-01', '2003-09-01', '0', 1),
  (2, 'Kevin', 'male', 2, '1991-01-01', '2002-09-01', '0', 2),
  (3, 'Chad', 'male', 3, '1990-08-03', '2001-09-01', '0', 3),
  (4, 'Stacey', 'female', 4, '1989-10-04', '2000-09-01', '0', 4),
  (5, 'Bethanie', 'female', 5, '1988-07-01', '1999-09-01', '0', 1),
  (6, 'Maya', 'female', 6, '1987-02-01', '1998-09-01', '0', 2),
  (7, 'Cho', 'female', 7, '1986-10-01', '1997-09-01', '0', 3),
  (8, 'Larry', 'male', 8, '1985-11-11', '1996-09-01', '1', 4),
  (9, 'Jake', 'male', 3, '1992-08-06', '2001-09-01', '0', 3);

INSERT INTO spells(id, name, incantation, category, level) VALUES
  (1, 'Burger maker', 'appearus burgerus', 'food', 1),
  (2, 'Dessert maker', 'churnus icecremata', 'food', 3),
  (3, 'Sleep spell', 'snoozariday', 'charm', 5),
  (4, 'Rustle Jimmies', 'jimminus rustladem', 'pester', 5),
  (5, 'Attract', 'walkis this wayis', 'charm', 6),
  (6, 'Bother', 'annoyus alotus', 'pester', 7);

INSERT INTO known_spells(student_id, spell_id, proficiency) VALUES
  (1, 1, 30),
  (2, 1, 60),
  (3, 1, 80),
  (3, 2, 30),
  (4, 2, 80),
  (4, 1, 90),
  (5, 4, 30),
  (5, 3, 40),
  (5, 2, 90),
  (5, 1, 100),
  (6, 5, 30),
  (6, 4, 50),
  (6, 2, 90),
  (6, 1, 100),
  (7, 6, 20),
  (7, 5, 50),
  (7, 4, 40),
  (7, 2, 60);
