class House
  attr_reader :name, :animal
  attr_accessor :points, :students

  def initialize(name:, animal:, points:)
    @name, @animal, @points = name, animal, points
    @students = []
  end
end
