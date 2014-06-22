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
students_spell_list = school1.houses.map{|i| i.students}.flatten.map{|i| i.known_spells if i.name == 'Terry Boot'}.compact.flatten
puts students_spell_list.map{|i| i.map{|k,v| k.category}.compact} #Return hash from array of hash. Then call each statement for each hash returned.

puts

######For a given student, get their average proficiency level across all spells they know.
puts 'average proficency level for Terry Boot'
#puts students_spell_list.map{|i| i.map{|k,v| v}}.flatten.reduce(0, :+) / students_spell_list[0].length
puts students_spell_list[0].map{|k,v| v}.flatten.reduce(0, :+) / students_spell_list[0].length
puts

######For a given student, find all spells at their level or lower that they don't know.
puts 'Spells Terry Boot dont\' know'
# Find list of spell student8 should know.
spell_list = school1.spells.map{|i| i.name if i.level <= student8.year}.compact
# Find list of spell student8 know.
known_spell_list = students_spell_list[0].keys.map{|i| i.name}

# Remove spells student 8 already knows from spell_list
puts spell_list - known_spell_list

puts
###### For a given spell, find all students who are at the spell's level or higher, but don't know it.
puts "students who are at the spell's level or higher, but don't know it"

#Retrun the spell object that matches the condition.
spell_engorgio = school1.spells.detect{|i| i.name == 'Engorgio' }


#Map spells from school than find student who knows Engorgio.
students_engorgio = school1.spells.map{|i| i.students if i.name == 'Engorgio'}.compact.flatten

#Map name of student who knows engorigio and return it if their year is less than equal to the spell level
puts students_engorgio.map{|i| i.name if i.year <= spell_engorgio.level}
#puts students_engorgio.map{|i| i.name if i.year <= engorgio.level }
puts

###### roster of all current students
puts 'Student roster'
roster = {}
year_student = {}

houses_list = school1.houses
studentlist = houses_list.map{|i| i.students}.flatten



#create hash with year and name
studentlist_name_year = studentlist.map{|i| [i.year,i.name]}.flatten
puts studentlist_name_year.inspect
#.sortby{|k,v| [k,v]}

puts hash1.inspect

puts year_student.inspect

houses_list.each do
  |i| roster[i.name] = 1
end

puts roster.inspect

binding.pry
