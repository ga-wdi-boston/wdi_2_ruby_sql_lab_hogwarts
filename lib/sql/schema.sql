-- Ruby/SQL Lab
-- Blair Caple
-- June 20, 2014

--
-- Hogwarts database
--
DROP DATABASE IF EXISTS hogwarts;
CREATE DATABASE hogwarts;
\c hogwarts

--
-- Schools table
--
CREATE TABLE schools(
  id integer PRIMARY KEY
  , name text NOT NULL
);
CREATE INDEX ON schools(name);

INSERT INTO schools (id, name) VALUES (1, 'Hogwarts');

--
-- Houses table
--
CREATE TABLE houses(
  id integer PRIMARY KEY
  , school_id integer NOT NULL REFERENCES schools(id)
  , name text NOT NULL
  , animal text NOT NULL
  , points integer DEFAULT 0
);
CREATE INDEX ON houses(name);

INSERT INTO houses (id, school_id, name, animal)
VALUES (1, 1, 'Gryffindor', 'Lion')
  , (2, 1, 'Slytherin', 'Snake')
  , (3, 1, 'Ravenclaw', 'Eagle')
  , (4, 1, 'Hufflepuff', 'Badger');

--
-- Students table
--
CREATE TABLE students(
  id integer PRIMARY KEY
  , school_id integer REFERENCES schools(id)
  , house_id integer REFERENCES houses(id)
  , name text NOT NULL
  , gender text
  , year integer DEFAULT 0
  , birth_date date
  , admission_date integer
  , alumni_status boolean DEFAULT false
);
CREATE INDEX ON students(name);
CREATE INDEX ON students(year);
CREATE INDEX ON students(alumni_status);

INSERT INTO students (id, school_id, house_id, name, gender, birth_date, admission_date, year, alumni_status)
  VALUES (1, 1, 1, 'Harry Potter', 'M', '07-31-1980', '1991', 7, true)
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
CREATE TABLE spells(
  id integer PRIMARY KEY
  , category text NOT NULL
  , name text NOT NULL
  , incantation text
  , level integer
);
CREATE INDEX ON spells(name);
CREATE INDEX ON spells(category);

INSERT INTO spells (id, category, name, incantation, level)
  VALUES (1, 'Charm', 'Levitation', 'Wingardium Leviosa', 1)
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
CREATE TABLE school_spells(
  id integer PRIMARY KEY
  , school_id integer NOT NULL REFERENCES schools(id)
  , spell_id integer NOT NULL REFERENCES spells(id)
);
CREATE INDEX ON school_spells(school_id);
CREATE INDEX ON school_spells(spell_id);

INSERT INTO school_spells(id, school_id, spell_id)
  VALUES (1, 1, 1)
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
  , (12, 1, 12)
  , (13, 1, 13)
  , (14, 1, 14)
  , (15, 1, 15);

--
-- Known Spells table
-- Intersection table between Students and Spells
-- Note that the id is auto-incremented and not assigned.
--
CREATE TABLE known_spells(
  id serial PRIMARY KEY
  , student_id integer NOT NULL
  , spell_id integer NOT NULL
  , proficiency integer DEFAULT 0
  , last_used date DEFAULT null
);
CREATE INDEX ON known_spells(student_id);
CREATE INDEX ON known_spells(spell_id);
CREATE INDEX ON known_spells(proficiency);

--
-- Add all eligible spells to all students.
--
DO $$
DECLARE
  l_proficiency integer DEFAULT 0;
  spells_csr CURSOR FOR SELECT * FROM spells;
  students_csr CURSOR FOR SELECT * FROM students;
BEGIN
  FOR r_student IN students_csr LOOP
    FOR r_spell IN spells_csr LOOP
      -- Test if student is eligible to learn the spell
      IF r_spell.level <= r_student.year THEN
        -- Set a random proficiency level between 10 and 100.
        -- Assumes only Muggles could get a score of 0.
        l_proficiency = 10 + ROUND(random() * 90);

        INSERT INTO known_spells (student_id, spell_id, proficiency)
          VALUES (r_student.id, r_spell.id, l_proficiency);
      END IF;
    END LOOP;
  END LOOP;
END$$;

-- ----------------------------------------------------------------------
-- -------------------------<< STEP 5 PROBLEMS >>------------------------
-- ----------------------------------------------------------------------
--
-- Step 5a: Create a new student who is 10 years old, but does not have their
-- year or admission date set. Then write a statement that will admit this
-- student into a house, set their year to 1, and set their admission date
-- to the current date.
--
-- Returns the next sequence number from the syudents table
--
CREATE OR REPLACE FUNCTION next_seq_number() RETURNS integer AS $$
BEGIN
  RETURN (SELECT st.id FROM students st ORDER BY st.id DESC LIMIT 1) + 1;
END;
$$ LANGUAGE plpgsql;
--
-- Admits the student with the given id to the given house
--
CREATE OR REPLACE FUNCTION admit_student(
    IN p_student_id integer,
    IN p_house_id integer,
    IN p_school_id integer
) RETURNS void
AS $$
DECLARE
  l_date integer;
BEGIN
  -- Get the current year
  l_date := date_part('year', NOW())::integer;

  -- Update the student record
  UPDATE students
    SET year = 1
    , admission_date = l_date
    , school_id      = p_school_id
    , house_id       = p_house_id
    WHERE id = p_student_id;
END;
$$ LANGUAGE plpgsql;
--
-- Run the code block
--
DO $$
DECLARE
  l_seq       integer;
  l_school_id integer;
  l_house_id  integer;
