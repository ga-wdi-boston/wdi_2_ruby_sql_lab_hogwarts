-- Ruby/SQL Lab
-- Blair Caple
-- June 20, 2014

--
-- Hogwarts database
--
drop database if exists hogwarts;
create database hogwarts;
\c hogwarts

--
-- Schools table
--
create table schools(
  id integer primary key
  , name text not null
);

insert into schools (id, name) values (1, 'Hogwarts');

--
-- Houses table
--
create table houses(
  id integer primary key
  , school_id integer not null references schools(id)
  , name text not null
  , animal text not null
  , points integer default 0
);

insert into houses (id, school_id, name, animal)
values (1, 1, 'Gryffindor', 'Lion')
  , (2, 1, 'Slytherin', 'Snake')
  , (3, 1, 'Ravenclaw', 'Eagle')
  , (4, 1, 'Hufflepuff', 'Badger');

--
-- Students table
--
create table students(
  id integer primary key
  , school_id integer not null references schools(id)
  , house_id integer references houses(id)
  , name text not null
  , gender text
  , year text
  , birth_date date
  , admission_date integer
  , alumni_status boolean default false
);

insert into students (id, school_id, house_id, name, gender, birth_date, admission_date)
  values (1, 1, 1, 'Harry Potter', 'M', '07-31-1980', '1991')
  , (2, 1, 1, 'Ron Weasley', 'M', '03-01-1980', '1991')
  , (3, 1, 1, 'Hermione Granger', 'F', '09-19-1979', '1991')
  , (4, 1, 1, 'Ginny Weasley', 'F', '08-11-1981', '1992')
  , (5, 1, 2, 'Draco Malfoy', 'M', '06-05-1980', '1991')
  , (6, 1, 2, 'Vincent Crabbe', 'M', NULL, '1991')
  , (7, 1, 2, 'Gregory Goyle', 'M', NULL, '1991')
  , (8, 1, 2, 'Pansy Parkinson', 'F', NULL, '1991')
  , (9, 1, 3, 'Luna Lovegood', 'F', NULL, '1992')
  , (10, 1, 3, 'Cho Chang', 'F', NULL, '1990')
  , (11, 1, 3, 'Padma Patil', 'F', NULL, '1991')
  , (12, 1, 3, 'Marcus Belby', 'M', NULL, NULL)
  , (13, 1, 4, 'Cedric Diggory', 'M', NULL, '1988')
  , (14, 1, 4, 'Susan Bones', 'F', NULL, '1991')
  , (15, 1, 4, 'Hannah Abbott', 'F', NULL, '1991')
  , (16, 1, 4, 'Justin Finch-Fletchley', 'M', NULL, '1991');

--
-- Spells table
--
create table spells(
  id integer primary key
  , category text not null
  , name text not null
  , incantation text
  , level integer
);

insert into spells (id, category, name, incantation, level)
  values (1, 'Charm', 'Levitation', 'Wingardium Leviosa', 1)
  , (2, 'Charm', 'Wand-Lighting', 'Lumos', 1)
  , (3, 'Charm', 'Arresto Momentum', 'Arresto Momentum', 2)
  , (4, 'Charm', 'Memory', 'Obliviate', 2)
  , (5, 'Charm', 'Freezing', 'Glacius', 3)
  , (6, 'Charm', 'Disarming', 'Expelliarmus', 4)
  , (7, 'Charm', 'Summoning', 'Accio', 4)
  , (8, 'Charm', 'Mending', 'Reparo', 4)
  , (9, 'Spell', 'Stunning', 'Stupefy', 5)
  , (10, 'Spell', 'Fire-Making', 'Incendio', 5)
  , (11, 'Spell', 'Water-Making', 'Aguamenti', 6)
  , (12, 'Spell', 'Non-Verbal', '', 6);


--
-- Schools-Spells table
-- Intersection table between Schools and Spells
--
create table school_spells(
  id integer primary key
  , school_id integer not null references schools(id)
  , spell_id integer not null references spells(id)
);

insert into school_spells(id, school_id, spell_id)
  values (1, 1, 1)
  , (2, 1, 2)
  , (3, 1, 3)
  , (4, 1, 4)
  , (5, 1, 5)
  , (6, 1, 6)
  , (7, 1, 7)
  , (8, 1, 8)
  , (9, 1, 9)
  , (10, 1, 10)
  , (11, 1, 11)
  , (12, 1, 12);

--
-- Known Spells table
-- Intersection table between Students and Spells
-- Note that the id is auto-incremented and not assigned.
--
create table known_spells(
  id serial primary key
  , student_id integer not null
  , spell_id integer not null
  , proficiency integer default 0
  , last_used date default null
);

--
-- Add all spells to all students.
--
DO $$
DECLARE
  spells_csr CURSOR FOR SELECT * FROM spells;
  students_csr CURSOR FOR SELECT * FROM students;
BEGIN
  FOR r_spell IN spells_csr LOOP
    FOR r_student IN students_csr LOOP
      INSERT INTO known_spells (student_id, spell_id)
        VALUES (r_student.id, r_spell.id);
    END LOOP;
  END LOOP;
END$$;
