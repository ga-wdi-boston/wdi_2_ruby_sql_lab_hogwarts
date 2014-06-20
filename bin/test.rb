require_relative '../lib/schools.rb'
require_relative '../lib/houses.rb'
require_relative '../lib/students.rb'
require_relative '../lib/spells.rb'
require 'pry'

## Create the houses

gryffindor = House.new(name: 'Gryffindor', animal: 'Lion', points: 0)
hufflepuff = House.new(name: 'Hufflepuff', animal: 'Badger', points: 0)
ravenclaw = House.new(name: 'Ravenclaw', animal: 'Eagle', points: 0)
slytherin = House.new(name: 'Slytherin', animal: 'Snake', points: 0)

spell1 = Spell.new(name: 'Houdini Spell', incantation: 'HOUDINI!', category: 'Charms', level: 'First Year')
spell2 = Spell.new(name: 'Big Head Curse', incantation: 'Biggus Headus', category: 'Transfiguration', level: 'First Year')
spell3 = Spell.new(name: 'Cageify Curse', incantation: 'Nicolas Cagus', category: 'Transfiguration', level: 'Fourth Year')
spell4 = Spell.new(name: 'Calming Charm', incantation: 'Slowus Rollus', category: 'Charms', level: 'Second Year')
spell5 = Spell.new(name: 'The Killing Curse', incantation: 'Avada Kevadra', category: 'Dark Arts', level: 'Seventh Year')
spell6 = Spell.new(name: 'Summoning Charm', incantation: 'Accio', category: 'Charms', level: 'First Year')
spell7 = Spell.new(name: 'Sarcastify', incantation: 'Sarco Barko', category: 'Charms', level: 'Fifth Level')
spell8 = Spell.new(name: 'Memory Charm', incantation: 'Obliviate', category: 'Charms', level: 'Second Year')
spell9 = Spell.new(name: 'Body-Bind Curse', incantation: 'Petrificus Totalus', category: 'Dark Arts', level: 'Sixth Year')
spell10 = Spell.new(name: 'Slug Vomiting Charm', incantation: 'Slugus Barfus', category: 'Charms', level: 'Third Year')

binding.pry
