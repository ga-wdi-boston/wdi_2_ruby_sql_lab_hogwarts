DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
\c school

CREATE TABLE houses(
  id SERIAL PRIMARY KEY ,
  name TEXT,
  animal TEXT,
  points NUMERIC
);

CREATE INDEX ON houses (name);

CREATE TABLE students(
  id SERIAL PRIMARY KEY ,
  name TEXT,
  gender TEXT,
  year TEXT,
  birth_date DATE,
  admission_date DATE,
  alum_st BOOLEAN,
  house_id INTEGER REFERENCES houses
);

CREATE INDEX ON students (name);

CREATE TABLE spells(
  id SERIAL PRIMARY KEY ,
  incantation TEXT,
  description TEXT,
  category TEXT,
  level TEXT
);

CREATE INDEX ON spells (incantation);

CREATE TABLE known_spells(
  id SERIAL PRIMARY KEY,
  proficiency NUMERIC,
  spell_id INTEGER REFERENCES spells,
  student_id INTEGER REFERENCES students,
  date_learned DATE DEFAULT current_timestamp
);
