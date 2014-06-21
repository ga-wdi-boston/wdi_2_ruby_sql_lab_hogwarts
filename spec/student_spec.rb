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
      expect(st.year).to eq nil
      expect(st.status).to eq false
    end
  end

  describe '#add_spell' do
    it 'can add a spell' do
      student = create_student
      expect(student.add_spell(create_spell)).to eq true
    end

    it 'cannot add a duplicate spell' do
      student = create_student
      spell = create_spell
      student.add_spell(spell)

      expect(student.add_spell(spell)).to eq false
    end
  end

  def create_student(name: 'Harry Potter', gender: 'M', birth_date: '1980-07-31', admission_date: '1991')
    Student.new(name: name, gender: gender, birth_date: birth_date, admission_date: admission_date)
  end

  def create_spell
    Spell.new(name: 'Levitation', category: 'Charm', incantation: 'Wingardium Leviosa', level: 1)
  end
end
