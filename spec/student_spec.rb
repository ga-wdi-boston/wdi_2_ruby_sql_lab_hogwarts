# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative '../lib/ruby/school'
require_relative '../lib/ruby/house'
require_relative '../lib/ruby/student'

describe Student do
  describe '#initialize' do
  end

  def create_student(name)
    s School.new('Hogwarts')
    s.houses.add_house(House.new(name: 'Gryffindor', school: s)
    Student.new(name: name, gender: 'M', year: 1996, house: h)
  end
end
