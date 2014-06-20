require 'pry'

require_relative '../lib/school'
require_relative '../lib/house'
require_relative '../lib/student'
require_relative '../lib/spell'

gryffindor = House.new(name:'Gryffindor', animal:'Lion', points:3000)
hufflepuff = House.new(name:'Hufflepuff', animal: 'Badger', points:2000)
ravenclaw = House.new(name:'Ravenclaw', animal:'Eagle', points:1200)
slytherin = House.new(name:'Slytherin', animal: 'Snake', points:600)

harry = Student.new(name:'Harry Potter', gender:'Male', year:7, birth_date:'1980-07-31', admission_date:'1991-09-01', alumni_status: false, house:'Gryffindor')
ron = Student.new(name:'Ron Weasley', gender:'Male', year:7, birth_date:'1980-03-01', admission_date:'1991-09-01', alumni_status: false, house:'Gryffindor')
hermione = Student.new(name:'Hermione Granger', gender:'Female', year:7, birth_date:'1979-09-19', admission_date:'1991-09-01', alumni_status: false, house:'Gryffindor')
cedric = Student.new(name:'Cedric Diggory', gender:'Male', year:9, birth_date:'1978-03-31', admission_date:'1989-09-01', alumni_status: true, house:'Hufflepuff')
hannah = Student.new(name:'Hannah Abbott', gender:'Female', year:7, birth_date:'1980-02-10', admission_date:'1991-09-01', alumni_status: false, house:'Hufflepuff')
cho = Student.new(name:'Cho Chang', gender:'Female', year:8, birth_date:'1979-01-21', admission_date:'1990-09-01', alumni_status: true, house:'Ravenclaw')
padma = Student.new(name:'Padma Patil', gender:'Female', year:7, birth_date:'1980-01-01', admission_date:'1991-09-01', alumni_status: false, house:'Ravenclaw')
draco = Student.new(name:'Draco Malfoy', gender:'Male', year:7, birth_date:'1980-01-22', admission_date:'1991-09-01', alumni_status: false, house:'Slytherin')
bellatrix = Student.new(name:'Bellatrix Lestrange', gender:'Female', year:27, birth_date:'1960-01-22', admission_date:'1971-09-01', alumni_status: true, house:'Slytherin')

summoning = Spell.new(name: 'Summoning Charm', incantation: 'Accio', category: 'charms', level:3)
killing = Spell.new(name: 'Killing Curse', incantation: 'Avada Kedavra', category:'dark arts', level:27)
confundus = Spell.new(name: 'Confundus Charm', incantation: 'Confundo', category: 'defense', level:5)
imperius = Spell.new(name: 'Imperius Curse', incantation:'Imperio', category: 'dark arts', level:7)
light = Spell.new(name: 'Light Charm', incantation:'Lumos', category: 'charms', level:2)

gryffindor.students = [harry, ron, hermione]
hufflepuff.students = [cedric, hannah]
ravenclaw.students = [cho, padma]
slytherin.students = [draco, bellatrix]

harry.spells = [summoning, confundus, light]
ron.spells = [summoning, confundus, light]
hermione.spells = [summoning, confundus, light]
cedric.spells = [summoning]
hannah.spells = [summoning, light]
cho.spells = [summoning, light]
padma = [summoning]
draco.spells = [summoning, imperius]
bellatrix.spells = [summoning, imperius, killing]

summoning.students = [harry, ron, hermione, cedric, hannah, cho, padma, draco, bellatrix]
killing.students = [bellatrix]
confundus.students = [harry, ron, hermione]
imperius.students = [draco, bellatrix]
light.students = [harry, ron, hermione, hannah, cho]

binding.pry
