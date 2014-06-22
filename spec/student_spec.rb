# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require 'date'
require_relative '../lib/ruby/school'
require_relative '../lib/ruby/house'
require_relative '../lib/ruby/student'

describe Student do
  describe '#initialize' do
    it 'can initialize its values' do
      st = create_student

      expect(st.name).to eq 'Harry Potter'
      expect(st.gender).to eq 'M'
      expect(st.birth_date.to_s).to eq '1980-07-31'
      expect(st.admission_date).to eq '1991'
      expect(st.year).to eq 7
      expect(st.status).to eq false
    end
  end

  describe '#add_initial_spell' do
    it 'can add a spell' do
      student = create_student
      expect(student.add_initial_spell(create_spell)).to eq true
    end

    it 'cannot add a duplicate spell' do
      student = create_student
      spell = create_spell
      student.add_initial_spell(spell)

      expect(student.add_initial_spell(spell)).to eq false
    end

    it 'cannot learn a spell if too young' do
      student = create_student(year: 3)
      spell = create_spell(level: 4)

      expect(student.add_initial_spell(spell)).to eq false
    end
  end

  describe '#add_initial_spells' do
    it 'adds a collection of spells' do
      student = create_student
      spell1 = create_spell
      spell2 = create_spell(name: 'Memory')
      spell3 = create_spell(name: 'Disarming')
      student.add_initial_spells([spell1, spell2, spell3])

      expect(student.known_spells.size).to eq 3
    end
  end

  describe '#knows_spell?' do
    it 'returns the spell if the given spell is known' do
      student = create_student
      spell1 = create_spell
      spell2 = create_spell(name: 'Memory')
      student.add_initial_spell(spell1)

      expect(student.knows_spell?(spell1)).not_to eq false
      expect(student.knows_spell?(spell2)).to eq false
    end
  end

  describe '#known_spell_categories' do
    it 'returns a collection of known spell categories' do
      student = create_student
      spell1 = create_spell
      spell2 = create_spell(name: 'Memory')
      spell3 = create_spell(category: 'Curse')
      student.add_initial_spells([spell1, spell2, spell3])

      expect(student.known_spell_categories.size).to eq 2
    end
  end

  describe '#average_proficiency' do
    it 'returns the average proficiency level across all spells they know' do
      student = create_student
      spell1 = create_spell
      spell2 = create_spell(name: 'Memory')
      spell3 = create_spell(category: 'Curse')
      student.add_initial_spells([spell1, spell2, spell3])
      ap = (student.known_spells.map(&:proficiency).reduce(0, &:+) / student.known_spells.size).round

      expect(student.avg_proficiency).to eq ap
    end
  end

  describe '#change_points' do
    it 'awards or subtracts points from a student\'s house' do
      student = create_student
      House.new(name: 'Gryffindor', animal: 'Gryffin', students: [student])

      expect(student.change_points(50)).to eq 50
      expect(student.change_points(-10)).to eq 40
    end
  end

  describe '#learn_spell' do
    it 'can add a spell' do
      student = create_student
      expect(student.learn_spell(create_spell)).to eq true
    end

    it 'cannot add a duplicate spell' do
      student = create_student
      spell = create_spell
      student.learn_spell(spell)

      expect(student.learn_spell(spell)).to eq false
    end

    it 'throws an error if the student is too young' do
      student = create_student(year: 3)
      spell = create_spell(level: 4)

      expect{ student.learn_spell(spell) }.to raise_error Student::InvalidSpellError
    end
  end

  describe '#practice_spell' do
    it 'adds the spell if the student does not know it' do
      student = create_student
      spell = create_spell(name: 'Spellarmius')
      student.practice_spell(spell)

      expect(student.knows_spell?(spell)).to_not eq false
    end

    it 'increases the proficiency by 1% unless it is already at 100%' do
      student = create_student
      spell = create_spell(name: 'Spellarmius')
      student.practice_spell(spell)
      expect(student.knows_spell?(spell).proficiency).to eq 1

      120.times{ student.practice_spell(spell) }
      expect(student.knows_spell?(spell).proficiency).to eq 100
    end
  end

  def create_student(name: 'Harry Potter', gender: 'M', birth_date: '1980-07-31', admission_date: '1991', year: 7)
    Student.new(name: name, gender: gender, birth_date: birth_date, admission_date: admission_date, year: year)
  end

  def create_spell(name: 'Levitation', category: 'Charm', incantation: 'Wingardium Leviosa', level: 1)
    Spell.new(name: name, category: category, incantation: incantation, level: level)
  end
end
