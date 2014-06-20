-- Ruby/SQL Lab
-- Blair Caple
-- June 20, 2014

delete database if exists hogwarts;
create database hogwarts;
\c hogwarts

create table school(
  id integer primary key
  , name text not null
);

insert into school (id, name) values (1, 'Hogwarts');

create table houses(
  id integer primary key
  , school_id integer not null references school(id)
  , name text not null
  , animal text not null
  , points integer default = 0
);

insert into houses (id, school_id, name, animal)
values (1, 1, 'Gryffindor', 'Lion')
  , (2, 1, 'Slytherin', 'Snake')
  , (3, 1, 'Ravenclaw', 'Eagle')
  , (4, 1, 'Hufflepuff', 'Badger')

create table students(
  id integer primary key
  , school_id integer not null references schools(id)
  , house_id integer references house(id)
  , name text not null
  , gender text
  , year text
  , birth_date date
  , admission_date date
  , alumni_status boolean default = 0
);

insert into students (id, school_id, house_id, name, gender)
  values (1, 1, 1, 'Harry Potter', 'M')
  , (2, 1, 1, 'Ron Weasley', 'M')
  , (3, 1, 1, 'Hermione Granger', 'F')
  , (4, 1, 1, 'Ginny Weasley', 'F')
  , (5, 2, 2, 'Merlin Malfoy', 'M')
  , (6, 2, 2, 'Vincent Crabbe', 'M')
  , (7, 1, 2, 'Gregory Goyle', 'M')
  , (8, 1, 2, 'Pansy Parkinson', 'F')
  , (9, 1, 3, 'Luna Lovegood', 'F')
  , (10, 1, 3, 'Cho Chang', 'F')
  , (11, 1, 3, 'Padma Patil', 'F')
  , (12, 1, 3, 'Marcus Belby', 'M')
  , (13, 1, 4, 'Cedric Diggory', 'M')
  , (14, 1, 4, 'Susan Bones', 'F')
  , (15, 1, 4, 'Hannah Abbott', 'F')
  , (16, 1, 4, 'Justin Finch-Fletchley', 'M')

create table known_spells(
  id integer primary key
  student_id integer not null
  spell_id integer not null
  proficiency integer default 0
  last_used date
);

insert into known_spells (id, student_id, spell_id)
  values (1, 1, 1)
  , (2, 1, 2)
  , (3, 2, 1)
  , (4, 2, 2)
  , (5, 3, 1)
  , (6, 3, 2)
  , (7, 4, 1)
  , (8, 4, 2)
  , (9, 5, 1)
  , (10, 5, 2)
  , (11, 6, 1)
  , (12, 6, 2)
  , (13, 7, 1)
  , (14, 7, 2)
  , (15, 8, 1)
  , (16, 8, 2)
  , (17, 9, 1)
  , (18, 9, 2)
  , (19, 10, 1)
  , (20, 10, 2)
  , (21, 11, 1)
  , (22, 11, 2)
  , (23, 12, 1)
  , (24, 12, 2)
  , (25, 13, 1)
  , (26, 13, 2)
  , (27, 14, 1)
  , (28, 14, 2)
  , (29, 15, 1)
  , (30, 15, 2)
  , (31, 16, 1)
  , (32, 16, 2)

create table spells(
  id integer primary key
  , school_id integer not null references schools(id
  , category text not null
  , name text not null
  , incantation text
  , level integer
);

insert into spells (id, school_id, category, name, incantation, level)
  values (1, 1, 'Charm', 'Ascendio', '', 1)
  values (2, 1, 'Charm', 'Aresto Momentum', '', 1)
  values (3, 1, 'Charm', 'Baubillious', '', 2)
  values (4, 1, 'Curse', 'Crucio', '', 7)
  values (5, 1, 'Curse', 'Expulso', '', 5)
  values (6, 1, 'Curse', 'Petrificus Totalus', '', 6)
  values (7, 1, 'Hex', 'Densaugeo', '', 2)
  values (8, 1, 'Hex', 'Anteoculatia', '', 3)
