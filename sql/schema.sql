DROP DATABASE IF EXISTS hogwarts;
CREATE DATABASE hogwarts;
\c hogwarts

CREATE TABLE houses (
  id SERIAL PRIMARY KEY,
  name TEXT,
  animal TEXT,
  points INTEGER
);

CREATE INDEX ON houses (name);
CREATE INDEX ON houses (animal);
CREATE INDEX ON houses (points);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  gender TEXT,
  name TEXT,
  year INTEGER,
  birth_date DATE,
  admission_date DATE,
  alumni_status BOOLEAN,
  house_id INTEGER REFERENCES houses
);

CREATE INDEX ON students (name);
CREATE INDEX ON students (year);
CREATE INDEX ON students (birth_date);
CREATE INDEX ON students (admission_date);
CREATE INDEX ON students (house_id);

CREATE TABLE spells (
  id SERIAL PRIMARY KEY,
  name TEXT,
  incantation TEXT,
  category TEXT,
  level INTEGER
);

CREATE INDEX ON spells (name);
CREATE INDEX ON spells (incantation);
CREATE INDEX ON spells (category);
CREATE INDEX ON spells (level);

CREATE TABLE known_spells (
  students_id INTEGER REFERENCES students,
  spells_id INTEGER REFERENCES spells,
  proficiency NUMERIC
);
