# SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative 'school'

# Represents a house in a school of magic.
class House

  attr_reader :id, :points, :students
  attr_accessor :name, :school, :animal

  # Creates a new house with the given name and list of students.
  def initialize(school:, name:, animal:, students: nil)
    @school, @name, @animal = school, name, animal
    @students = students.nil? ? [] : students
    @points = 0
  end

  def students
    @students.dup
  end

  def add_student(s)
    s.house = self
    @students << s
  end

  def add_points(p)
    @points += p
  end
end
