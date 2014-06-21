require_relative 'student'
class House

  def initialize(name:, animal:, points: 0)
    @name, @animal, @points = name, animal, points
    @students = []
  end

end
