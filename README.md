# SQL+Ruby Comprehensive Lab

In this lab we'll be developing both a SQL database schema *and*, in parallel, a set of Ruby classes that a magic school could use to track the progress of their students. These two parts of the lab will be completely separate and will **not** communicate with each other in any way &ndash; the idea is to get you thinking about how data can be represented in both SQL and Ruby.

Organization of SQL files and Ruby code files is entirely up to you. You can build the Ruby half of the lab using TDD with RSpec, but this is optional. Only test-drive if you feel it won't slow you down too much.

## Step 1: Schema

Schools of magic consist of several `houses`. Houses have these properties:

* name
* animal (lion, badger, etc.)
* points (awarded or subtracted by teachers)

Each house consists of many `students`. Students have these properties:

* name
* gender
* year (first year, second year, etc.)
* birth date
* admission date
* alumni status (have they graduated?)

Schools also teach many `spells`. Spells have these properties:

* name
* incantation
* category (charms, dark arts, etc.)
* level (year at which a student may first learn the spell)

Students can learn spells through the school &ndash; we might call these `known_spells`. Known spells have a "proficiency", which is a percentage between 0 and 100. Students will gain proficiency in spells over time, though they may lose proficiency if they haven't practiced in a while.

Create a database and tables to store these objects, with appropriate columns and indexes. Store your commands in a `.sql` file so you can re-run them easily.

## Step 2: Classes

Create Ruby classes for the three main concepts listed in Step 1, and allow them to be initialized with the listed attributes. Additionally, create a "container" class called School to hold a list of houses and a list of spells.

Add the following CRUD behaviors to your classes:

* Houses maintain a list of their students, and students hold a reference to the house they belong to.
* Students can only be added to a house through a method that checks whether they are at least 10 years old, and throws an error otherwise. If the student is added, they have their year set to 1 and their admission date set to the current date.
* Students maintain a list of their "known spells", and spells maintain a list of students who know them.
* Students have a method that allows them to practice a specific spell. If they don't already know the spell, it becomes part of their "known spells" and starts at 0% proficiency. If the spell is already known, its proficiency increases by 1%.

Aside from the student-adding and spell-practicing methods above, there does not (yet) need to be any other way to manipulate the various lists of objects.
