# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative '../lib/ruby/school'

describe School do
  describe '#initialize' do
    it 'has a name' do
      s = create_school

      expect(s.name).to eq 'Hogwarts'
    end

    it 'has many houses' do
      s = create_school

      expect(s.houses.size).to eq 0
    end

    it 'has many spells' do
      s = create_school

      expect(s.spells.size).to eq 0
    end

  end

  def create_school
    School.new(name: 'Hogwarts')
  end

end
