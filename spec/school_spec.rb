# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative '../lib/ruby/school'
require_relative '../lib/ruby/house'
require_relative '../lib/ruby/spell'

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

    it 'teaches many spells' do
      s = create_school
      expect(s.spells.size).to eq 0
    end

    it 'raises an error if the name is null' do
      expect{ School.new }.to raise_error ArgumentError
    end

    it 'can add a collection of houses' do
      h = House.new(name: 'Gryffindor', animal: 'Lion')
      s = School.new(name: 'Hogwarts', houses: [h])
      expect(s.houses.size).to eq 1
    end
  end

  describe '#add_house' do
    it 'can add a house' do
      school = create_school
      house = House.new(name: 'Gryffindor', animal: 'Lion')
      expect(school.add_house(house)).to eq true
    end

    it 'cannot add a duplicate house' do
      school = create_school
      house = House.new(name: 'Gryffindor', animal: 'Lion')
      school.add_house(house)

      expect(school.add_house(house)).to eq false
    end
  end

  describe '#add_spell' do
    it 'can add a spell' do
      school = create_school
      spell = Spell.new(name: 'Levitation', category: 'Charm', incantation: 'Wingardium Leviosa', level: 1)
      expect(school.add_spell(spell)).to eq true
    end

    it 'cannot add a duplicate spell' do
      school = create_school
      spell = Spell.new(name: 'Levitation', category: 'Charm', incantation: 'Wingardium Leviosa', level: 1)
      school.add_spell(spell)

      expect(school.add_spell(spell)).to eq false
    end
  end

  # School factory
  def create_school
    School.new(name: 'Hogwarts')
  end
end
