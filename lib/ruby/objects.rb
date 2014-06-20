# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative 'school'
require_relative 'house'
require_relative 'student'
require_relative 'spell'
require_relative 'known_spell'

gryffindor = House.new(name: 'Gryffindor', animal: 'Lion')
ravenclaw = House.new(name: 'Ravenclaw', animal: 'Eagle')
slytherin = House.new(name: 'Slytherin', animal: 'Snake')
hufflepuff = House.new(name: 'Hufflepuff', animal: 'Badger')
houses = [griffindor, ravenclaw, slytherin, hufflepuff]

sp1 = Spell.new(name: 'Ascendio', category: 'Charm', level: 1)
sp2 = Spell.new(name: 'Aresto Momentum', category: 'Charm', level: 1)
sp3 = Spell.new(name: 'Baubillious', category: 'Charm', level: 2)
sp4 = Spell.new(name: 'Crucio', category: 'Curse', level: 7)
sp5 = Spell.new(name: 'Expulso', category: 'Curse', level: 5)
sp6 = Spell.new(name: 'Petrificus Totalus', category: 'Curse', level: 6)
sp7 = Spell.new(name: 'Densaugeo', category: 'Hex', level: 2)
sp8 = Spell.new(name: 'Anteoculatia', category: 'Hex', level: 3)
spells = [sp1, sp2, sp3, sp4, sp5, sp6, sp7, sp8]

school = House.new(name: 'Hogwarts', houses, spells)

st1 = Student.new(name: 'Harry Potter', gender: 'M', house: gryffindor)
st2 = Student.new(name: 'Ron Weasley', gender: 'M', house: gryffindor)
st3 = Student.new(name: 'Hermione Granger', gender: 'F', house: gryffindor)
st4 = Student.new(name: 'Ginny Weasley', gender: 'F', house: gryffindor)
st5 = Student.new(name: 'Draco Malfoy', gender: 'M', house: slytherin)
st6 = Student.new(name: 'Vincent Crabbe', gender: 'M', house: slytherin)
st7 = Student.new(name: 'Gregory Goyle', gender: 'M', house: slytherin)
st8 = Student.new(name: 'Pansy Parkinson', gender: 'F', house: slytherin)
st9 = Student.new(name: 'Luna Lovegood', gender: 'F', house: ravenclaw)
st10 = Student.new(name: 'Cho Chang', gender: 'F', house: ravenclaw)
st11 = Student.new(name: 'Padma Patil', gender: 'F', house: ravenclaw)
st12 = Student.new(name: 'Marcus Belby', gender: 'M', house: ravenclaw)
st13 = Student.new(name: 'Cedric Diggory', gender: 'M', house: hufflepuff)
st14 = Student.new(name: 'Susan Bones', gender: 'F', house: hufflepuff)
st15 = Student.new(name: 'Hannah Abbott', gender: 'F', house: hufflepuff)
st16 = Student.new(name: 'Justin Finch-Fletchley', gender: 'M', house: hufflepuff)

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
