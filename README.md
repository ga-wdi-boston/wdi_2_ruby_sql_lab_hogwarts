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
* admission date
* alumni status (have they graduated?)

Schools also teach many `spells`. Spells have these properties:

* name
* incantation
* category (charms, dark arts, etc.)
* level (year at which a student may first learn the spell)

Students can learn spells through the school &ndash; we might call these `known_spells`. Known spells have a "proficiency", which is a percentage between 0 and 100. Students will gain proficiency in spells over time, though they may lose proficiency if they haven't practiced in a while.
