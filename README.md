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

Create Ruby classes for the three main concepts listed in Step 1, and allow them to be initialized with the listed attributes. Additionally, create a "container" class called School.

* The school has a list of houses and a list of spells.
* Houses have a list of their students, and students hold a reference to the house they belong to.
* Students have a list of their "known spells", and spells have a list of students who know them.

There does not (yet) need to be a way to manipulate these lists of objects, other than using the built-in Ruby methods to alter them directly.

## Step 3: Data

In a `.sql` file, write commands that will insert a variety of data into the database you created in Step 1. Make sure you have several houses and several spells in various categories, with each house having several students and each student knowing several spells (appropriate to their year level) with varying degrees of proficiency.

Then, in a `.rb` file, require the classes you created in Step 2 and write code that will create a mirror of your SQL data as Ruby objects. Of course, unlike your SQL data this will not be saved anywhere, but run your file with a `binding.pry` at the end to make sure it works.

## Step 4: Queries

Implement each of the following queries as SQL statements *and* Ruby methods on the appropriate classes. Add the SQL queries to a separate `.sql` file, and add example uses of your Ruby methods to the `.rb` file you created in Step 3.

* Get all current students (i.e. not alumni) sorted alphabetically.
* For a given student, find all spell categories they know spells in.
* For a given student, get their average proficiency level across all spells they know.
* For a given student, find all spells at their level or lower that they *don't* know.
* For a given spell, find all students who are at the spell's level or higher, but don't know it.
* Get a roster of all current students:
  * **SQL:** Sort the students by house, by year within houses, and alphabetically within years. The name of the house should be included in the results.
  * **Ruby:** Return a hash where the keys are house names and the values are hashes. Within these hashes, the keys are year numbers and the values are arrays of students, sorted alphabetically.
* For a given spell category, houses have a "total proficiency", which is the sum of the proficiency scores of all students in the house for all spells in that category. Find out which spell category each house is most proficient in, using this metric.

## Step 5: Behavior

Implement each of the following behaviors as specified. Add the SQL queries to a separate `.sql` file, and add example uses of your Ruby methods to the `.rb` file you created in Step 3.

### Admitting Students

* **Ruby:** Students can only be admitted to a house through a method that checks whether they are at least 10 years old, and throws an error otherwise. If the student is added, they have their year set to 1, their admission date set to the current date, and their house reference set appropriately.
* **SQL:** Create a new student who is 10 years old, but does not have their year or admission date set. Then write a statement that will admit this student into a house, set their year to 1, and set their admission date to the current date.

### Awarding House Points

* **Ruby:** Teachers may award or subtract points from a student's house depending on their behavior. Implement this either as a method on students, or a method on the school that accepts a student. The key is that you must start from the student.
* **SQL:** Write a SQL statement that will award or subtract points from a specific student's house. Start from the student, and do not specify the house directly.

### Practicing Spells

* **Ruby:** Students can practice a specific spell. If they don't already know the spell, it becomes part of their "known spells" and starts at 0% proficiency. If the spell is already known, its proficiency increases by 1%, unless it is already at 100%. If the spell is higher than the student's current level, an error should be thrown.
* **Ruby:** The school can hold a "workshop" for a specific category of spell. This will allow all students to practice all spells in that category 10 times. If a spell is higher than a student's current level, no error should be thrown; the spell just isn't practiced.
* **SQL:** Write a set of SQL statements that will perform the "workshop" behavior described above for some arbitrary category. Make sure spells are added to a student's "known spells" if they didn't already know them, spell levels are respected, and proficiency cannot go above 100%. Enclose these queries in a transaction so there is no risk of partial updates.

### The Winning House

* **Ruby:** At the end of the school year, whichever house has the most points is given a prize. Write a School method that determines which house has the most points.
* **SQL:** Write a SQL statement that makes this same determination. The result should be only the name of the winning house.

### Summer Break

* **Ruby:** Over the summer, two things happen. Write a School method that does both of these:
  1. All students' years are increased by 1. The exception is students who are at year 7, who instead graduate from the school. Their alumni status should be updated accordingly.
  2. All students lose 10% proficiency in all of their spells. If this would take their proficiency below 0%, they will forget the spell entirely &ndash; it is removed from their "known spells".
* **SQL:** Write a set of SQL statements that will perform the behaviors described above (wrapped in a transaction as before).

## Super Bonus Challenge EX Ultra Edition

Remember how we said the two halves of this lab would be completely disconnected? If you're feeling especially adventurous, and all of the above tasks weren't enough for you, how's this for a challenge: Connect them! Use the [`pg` gem](http://deveiate.org/code/pg/), already installed on your system, to execute SQL statements from your Ruby code. For instance, asking the School for its houses should retrieve all the house records from the database, instantiate House objects for each of them, and return those from the method. We would never need to write code like this in real life since there is a part of Rails called ActiveRecord that does all the work for us... but this will certainly give you an appreciation for how much work that is!
