require_relative '../lib/school'
require_relative '../lib/student'
require_relative '../lib/house'
require_relative '../lib/spell'
require 'date'
require 'pry'


summoning = Spell.new('Summoning Charm', 'Accio', 'Charm', 2)
gouging = Spell.new('Gouging Spell', 'Defodio', 'Charm', 4)
severing = Spell.new('Severing Charm', 'Diffindo', 'Charm', 2)
cruciatus = Spell.new('Cruciatus Curse', 'Crucio', 'Curse', 11)
patronus = Spell.new('Patronus Charm', 'Expecto Patronum', 'Defence', 6)
disarming = Spell.new('Disarming Charm', 'Expelliarmus', 'Defence', 5)
killing = Spell.new('Killing Curse', 'Avada Kedavra', 'Curse', 12)

spells = [summoning, gouging, severing, cruciatus, patronus, disarming, killing]

ravenclaw = House.new('Raven', 'Ravenclaw', 100)
gryffindor = House.new('Lion', 'Gryffindor', 70)
hufflepuff = House.new('Badger', 'Hufflepuff', 30)
slytherin = House.new('Serpent', 'Slytherin', 120)


harry = Student.new('Harry', :male, 4, '1994-04-12', '2004-05-31', false, gryffindor)
hermione = Student.new('Hermione', :female, 4, '1993-09-12', '2004-05-31', false, ravenclaw)
ron = Student.new('Ron', :male, 5, '1993-06-11', '2003-05-28', false, hufflepuff)
fred = Student.new('Fred', :male, 9, '1988-08-01', '1999-05-29', true, gryffindor)
dumbledore = Student.new('Dumbledore', :male, 60, '1942-04-19', '1952-05-30', true, gryffindor)
ginny = Student.new('Ginny', :female, 1, '1997-08-12', '2006-05-28', false, slytherin)
tom = Student.new('Tom', :male, 40, '1962-07-06', '1969-05-04', true, slytherin)


harry.add_spell(summoning, 12)
harry.add_spell(gouging, 14)
harry.add_spell(disarming, 23)
hermione.add_spell(summoning, 50)
hermione.add_spell(gouging, 56)
hermione.add_spell(patronus, 45)
ron.add_spell(summoning, 12)
fred.add_spell(patronus, 40)
fred.add_spell(summoning, 40)
dumbledore.add_spell(gouging, 100)
dumbledore.add_spell(cruciatus, 100)
dumbledore.add_spell(disarming, 100)
dumbledore.add_spell(patronus, 100)
ginny.add_spell(summoning, 1)
tom.add_spell(killing, 100)
tom.add_spell(cruciatus, 100)

gryffindor.add_student(harry)
gryffindor.add_student(fred)
gryffindor.add_student(dumbledore)
ravenclaw.add_student(hermione)
hufflepuff.add_student(ron)
slytherin.add_student(ginny)
slytherin.add_student(tom)


hogwarts = School.new(houses:[gryffindor, ravenclaw, hufflepuff, slytherin], spells: spells)
# I commented out the queries so they wouldn't be annoying

# Query 1
# arr = []
# hogwarts.houses.each do |house|
#   house.students.each do |student|
#     arr << student.name unless student.alumni_status
#   end
# end

# puts arr.sort

# Query 2
# arr = []
# dumbledore.known_spells.each_key do |spell|
#   arr << spell.category
# end
# puts arr.uniq

#Query 3
puts (harry.known_spells.values.reduce(0,&:+).to_f / harry.known_spells.count)



