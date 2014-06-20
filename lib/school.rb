class School
  attr_reader :houses, :spells
  def initialize(houses: houses, spells: spells)
    @houses = houses
    @spells = spells
  end

end
