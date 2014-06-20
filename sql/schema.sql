-- Ruby/SQL Lab
-- Blair Caple
-- June 20, 2014

delete database if exists hogwarts;
create database hogwarts;
\c hogwarts

create table school(
  id serial primary key
  , name text not null
);

create table houses(
  id serial primary key
  , school_id integer not null references school(id)
  , name text not null
  , animal text not null
  , points integer
);

create table students(
  id serial primary key
  , school_id integer not null references schools(id)
  , house_id integer references house(id)
  , name text not null
  , gender text
  , year text
  , birth_date date
  , admission_date date
  , alumni_status boolean default = 0
);

create table known_spells(
  id serial primary key
  student_id integer not null
  spell_id integer not null
  proficiency integer default 0
  last_used date
);

create table spells(
  id serial primary key
  , school_id integer not null references schools(id
  , category_id integer not null references spell_categories(id)
  , name text not null
  , incantation text
  , level integer
);

create table spell_categories(
  id serial primary key
  , name text not null
);
