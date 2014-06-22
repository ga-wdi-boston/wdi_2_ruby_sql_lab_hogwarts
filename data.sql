\c school

-- Create sample users

INSERT INTO houses (name,animal,points) VALUES
  ('Gryffindor','lion',0),
  ('Hufflepuff','badger',0),
  ('Ravenclaw','eagle',0),
  ('Slytherin','serpent',0);

-- Create sample categories

INSERT INTO students (name,gender,year,birth_date,admission_date,alum_st,house_id) VALUES
  ('Astrix A.','MALE','FIRST','1998-01-08','2010-01-08',FALSE,1),
  ('Filemina A.','MALE','FIRST','1990-03-18','2010-01-08',FALSE,1),
  ('Roland Abberley','FEMALE','SECOND','1992-04-08','2011-01-08',FALSE,1),
  ('Euan Abercrombie','MALE','SECOND','1998-05-08','2011-01-08',FALSE,1),
  ('Abraxas Malfoy','FEMALE','SECOND','1992-06-08','2011-01-08',FALSE,2),
  ('Zoe Accrington','MALE','THIRD','1992-11-08','2012-01-08',FALSE,2),
  ('Stewart Ackerley','MALE','THIRD','1991-12-08','2012-01-08',FALSE,3),
  ('Adrian','MALE','THIRD','1992-05-02','2012-01-08',FALSE,3),
  ('Jatin Agarkar','MALE','THIRD','1993-09-12','2012-01-08',FALSE,4),
  ('Sakura Akagi','FEMALE','FORTH','1992-01-23','2013-01-08',FALSE,4),
  ('Nick Alas','MALE','FORTH','1992-03-28','2013-01-08',FALSE,1),
  ('Terry Boot','MALE','FORTH','1992-04-08','2013-01-08',TRUE,2);


INSERT INTO spells (incantation,description,category,level) VALUES
  ('Accio','Summons an object','Charm','FIRST'),
  ('Crucio','Tortures opponent Unforgivable','Curse','SECOND'),
  ('Defodio','Dig out materials','Spell','THIRD'),
  ('Engorgio','Enlarges and item','Spell','FORTH')
;

INSERT INTO known_spells (proficiency,student_id,spell_id) VALUES
  (100,1,1),
  (50,2,1),
  (100,3,2),
  (100,4,2),
  (100,5,2),
  (100,6,3),
  (100,7,3),
  (100,8,3),
  (100,9,3),
  (100,10,4),
  (100,11,4),
  (100,12,4),
  (80,12,1);

