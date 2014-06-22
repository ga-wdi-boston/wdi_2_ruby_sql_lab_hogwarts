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

  describe '#admit_student' do
    it 'checks whether the candidate is at least 10 years old' do
      house = create_house(create_school)
      candidate1 = create_student(birth_date: '2005-07-19')
      candidate2 = create_student(birth_date: '2004-06-19')

      expect{ house.admit_student(candidate1) }.to raise_error House::IneligibleCandidateError
      expect(house.admit_student(candidate2)).to eq true
    end

    it 'sets their year to 1' do
      house = create_house(create_school)
      student1 = create_student
      student2 = create_student(name: 'Tom Riddle', birth_date: '2004-06-19')
      house.admit_student(student1)

      expect(student1.year).to eq 1
      expect(student2.year).to eq 0
    end

    it 'sets their admission year to this year' do
      house = create_house(create_school)
      student1 = create_student
      student2 = create_student(name: 'Tom Riddle', birth_date: '2004-06-19')
      house.admit_student(student1)

      expect(student1.admission_date).to eq Date.today.year
      expect(student2.admission_date).to eq nil
    end
  end

  def create_school
    School.new(name: 'Hogwarts')
  end

  def create_house(school)
    House.new(name: 'Gryffindor', animal: 'Gryffin', students: nil)
  end

  def create_student(name: 'Harry Potter', gender: 'M',
      birth_date: '1980-07-31', admission_date: nil)

    Student.new(name: name, gender: gender, birth_date: birth_date,
        admission_date: admission_date)
  end
end
