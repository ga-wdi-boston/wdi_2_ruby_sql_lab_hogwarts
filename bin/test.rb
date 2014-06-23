require_relative '../lib/schools.rb'
require_relative '../lib/houses.rb'
require_relative '../lib/students.rb'
require_relative '../lib/spells.rb'
require_relative '../lib/known_spells.rb'
require 'pry'
require 'date'

## Create the houses

gryffindor = House.new(name: 'Gryffindor', animal: 'Lion', points: 0)
hufflepuff = House.new(name: 'Hufflepuff', animal: 'Badger', points: 0)
ravenclaw = House.new(name: 'Ravenclaw', animal: 'Eagle', points: 0)
slytherin = House.new(name: 'Slytherin', animal: 'Snake', points: 0)

spell1 = Spell.new(name: 'Houdini ', incantation: 'HOUDINI!', category: 'Charms', level: 'First Year')
spell2 = Spell.new(name: 'Big Head Curse', incantation: 'Biggus Headus', category: 'Transfiguration', level: 'First Year')
spell3 = Spell.new(name: 'Cageify Curse', incantation: 'Nicolas Cagus', category: 'Transfiguration', level: 'Fourth Year')
spell4 = Spell.new(name: 'Calming Charm', incantation: 'Slowus Rollus', category: 'Charms', level: 'Second Year')
spell5 = Spell.new(name: 'The Killing Curse', incantation: 'Avada Kevadra', category: 'Dark Arts', level: 'Seventh Year')
spell6 = Spell.new(name: 'Summoning Charm', incantation: 'Accio', category: 'Charms', level: 'First Year')
spell7 = Spell.new(name: 'Sarcastify', incantation: 'Sarco Barko', category: 'Charms', level: 'Fifth Year')
spell8 = Spell.new(name: 'Memory Charm', incantation: 'Obliviate', category: 'Charms', level: 'Second Year')
spell9 = Spell.new(name: 'Body-Bind Curse', incantation: 'Petrificus Totalus', category: 'Dark Arts', level: 'Sixth Year')
spell10 = Spell.new(name: 'Slug Vomiting Charm', incantation: 'Slugus Barfus', category: 'Charms', level: 'Third Year')

student1 = Student.new(name: 'Harry Potter', gender: 'male', year: 'First Year', birth_date: '1980-07-31', admission_date: Date.today, house: gryffindor)

student2 = Student.new(name: 'Hermione Granger', gender: 'female', year: 'Second Year', birth_date: '1979-09-19', admission_date: Date.today, house: 'Gryffindor')
student3 = Student.new(name: 'Ron Weasley', gender: 'male', year: 'Second Year', birth_date: '1980-03-01', admission_date: Date.today, house: 'Gryffindor')
student4 = Student.new(name: 'Fred Weasley', gender: 'male', year: 'Third Year', birth_date: '1978-04-01', admission_date: Date.today, house: 'Gryffindor')
student5 = Student.new(name: 'George Weasley', gender: 'male', year: 'Third Year', birth_date: '1978-04-01', admission_date: Date.today, house: 'Gryffindor')
student6 = Student.new(name: 'Ginny Weasley', gender: 'female', year: 'First Year', birth_date: '1981-08-11', admission_date: Date.today, house: 'Gryffindor')
student7 = Student.new(name: 'Draco Malfoy', gender: 'male', year: 'Second Year', birth_date: '1980-06-05', admission_date: Date.today, house: 'Slytherin')
student8 = Student.new(name: 'Luna Lovegood', gender: 'female', year: 'First Year', birth_date: '1981-05-02', admission_date: Date.today, house: 'Ravenclaw')
student9 = Student.new(name: 'Cedric Diggory', gender: 'male', year: 'Fourth Year', birth_date: '1977-10-31', admission_date: Date.today, house: 'Hufflepuff')
student10 = Student.new(name: 'Vincent Crabbe', gender: 'male', year: 'Second Year', birth_date: '1980-01-01', admission_date: Date.today, house: 'Slytherin')

gryffindor_students = [student1, student2, student3, student4, student5, student6]

slytherin_students = [student7, student10]

gryffindor.bulk_add_students(gryffindor_students)

ravenclaw.add_student(student8)

hufflepuff.add_student(student9)

KnownSpell.new(proficiency: 78, level: 1, spell: spell6, student: student1)

binding.pry
