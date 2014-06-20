class House
  attr_reader :name, :animal
  attr_accessor :points

  def initialize(name:, animal:, points: 0)
    @name, @animal, @points = name, animal, points
  end
end
