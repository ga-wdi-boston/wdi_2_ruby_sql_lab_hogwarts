# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative '../lib/ruby/school'
require_relative '../lib/ruby/house'
require_relative '../lib/ruby/student'

describe House do
  describe '#initialize' do
    it 'has a name' do
      h = create_house(create_school)
      expect(h.name).to eq 'Gryffindor'
    end

    it 'has an animal' do
      h = create_house(create_school)
      expect(h.animal).to eq 'Gryffin'
    end

    it 'has points' do
      h = create_house(create_school)
      expect(h.points).to eq 0
    end

    it 'has a list of students' do
      h = create_house(create_school)
      expect(h.students).to eq []
    end
  end

  describe '#add_student' do
    it 'can add a student' do
      house = create_house(create_school)
      expect(house.add_student(create_student)).to eq true
    end

    it 'cannot add a duplicate student' do
      house = create_house(create_school)
      potter = create_student
      house.add_student(potter)

      expect(house.add_student(potter)).to eq false
    end
  end

  def create_school
    School.new(name: 'Hogwarts')
  end

  def create_house(school)
    House.new(name: 'Gryffindor', animal: 'Gryffin')
  end

  def create_student
    Student.new(name: 'Harry Potter', gender: 'M', birth_date: '1980-07-31', admission_date: '1991')
  end
end
