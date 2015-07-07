require 'date'

class House
  attr_reader :name, :animal
  attr_accessor :points, :students

  def initialize(name:, animal:, points:)
    @name, @animal, @points = name, animal, points
    @students = []
  end

  def admit_student(student)
    raise "Student is not old enough." if student.birth_date > (Date.today).prev_year(10)
    student.admission_date = Date.today
    student.year = 1
    @students << student
  end
end
