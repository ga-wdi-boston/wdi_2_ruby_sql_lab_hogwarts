# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative '../lib/ruby/school'
require_relative '../lib/ruby/house'

describe House do
  describe '#initialize' do
    it 'has a school' do
      s = create_school
      h = create_house(s)

      expect(h.school).to eq s
    end

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

  def create_school
    School.new(name: 'Hogwarts')
  end

  def create_house(school)
    House.new(school: school, name: 'Gryffindor', animal: 'Gryffin')
  end
end
