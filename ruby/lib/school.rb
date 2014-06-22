class School
  attr_reader :name
  attr_accessor :name, :houses, :spells

  def initialize(name:)
    @name = name
    @houses = []
    @spells = []
  end

  def adjust_house_points(student, points)
    student.house.points += points
  end
end
