class School
  attr_reader :houses, :spells
  def initialize(houses: houses, spells: spells)
    @houses = houses
    @spells = spells
  end

  def hold_workshop(spell)
    houses.each do |house|
      house.students.each do |student|
        10.times do
          student.practice_spell(spell) if spell.level <= student.year
        end
      end
    end
  end

  def winning_house
    @houses[@houses.map(&:points).index(@houses.map(&:points).max)]
  end

  def summer
    houses.each do |house|
      house.students.each do |student|
        student.summer
      end
    end
  end

end
