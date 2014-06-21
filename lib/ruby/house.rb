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

  # Returns a list of current students. Modifications to this list will noe
  # affect the underlying set of students in this house.
  def current_students
    result = []
    @students.each { |e| result << e if !e.status }
    result
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

  # Returns an list of proficiencies for this house. The list is made of
  # arrays containing the spell category and the sum of the student's
  # proficiency for spells in that category.
  def total_proficiencies
    result = Hash.new(0)
    students.each do |student|
      student.known_spells.each { |e| result[e.spell.category] += e.proficiency }
    end
    result.sort_by { |k, v| v }.reverse
  end

  def add_points(p)
    @points += p
  end
end
