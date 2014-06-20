class House
  attr_reader :students, :animal, :name, :points
  def initialize(animal, name, points)
    @name, @animal, @points = name, animal, points
    @students = []
  end

  def add_student(student)
    @students += [student]
  end

end
