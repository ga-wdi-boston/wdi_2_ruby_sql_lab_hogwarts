DROP DATABASE IF EXISTS hogwarts;
CREATE DATABASE hogwarts;
\c hogwarts

CREATE TABLE houses (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  animal TEXT NOT NULL,
  points INTEGER NOT NULL
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  gender TEXT NOT NULL,
  class_year INTEGER NOT NULL,
  bday DATE NOT NULL,
  admission DATE,
  alumn BIT NOT NULL,
  house_id INTEGER REFERENCES houses
);

CREATE TABLE spells (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  incantation TEXT NOT NULL,
  category TEXT NOT NULL,
  level INTEGER NOT NULL
);

CREATE TABLE known_spells (
  id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students,
  spell_id INTEGER REFERENCES spells,
  proficiency INTEGER NOT NULL
);
