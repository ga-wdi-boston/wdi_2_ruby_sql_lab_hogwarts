# SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require 'set'
require_relative 'school'

# Represents a house in a school of magic.
class House
  class IneligibleCandidateError < ArgumentError; end

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

  # Awards or subtracts the given points from the house.
  def change_points(points)
    old_points = @points
    raise ArgumentError if (old_points + points) < 0
    @points += points
  end

  # Admits the given candidate to this house. The method sets their admission
  # date to today's date and their year 1. Returns true on success, false
  # otherwise. Throws an IneligibleCandidateError if the candidate is less
  # than 10 years old.
  def admit_student(candidate)
    today = Date.today
    raise IneligibleCandidateError if candidate.birth_date.year + 10 > today.year
    candidate.year = 1
    candidate.admission_date = today.year
    add_student(candidate)
  end

  private

  # Adds the specified student to the house.
  # Returns true if this set did not already contain the specified element,
  # false otherwise. This is a utility class to auto-add students through the
  # constructor.
  def add_student(student)
    student.house = self
    success = @students.add?(student)
    return false if success.nil?
    true
  end
end
