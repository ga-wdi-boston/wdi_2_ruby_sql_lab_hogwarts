# SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require 'set'
require_relative 'school'

# Represents a house in a school of magic.
class House

  attr_reader :id, :points
  attr_accessor :name, :school, :animal

  # Creates a new house with the given name, animal and list of students.
  def initialize(name:, animal:, students: nil)
    @name, @animal = name, animal
    @students = Set.new
    @points = 0
    students.each { |e| add_student(e) } if !students.nil?
  end

  # Returns a list of students. Modifications to this list will not affect
  # the set of students in this house.
  def students
    result = []
    @students.each { |e| result << e }
    result
  end

  # Adds the specified student to the house.
  # Returns true if this set did not already contain the specified element,
  # false otherwise.
  def add_student(student)
    student.house = self
    success = @students.add?(student)
    return false if success.nil?
    true
  end

  def add_points(p)
    @points += p
  end
end
