require 'pry'

require_relative '../lib/school'
require_relative '../lib/house'
require_relative '../lib/student'
require_relative '../lib/spell'

gryffindor = House.new(name:'Gryffindor', animal:'Lion', points:3000)
hufflepuff = House.new(name:'Hufflepuff', animal: 'Badger', points:2000)
ravenclaw = House.new(name:'Ravenclaw', animal:'Eagle', points:1200)
slytherin = House.new(name:'Slytherin', animal: 'Snake', points:600)

harry = Student.new(name:'Harry Potter', gender:'Male', year: 7, birth_date:'1980-07-31', admission_date:'1991-09-01', alumni_status: false, house:'Gryffindor')
ron = Student.new(name:'Ron Weasley', gender:'Male', year: 7, birth_date:'1980-03-01', admission_date:'1991-09-01', alumni_status: false, house:'Gryffindor')
hermione = Student.new(name:'Hermione Granger', gender:'Female', year: 7, birth_date:'1979-09-19', admission_date:'1991-09-01', alumni_status: false, house:'Gryffindor')
cedric = Student.new(name:'Cedric Diggory', gender:'Male', year: 9, birth_date:'1978-03-31', admission_date:'1989-09-01', alumni_status: true, house:'Hufflepuff')
hannah = Student.new(name:'Hannah Abbott', gender:'Female', year: 7, birth_date:'1980-02-10', admission_date:'1991-09-01', alumni_status: false, house:'Hufflepuff')
cho = Student.new(name:'Cho Chang', gender:'Female', year: 8, birth_date:'1979-01-21', admission_date:'1990-09-01', alumni_status: true, house:'Ravenclaw')
padma = Student.new(name:'Padma Patil', gender:'Female', year: 7, birth_date:'1980-01-01', admission_date:'1991-09-01', alumni_status: false, house:'Ravenclaw')
draco = Student.new(name:'Draco Malfoy', gender:'Male', year: 7, birth_date:'1980-01-22', admission_date:'1991-09-01', alumni_status: false, house:'Slytherin')
bellatrix = Student.new(name:'Bellatrix Lestrange', gender:'Female', year: 27, birth_date:'1960-01-22', admission_date:'1971-09-01', alumni_status: true, house:'Slytherin')

summoning = Spell.new(name: 'Summoning Charm', incantation: 'Accio', category: 'charms', level:3)
killing = Spell.new(name: 'Killing Curse', incantation: 'Avada Kedavra', category:'dark arts', level:27)
confundus = Spell.new(name: 'Confundus Charm', incantation: 'Confundo', category: 'defense', level:5)
imperius = Spell.new(name: 'Imperius Curse', incantation:'Imperio', category: 'dark arts', level:7)
light = Spell.new(name: 'Light Charm', incantation:'Lumos', category: 'charms', level:2)

gryffindor.students = [harry, ron, hermione]
hufflepuff.students = [cedric, hannah]
ravenclaw.students = [cho, padma]
slytherin.students = [draco, bellatrix]

harry.spells = {summoning => 0.8, confundus => 0.9, light => 0.95}
ron.spells = {summoning => 0.7, confundus => 0.8, light => 0.85}
hermione.spells = {summoning => 1.0, confundus => 1.0, light => 1.0}
cedric.spells = {summoning => 0.5}
hannah.spells = {summoning => 0.9, light => 0.7}
cho.spells = {summoning => 0.9, light => 0.9}
padma.spells = {summoning => 0.8}
draco.spells = {summoning => 0.7, imperius => 0.8}
bellatrix.spells = {summoning => 0.8, imperius => 0.8, killing => 1.0}

summoning.students = [harry, ron, hermione, cedric, hannah, cho, padma, draco, bellatrix]
killing.students = [bellatrix]
confundus.students = [harry, ron, hermione]
imperius.students = [draco, bellatrix]
light.students = [harry, ron, hermione, hannah, cho]

hogwarts = School.new(name: 'Hogwarts')
hogwarts.houses = [gryffindor, hufflepuff, ravenclaw, slytherin]
hogwarts.spells = [summoning, killing, confundus, imperius, light]

# Get all current students (i.e. not alumni) sorted alphabetically.
current_students = hogwarts.houses.map(&:students).flatten.select { |student| student.alumni_status == false }.map(&:name).sort

# For a given student, find all spell categories they know spells in.
harry_spell_categories = harry.spells.keys.map(&:category).uniq

# For a given student, get their average proficiency level across all spells they know.
given_student = harry
proficiencies = given_student.spells.values
student_spell_proficiencies = proficiencies.reduce(&:+)/proficiencies.length

# For a given student, find all spells at their level or lower that they don't know.
given_student = padma
student_spell_deficiencies = hogwarts.spells.select { |spell| (spell.level <= given_student.year && !given_student.spells.keys.include?(spell)) }

# For a given spell, find all students who are at the spell's level or higher, but don't know it.
given_spell = confundus
lacking_spell_knowledge = hogwarts.houses.map(&:students).flatten.select { |student| (given_spell.level <= student.year && !given_spell.students.include?(student)) }

# Get a roster of all current students:
# Ruby: Return a hash where the keys are house names and the values are hashes.
# Within these hashes, the keys are year numbers and the values are arrays of students, sorted alphabetically.
roster = {}

hogwarts.houses.each do |house|
  roster_values = {}
  current_students_in_house = house.students.select { |student| student.alumni_status == false }
  years_in_house = current_students_in_house.map(&:year).uniq

  years_in_house.each do |year|
    roster_values[year] = current_students_in_house.select { |student| student.year == year }.map(&:name).sort
  end

  roster[house.name] = roster_values
end

# For a given spell category, houses have a "total proficiency", which is the sum of the proficiency scores
# of all students in the house for all spells in that category. Find out which spell category each house is
# most proficient in, using this metric.
houses_best_spell_category = {}

hogwarts.houses.each do |house|
  spell_proficiencies = {}

  hogwarts.spells.map(&:category).each do |category|
    spell_proficiencies[category] = 0
  end

  hogwarts.spells.each do |spell|
    spell_proficiency = 0

    house.students.each do |student|
      spell_proficiency += student.spells[spell] if student.spells.has_key?(spell)
      spell_proficiencies[spell.category] += spell_proficiency
    end
  end

  best_spell_category = spell_proficiencies.max_by { |category, proficiency| proficiency }

  houses_best_spell_category[house.name] = best_spell_category[0]
end

binding.pry
