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

create index on schools(name);

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

create index on houses(name);

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
  , year integer default 1
  , birth_date date
  , admission_date integer
  , alumni_status boolean default false
);

create index on students(name);
create index on students(year);
create index on students(alumni_status);

insert into students (id, school_id, house_id, name, gender, birth_date, admission_date, year, alumni_status)
  values (1, 1, 1, 'Harry Potter', 'M', '07-31-1980', '1991', 7, true)
  , (2, 1, 1, 'Ron Weasley', 'M', '03-01-1980', '1991', 6, false)
  , (3, 1, 1, 'Hermione Granger', 'F', '09-19-1979', '1991', 6, false)
  , (4, 1, 1, 'Ginny Weasley', 'F', '08-11-1981', '1992', 5, false)
  , (5, 1, 2, 'Draco Malfoy', 'M', '06-05-1980', '1991', 6, false)
  , (6, 1, 2, 'Vincent Crabbe', 'M', NULL, '1991', 6, false)
  , (7, 1, 2, 'Gregory Goyle', 'M', NULL, '1991', 6, false)
  , (8, 1, 2, 'Pansy Parkinson', 'F', NULL, '1991', 6, false)
  , (9, 1, 3, 'Luna Lovegood', 'F', NULL, '1992', 5, false)
  , (10, 1, 3, 'Cho Chang', 'F', NULL, '1990', 7, true)
  , (11, 1, 3, 'Padma Patil', 'F', NULL, '1991', 6, false)
  , (12, 1, 3, 'Marcus Belby', 'M', NULL, NULL, 1, false)
  , (13, 1, 4, 'Cedric Diggory', 'M', NULL, '1988', 4, true)
  , (14, 1, 4, 'Susan Bones', 'F', NULL, '1991', 6, false)
  , (15, 1, 4, 'Hannah Abbott', 'F', NULL, '1991', 6, false)
  , (16, 1, 4, 'Justin Finch-Fletchley', 'M', NULL, '1991', 6, false);

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

create index on spells(name);
create index on spells(category);

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
  , (12, 'Spell', 'Non-Verbal', '', 6)
  , (13, 'Curse', 'Cruciatus', 'Crucio', 6)
  , (14, 'Curse', 'Imperius', 'Imperio', 6)
  , (15, 'Curse', 'Avada Kedavra', 'Avada Kedavra', 7);
--
--
-- Schools-Spells table
-- Intersection table between Schools and Spells
--
create table school_spells(
  id integer primary key
  , school_id integer not null references schools(id)
  , spell_id integer not null references spells(id)
);

create index on school_spells(school_id);
create index on school_spells(spell_id);

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

create index on known_spells(proficiency);

--
-- Add all eligible spells to all students.
--
DO $$
DECLARE
  l_proficiency INTEGER default 0;
  spells_csr CURSOR FOR SELECT * FROM spells;
  students_csr CURSOR FOR SELECT * FROM students;
BEGIN
  FOR r_student IN students_csr LOOP
    FOR r_spell IN spells_csr LOOP
      --
      -- Test if student is eligible to learn the spell
      --
      IF r_spell.level <= r_student.year THEN
        --
        -- Set a random proficiency level between 10 and 100.
        -- Assumes only Muggles could get a score of 0.
        --
        l_proficiency = 10 + ROUND(random() * 90);

        INSERT INTO known_spells (student_id, spell_id, proficiency)
          VALUES (r_student.id, r_spell.id, l_proficiency);
      END IF;
    END LOOP;
  END LOOP;
END$$;
