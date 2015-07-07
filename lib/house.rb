class House
  attr_reader :students, :animal, :name, :points

  def initialize(animal, name, points)
    @name, @animal, @points = name, animal, points
    @students = []
  end

  def add_student(student)
    @students += [student]
  end

  def admit_student(student)
    if Date.today < student.birth_date.next_year(10)
      throw TooYoungError
    end
    student.year = 1
    admission_date = Date.today
  end


  def add_points(num)
    @points += num
  end

end

class TooYoungError < StandardError; end
