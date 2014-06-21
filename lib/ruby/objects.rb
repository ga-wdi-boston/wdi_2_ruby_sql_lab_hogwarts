# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require 'pry'

require_relative 'school'
require_relative 'house'
require_relative 'student'
require_relative 'spell'
require_relative 'known_spell'

st1 = Student.new(name: 'Harry Potter', gender: 'M', birth_date: '07-31-1980', admission_date: '1991')
st2 = Student.new(name: 'Ron Weasley', gender: 'M', birth_date: '03-01-1980', admission_date: '1991')
st3 = Student.new(name: 'Hermione Granger', gender: 'F', birth_date: '09-19-1979', admission_date: '1991')
st4 = Student.new(name: 'Ginny Weasley', gender: 'F', birth_date: '08-11-1981', admission_date: '1992')
st5 = Student.new(name: 'Draco Malfoy', gender: 'M', birth_date: '06-05-1980', admission_date: '1991')
st6 = Student.new(name: 'Vincent Crabbe', gender: 'M', admission_date: '1991')
st7 = Student.new(name: 'Gregory Goyle', gender: 'M', admission_date: '1991')
st8 = Student.new(name: 'Pansy Parkinson', gender: 'F', admission_date: '1991')
st9 = Student.new(name: 'Luna Lovegood', gender: 'F', admission_date: '1992')
st10 = Student.new(name: 'Cho Chang', gender: 'F', admission_date: '1990')
st11 = Student.new(name: 'Padma Patil', gender: 'F', admission_date: '1991')
st12 = Student.new(name: 'Marcus Belby', gender: 'M')
st13 = Student.new(name: 'Cedric Diggory', gender: 'M', admission_date: '1988')
st14 = Student.new(name: 'Susan Bones', gender: 'F', admission_date: '1991')
st15 = Student.new(name: 'Hannah Abbott', gender: 'F', admission_date: '1991')
st16 = Student.new(name: 'Justin Finch-Fletchley', gender: 'M', admission_date: '1991')

gryffindor = House.new(name: 'Gryffindor', animal: 'Lion', students: [st1, st2, st3, st4])
ravenclaw = House.new(name: 'Ravenclaw', animal: 'Eagle', students: [st5, st6, st7, st8])
slytherin = House.new(name: 'Slytherin', animal: 'Snake', students: [st9, st10, st11, st12])
hufflepuff = House.new(name: 'Hufflepuff', animal: 'Badger', students: [st13, st14, st15, st16])
houses = [griffindor, ravenclaw, slytherin, hufflepuff]

spell1 = Spell.new(name: 'Levitation', category: 'Charm', incantation: 'Wingardium Leviosa', level: 1)
spell3 = Spell.new(name: 'Wand-Lighting ', category: 'Charm', incantation: 'Lumos ', level: 1)
spell4 = Spell.new(name: 'Arresto Momentum', category: 'Charm', incantation: 'Arresto Momentum', level: 2)
spell6 = Spell.new(name: 'Memory ', category: 'Charm', incantation: 'Obliviate', level: 2)
spell5 = Spell.new(name: 'Freezing ', category: 'Charm', incantation: 'Glacius', level: 3)
spell2 = Spell.new(name: 'Disarming', category: 'Charm', incantation: 'Expelliarmus ', level: 3)
spell7 = Spell.new(name: 'Summoning ', category: 'Charm', incantation: 'Accio', level: 4)
spell8 = Spell.new(name: 'Mending', category: 'Charm', incantation: 'Reparo', level: 4)
spell9 = Spell.new(name: 'Stunning', category: 'Spell', incantation: 'Stupefy', level: 5)
spell10 = Spell.new(name: 'Fire-Making', category: 'Spell', incantation: 'Incendio', level: 5)
spell11 = Spell.new(name: 'Water-Making', category: 'Spell', incantation: 'Aguamenti', level: 6)
spell12 = Spell.new(name: 'Non-Verbal', category: 'Spell', incantation: '', level: 6)
spells = [spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8, spell9, spell10, spell11, spell12]

school = School.new(name: 'Hogwarts', houses, spells)

st1.add_spell(sp1)
st1.add_spell(sp2)
st2.add_spell(sp1)
st2.add_spell(sp2)
st3.add_spell(sp1)
st3.add_spell(sp2)
st4.add_spell(sp1)
st4.add_spell(sp2)
st5.add_spell(sp1)
st5.add_spell(sp2)
st6.add_spell(sp1)
st6.add_spell(sp2)
st7.add_spell(sp1)
st7.add_spell(sp2)
st8.add_spell(sp1)
st8.add_spell(sp2)
st9.add_spell(sp1)
st9.add_spell(sp2)
st10.add_spell(sp1)
st10.add_spell(sp2)
st11.add_spell(sp1)
st11.add_spell(sp2)
st12.add_spell(sp1)
st12.add_spell(sp2)
st13.add_spell(sp1)
st13.add_spell(sp2)
st14.add_spell(sp1)
st14.add_spell(sp2)
st15.add_spell(sp1)
st15.add_spell(sp2)
st16.add_spell(sp1)
st16.add_spell(sp2)

binding.pry
