# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require 'pry'

require_relative 'school'
require_relative 'house'
require_relative 'student'
require_relative 'spell'
require_relative 'known_spell'

# Create students
potter = Student.new(name: 'Harry Potter', gender: 'M', birth_date: '1980-07-31', admission_date: '1991', year: 7)
r_weasley = Student.new(name: 'Ron Weasley', gender: 'M', birth_date: '1980-03-01', admission_date: '1991', year: 6)
granger = Student.new(name: 'Hermione Granger', gender: 'F', birth_date: '1979-09-19', admission_date: '1991', year: 6)
g_weasley = Student.new(name: 'Ginny Weasley', gender: 'F', birth_date: '1981-08-11', admission_date: '1992', year: 5)
d_malfoy = Student.new(name: 'Draco Malfoy', gender: 'M', birth_date: '1980-06-05', admission_date: '1991', year: 6)
crabbe = Student.new(name: 'Vincent Crabbe', gender: 'M', admission_date: '1991', year: 6)
goyle = Student.new(name: 'Gregory Goyle', gender: 'M', admission_date: '1991', year: 6)
st8 = Student.new(name: 'Pansy Parkinson', gender: 'F', admission_date: '1991', year: 6)
st9 = Student.new(name: 'Luna Lovegood', gender: 'F', admission_date: '1992', year: 5)
st10 = Student.new(name: 'Cho Chang', gender: 'F', admission_date: '1990', year: 7, status: true)
st11 = Student.new(name: 'Padma Patil', gender: 'F', admission_date: '1991', year: 6)
st12 = Student.new(name: 'Marcus Belby', gender: 'M')
st13 = Student.new(name: 'Cedric Diggory', gender: 'M', admission_date: '1988', year: 4)
st14 = Student.new(name: 'Susan Bones', gender: 'F', admission_date: '1991', year: 6)
st15 = Student.new(name: 'Hannah Abbott', gender: 'F', admission_date: '1991', year: 6)
st16 = Student.new(name: 'Justin Finch-Fletchley', gender: 'M', admission_date: '1991', year: 6)
students = [potter, r_weasley, granger, g_weasley, d_malfoy, crabbe, goyle, st8, st9, st10, st11, st12,
  st13, st14, st15, st16]

# Create houses and add students
gryffindor = House.new(name: 'Gryffindor', animal: 'Lion', students: [potter, r_weasley, granger, g_weasley])
ravenclaw = House.new(name: 'Ravenclaw', animal: 'Eagle', students: [d_malfoy, crabbe, goyle, st8])
slytherin = House.new(name: 'Slytherin', animal: 'Snake', students: [st9, st10, st11, st12])
hufflepuff = House.new(name: 'Hufflepuff', animal: 'Badger', students: [st13, st14, st15, st16])
houses = [gryffindor, ravenclaw, slytherin, hufflepuff]

# Create spells
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
spell13 = Spell.new(name: 'Cruciatus', category: 'Curse', incantation: 'Crucio', level: 7)
spell14 = Spell.new(name: 'Imperius', category: 'Curse', incantation: 'Imperio', level: 6)
spell15 = Spell.new(name: 'Avada Kedavra', category: 'Curse', incantation: 'Avada Kedavra', level: 7)
spells = [spell1, spell2, spell3, spell4, spell5, spell6, spell7, spell8,
  spell9, spell10, spell11, spell12, spell13, spell14, spell15]

# Create school and add houses and spells
school = School.new(name: 'Hogwarts', houses: houses, spells: spells)

# Add spells to students
students.each { |e| e.learn_spells(spells) }

# Create more spells
spell16 = Spell.new(name: 'Unlocking', category: 'Charm', incantation: 'Alohomora', level: 1)
spell17 = Spell.new(name: 'Softening', category: 'Charm', incantation: 'Spongify ', level: 1)
spell18 = Spell.new(name: 'Transfiguration', category: 'Spell', incantation: 'Avifors', level: 2)
spell19 = Spell.new(name: 'Severing ', category: 'Charm', incantation: 'Diffindo', level: 2)
spell20 = Spell.new(name: 'Lumos Maxima', category: 'Charm', incantation: 'Lumos Maxima', level: 3)
spell21 = Spell.new(name: 'Seize and Pull', category: 'Charm', incantation: 'Carpe Retractum', level: 3)
spell22 = Spell.new(name: 'Banishing ', category: 'Charm', incantation: 'Depulso', level: 4)
spell23 = Spell.new(name: 'Shield', category: 'Charm', incantation: 'Protego', level: 5)
spell24 = Spell.new(name: 'Silencing', category: 'Charm', incantation: 'Silencio', level: 5)
patronus = Spell.new(name: 'Patronus', category: 'Charm', incantation: 'Expecto Patronum', level: 5)
more_spells = [spell16, spell17, spell18, spell19, spell20, spell21, spell22, spell23, spell24, patronus]
more_spells.each { |e| school.add_spell(e) }

# binding.pry

# Assign global variables for querying from a different file
$school = school
$potter = potter
$levitation = spell1
$patronus = patronus
