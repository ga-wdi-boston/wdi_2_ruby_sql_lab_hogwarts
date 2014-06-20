class House
  attr_reader :name, :animal, :students
  attr_accessor :points

  def initialize(name:, animal:, points:)
    @name, @animal, @points = name, animal, points
    @students = []
  end
end
