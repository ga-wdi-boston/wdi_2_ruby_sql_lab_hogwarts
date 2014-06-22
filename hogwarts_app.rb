require_relative 'school'
require_relative 'house'
require_relative 'student'
require_relative 'spell'
require 'pry'

spell1 = Spell.new(name: 'Burger maker',incantation:  'appearus burgerus', category: 'food', level: 1)
spell2 = Spell.new(name: 'Dessert maker', incantation: 'churnus icecremata',  category:'food', level: 3)
spell3 = Spell.new(name: 'Sleep spell', incantation: 'snoozariday', category: 'charm', level: 5)
spell4 = Spell.new(name: 'Rustle Jimmies', incantation: 'jimminus rustladem', category:'pester', level: 5)
spell5 = Spell.new(name: 'Attract', incantation: 'walkis this wayis', category: 'charm', level: 6)
spell6 = Spell.new(name: 'Bother', incantation: 'annoyus alotus', category: 'pester', level: 7)

student1 = Student.new(name: 'Bob', gender: 'male', year: 1, bday: '1992-10-01', admit_date: '2003-09-01', alum: false, house: 1)
student2 = Student.new(name: 'Kevin', gender: 'male', year: 2, bday: '1991-01-01', admit_date: '2002-09-01', alum: false, house: 2)
student3 = Student.new(name: 'Chad', gender: 'male', year: 3, bday: '1990-08-03', admit_date: '2001-09-01', alum: false, house: 3)
student4 = Student.new(name: 'Stacey', gender: 'female', year: 4, bday: '1989-10-04', admit_date: '2000-09-01', alum: false, house: 4)
student5 = Student.new(name: 'Bethanie', gender: 'female', year: 5, bday: '1988-07-01', admit_date: '1999-09-01', alum: false, house: 1)
student6 = Student.new(name: 'Maya', gender: 'female', year: 6, bday: '1987-02-01', admit_date: '1998-09-01', alum: false, house: 2)
student7 = Student.new(name: 'Cho', gender: 'female', year: 7, bday: '1986-10-01', admit_date: '1997-09-01', alum: false, house: 3)
student8 = Student.new(name: 'Larry', gender: 'male', year: 8, bday: '1985-11-11', admit_date: '1996-09-01', alum: true, house: 4)
student9 = Student.new(name: 'Jake', gender: 'male', year: 3, bday: '1992-08-06', admit_date: '2001-09-01', alum: false, house: 3)


house1 =  House.new(name: 'Gryffindor', animal: 'Griffin', points: 300)
house1.add_student(student1)
house1.add_student(student5)
house2 = House.new(name: 'Slytherin', animal: 'Snake', points: 100)
house2.add_student(student2)
house2.add_student(student6)
house3 = House.new(name: 'Hufflepuff', animal: 'Jigglypuff', points: 200)
house3.add_student(student3)
house3.add_student(student7)
house3.add_student(student9)
house4 = House.new(name: 'Ravenclaw', animal: 'Raven', points: 250)
house4.add_student(student4)
house4.add_student(student8)

hogwarts = School.new(name: 'Hogwarts', houses: [house1, house2, house3, house4], spells: [spell1, spell2, spell3, spell4, spell5, spell6])

spell4.add_student(student9.name)
student9.learn_spell(spell4, 100)

spell6.add_student(student9.name)
student9.learn_spell(spell6, 100)

spell1.add_student(student1.name)
student1.learn_spell(spell1, 30)

spell1.add_student(student2.name)
student2.learn_spell(spell1, 60)

spell1.add_student(student3.name)
student3.learn_spell(spell1, 80)

spell2.add_student(student3.name)
student3.learn_spell(spell2, 30)

spell2.add_student(student4.name)
student4.learn_spell(spell2, 80)

spell1.add_student(student4.name)
student4.learn_spell(spell1, 90)

spell4.add_student(student5.name)
student5.learn_spell(spell4, 30)

spell3.add_student(student5.name)
student5.learn_spell(spell3, 40)

spell2.add_student(student5.name)
student5.learn_spell(spell2, 90)

spell1.add_student(student5.name)
student5.learn_spell(spell1, 100)

spell5.add_student(student6.name)
student6.learn_spell(spell5, 30)

spell4.add_student(student6.name)
student6.learn_spell(spell4, 50)

spell2.add_student(student6.name)
student6.learn_spell(spell2, 90)

spell1.add_student(student6.name)
student6.learn_spell(spell1, 100)

spell6.add_student(student7.name)
student7.learn_spell(spell6, 20)

spell5.add_student(student7.name)
student7.learn_spell(spell5, 50)

spell4.add_student(student7.name)
student7.learn_spell(spell4, 40)

spell2.add_student(student7.name)
student7.learn_spell(spell2, 60)


# Get all current students (not alums), sorted alpha
hogwarts.current_students

# For a given student, all categories of spell they know
student7.known_categories

# For a given student, average proficiency accross all known spells
student7.avg_proficiency

# For a given student, find all spells <= their level that they DON'T know
hogwarts.spells_to_learn(student7)

# For a given spell, find all students at that level or higher that don't know it
# Note - includes alumni
hogwarts.students_to_learn(spell3)

# Roster of all students -- includes alumni
hogwarts.full_roster

# For a given spell category, houses have 'total proficiency' (sum of scores)
# Find which category each house is most proficienct in
hogwarts.best_spell_category(house1)
hogwarts.best_spell_category(house2)
hogwarts.best_spell_category(house3)
hogwarts.best_spell_category(house4)

binding.pry
