require_relative '../lib/schools.rb'
require_relative '../lib/houses.rb'
require_relative '../lib/students.rb'
require_relative '../lib/spells.rb'
require 'pry'
require 'date'

## Create the houses

gryffindor = House.new(name: 'Gryffindor', animal: 'Lion', points: 0)
hufflepuff = House.new(name: 'Hufflepuff', animal: 'Badger', points: 0)
ravenclaw = House.new(name: 'Ravenclaw', animal: 'Eagle', points: 0)
slytherin = House.new(name: 'Slytherin', animal: 'Snake', points: 0)

spell1 = ('Houdini ', 'HOUDINI!', 'Charms', 'First Year')
spell2 = ('Big Head Curse', 'Biggus Headus', 'Transfiguration', 'First Year')
spell3 = ('Cageify Curse', 'Nicolas Cagus', 'Transfiguration', 'Fourth Year')
spell4 = ('Calming Charm', 'Slowus Rollus', 'Charms', 'Second Year')
spell5 = ('The Killing Curse', 'Avada Kevadra', 'Dark Arts', 'Seventh Year')
spell6 = ('Summoning Charm', 'Accio', 'Charms', 'First Year')
spell7 = ('Sarcastify', 'Sarco Barko', 'Charms', 'Fifth Year')
spell8 = ('Memory Charm', 'Obliviate', 'Charms', 'Second Year')
spell9 = ('Body-Bind Curse', 'Petrificus Totalus', 'Dark Arts', 'Sixth Year')
spell10 = ('Slug Vomiting Charm', 'Slugus Barfus', 'Charms', 'Third Year')

harry = Student.new(name: 'Harry Potter', gender: 'male', year: 'First Year', birth_date: '1980-07-31', admission_date: Date., house: gryffindor)

binding.pry
