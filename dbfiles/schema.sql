DROP DATABASE IF EXISTS hogwarts;
CREATE DATABASE hogwarts;

\c hogwarts

CREATE TABLE houses (
  id SERIAL PRIMARY KEY,
  animal TEXT,
  points INTEGER,
  name TEXT
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT,
  gender TEXT,
  year INTEGER,
  birth_date DATE,
  admission_date DATE,
  alumni_status TEXT,
  house_id INTEGER REFERENCES houses
);

CREATE TABLE spells (
  id SERIAL PRIMARY KEY,
  name TEXT,
  incantation TEXT,
  category TEXT,
  level INTEGER CHECK (level > 0 AND level <= 100)
);

CREATE TABLE known_spells (
  id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students,
  spell_id INTEGER REFERENCES spells,
  proficiency INTEGER DEFAULT 0
);
