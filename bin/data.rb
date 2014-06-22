require_relative '../lib/house'
require_relative '../lib/school'
require_relative '../lib/student'
require_relative '../lib/spell'
require 'pry'

def new_house(name,animal,point)
  House.new(name: name,animal: animal ,point: point)
end

def new_student(name,gender,year,birth_date,admission_date,alum_st,house)
  Student.new(name: name,gender: gender,
    house: house, year: year, birth_date: birth_date,
    admission_date: admission_date, alum_st: alum_st)
end

def new_spell(name, incantation, category, level)
  Spell.new(name: name, incantation: incantation, category: category, level: level)
end

# create house object
gryffindor = new_house('Gryffindor','lion', 0)
hufflepuff = new_house('Hufflepuff','badger', 0)
ravenclaw = new_house('Ravenclaw','eagle', 0)
slytherin = new_house('Slytherin','serpent', 0)

#create spell
accio = new_spell('Accio','Summons an object','Charm',1)
crucio = new_spell('Crucio','Tortures opponent Unforgivable','Curse',2)
defodio = new_spell('Defodio','Dig out materials','Spell',3)
engorgio = new_spell('Engorgio','Enlarges and item','Spell',4)

#Create student
student1 = new_student('Astrix A.','MALE',1,'1998-01-08','2010-01-08',FALSE,'Gryffindor')
student2 = new_student('Filemina A.','MALE',1,'1990-03-18','2010-01-08',FALSE,'Gryffindor')
student3 = new_student('Roland Abberley','FEMALE',2,'1992-04-08','2011-01-08',FALSE,'Gryffindor')
student4 = new_student('Euan Abercrombie','MALE',2,'1998-05-08','2011-01-08',FALSE,'Gryffindor')
student5 = new_student('Nick Alas','MALE',4,'1992-03-28','2013-01-08',FALSE,'Gryffindor')

student6 = new_student('Abraxas Malfoy','FEMALE',2,'1992-06-08','2011-01-08',FALSE,'Hufflepuff')
student7 = new_student('Zoe Accrington','MALE',3,'1992-11-08','2012-01-08',FALSE,'Hufflepuff')
student8 = new_student('Terry Boot','MALE',4,'1992-04-08','2013-01-08',TRUE,'Hufflepuff')

student9 = new_student('Stewart Ackerley','MALE',3,'1991-12-08','2012-01-08',FALSE,'Ravenclaw')
student10 = new_student('Adrian','MALE',3,'1992-05-02','2012-01-08',FALSE,'Ravenclaw')

student11 = new_student('Jatin Agarkar','MALE',3,'1993-09-12','2012-01-08',FALSE,'Slytherin')
student12 = new_student('Sakura Akagi','FEMALE',4,'1992-01-23','2013-01-08',FALSE,'Slytherin')

#Create student with known_spell
student1.known_spells = {accio => 100}
student2.known_spells = {accio => 50}
student3.known_spells = {accio => 100}
student4.known_spells = {crucio => 100}
student5.known_spells = {crucio => 100}

student6.known_spells = {crucio => 100}
student7.known_spells = {defodio => 100}
student8.known_spells = {accio => 80, engorgio => 100}

student9.known_spells = {defodio => 100}
student10.known_spells = {defodio => 100}

student11.known_spells = {engorgio => 100}
student12.known_spells = {engorgio => 100}

#Create spell with list of student.
accio.students = [student1,student2,student12]
crucio.students = [student3,student4,student5,student6]
defodio.students = [student7,student9,student10]
engorgio.students = [student8,student11,student12]


# Insert student objects into house objects
gryffindor.students = [student1,student2,student3,student4,student5]
hufflepuff.students = [student6,student7,student8]
ravenclaw.students = [student9,student10]
slytherin.students = [student11,student12]

#Create School Object
school1 = School.new
school1.houses = [gryffindor,hufflepuff,ravenclaw,slytherin]
school1.spells = [accio,crucio,defodio,engorgio]




#Querires

#####Get current students name in alphabitical order
puts 'Students list in alphabitical order'

puts Student.sort_student_list

puts

######Find known spell categories for specefic student
puts 'Spell categories for Terry Boot'

puts Student.known_spell_categories('Terry Boot')

puts
######For a given student, get their average proficiency level across all spells they know.
puts 'average proficency level for Terry Boot'

puts Student.average_proficiency('Terry Boot')

puts

######For a given student, find all spells at their level or lower that they don't know.
puts 'Spells Terry Boot dont\' know'

puts Spell.spell_dont_know('Terry Boot')
#puts Student.spell_dont_know('Terry Boot')

puts
###### For a given spell, find all students who are at the spell's level or higher, but don't know it.
puts "students who are at the spell's level or higher, but don't know it"

puts Spell.student_list_with_high_spell('Engorgio')
puts

###### roster of all current students
puts 'Student roster'

puts Student.roster

puts

###### houses have a "total proficiency
puts 'total proficiency by category'
puts Spell.high_spell_category