BEGIN
  -- Gets the next id number.
  l_seq := next_seq_number();

  -- Populate the local school and house variables.
  SELECT h.id, h.school_id
    FROM houses h
    WHERE h.name = 'Gryffindor'
    INTO l_house_id, l_school_id;

  -- Create a new student.
  INSERT INTO students (id, name, gender, birth_date)
    VALUES (l_seq, 'Tom Riddle', 'M', '1926-12-31');

  -- Admit the student to the school and house.
  PERFORM admit_student(l_seq, l_house_id, l_school_id);
END$$;

--
-- Step 5b: Write a SQL statement that will award or subtract points from a
-- specific student's house. Start from the student, and do not specify
-- the house directly.
--
CREATE OR REPLACE FUNCTION change_points(
    IN p_student_id integer,
    IN p_points     integer
) RETURNS void
AS $$
BEGIN
  UPDATE houses h
  SET h.points = h.points + p_points
  WHERE h.id = (
    SELECT st.house_id
    FROM students st
    WHERE st.id = p_student_id);
END;
$$ LANGUAGE plpgsql;

--
-- Step 5c: Write a set of SQL statements that will perform the "workshop"
-- behavior described above for some arbitrary category. Make sure spells are
-- added to a student's "known spells" if they didn't already know them, spell
-- levels are respected, and proficiency cannot go above 100%. Enclose these
-- queries in a transaction so there is no risk of partial updates.
--
-- Note: A straightforward solution for transaction control is to write a
-- stored procedure as below. Any exception will be rolled back.
--
CREATE OR REPLACE FUNCTION practice_spell(
    IN p_student_id integer
    , IN p_spell_id integer
) RETURNS void AS
$body$
DECLARE
  l_student     students%ROWTYPE;
  l_spell       spells%ROWTYPE;
  l_rec         known_spells%ROWTYPE;
BEGIN
  -- Fetch the known spell or create a new one.
  SELECT * INTO l_rec FROM known_spells WHERE student_id = p_student_id AND spell_id = p_spell_id;
  IF NOT FOUND THEN
    -- Test if the student is eligible to learn the spell.
    SELECT * INTO l_spell FROM spells WHERE id = p_spell_id;
    SELECT * INTO l_student FROM students WHERE id = p_student_id;
    IF l_spell.level > l_student.year THEN
      RAISE EXCEPTION 'underage student for spell';
    END IF;
    -- Create the known spell and assign it to the record variable.
    INSERT INTO known_spells (student_id, spell_id)
      VALUES (p_student_id, p_spell_id);
    SELECT * INTO l_rec
      FROM known_spells
      WHERE student_id = p_student_id AND spell_id = p_spell_id;
  END IF;

  -- Practice the spell
  IF l_rec.proficiency < 100 THEN
    l_rec.proficiency := l_rec.proficiency + 1;
  END IF;
  l_rec.last_used := current_date;

  -- Update the record
  UPDATE known_spells
    SET proficiency = l_rec.proficiency
    , last_used     = l_rec.last_used
    WHERE id = l_rec.id;
END;
$body$ LANGUAGE plpgsql;

--
-- Create more spells
--
INSERT INTO spells (id, category, name, incantation, level)
  VALUES (16, 'Charm', 'Unlocking', 'Alohomora', 1)
  , (17, 'Charm', 'Softening', 'Spongify', 1)
  , (18, 'Spell', 'Transfiguration', 'Avifors', 2)
  , (19, 'Charm', 'Severing', 'Diffindo', 2)
  , (20, 'Charm', 'Lumos Maxima', 'Lumos Maxima', 3)
  , (21, 'Charm', 'Seize and Pull', 'Carpe Retractum', 3)
  , (22, 'Charm', 'Banishing', 'Depulso', 4)
  , (23, 'Charm', 'Shield', 'Protego', 5)
  , (24, 'Charm', 'Silencing', 'Silencio', 5)
  , (25, 'Charm', 'Patronus', 'Expecto Patronum', 5);
INSERT INTO school_spells(id, school_id, spell_id)
  VALUES (16, 1, 16)
  , (17, 1, 17)
  , (18, 1, 18)
  , (19, 1, 19)
  , (20, 1, 20)
  , (21, 1, 21)
  , (22, 1, 22)
  , (23, 1, 23)
  , (24, 1, 24)
  , (25, 1, 25);

  --
  -- Do the workshop
  --
  DO $$
  DECLARE
    students_csr CURSOR FOR
      SELECT * FROM students WHERE alumni_status = false;
    spells_csr CURSOR FOR
      SELECT * FROM spells WHERE category = 'Charm' ORDER BY level;
  BEGIN
    FOR r_student IN students_csr LOOP
      FOR r_spell IN spells_csr LOOP
        BEGIN
          -- Test if the stufent is eligible to practice the spell
          -- IF r_spell.level <= r_student.year THEN
            -- Practice the spell 10x
            FOR i IN 1..10 LOOP
              PERFORM practice_spell(r_student.id, r_spell.id);
            END LOOP;
          -- END IF;
        EXCEPTION WHEN OTHERS THEN
          BEGIN
            RAISE NOTICE '% (Year %) with "%" % (Level %)'
            , r_student.name
            , r_student.year
            , r_spell.name
            , r_spell.category
            , r_spell.level;
          END;
          CONTINUE;
        END;
      END LOOP;
    END LOOP;
  END$$;
