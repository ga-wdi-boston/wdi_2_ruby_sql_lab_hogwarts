# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require 'set'

# Represents a school of magic.
class School

  attr_reader :id
  attr_accessor :name

  # Creates a new school with the given name and list of houses and spells.
  def initialize(name:, houses: nil, spells: nil)
    raise ArgumentError, 'null name' if (name.nil? || name == '')
    @name = name
    @houses = Set.new
    @spells = Set.new
    houses.each { |e| add_house(e) } if !houses.nil?
    spells.each { |e| add_spell(e) } if !spells.nil?
  end

  # Returns a list of houses. Modifications to this list do not affect the
  # set of houses in this school.
  def houses
    result = []
    @houses.each { |e| result << e }
    result
  end

  # Returns a list of spells taught by thsi school. Modification of this list
  # will not affect the set of spells taught by this school.
  def spells
    result = []
    @spells.each { |e| result << e }
    result
  end

  # Adds the specified house to this school.
  # Returns true if this set did not already contain the specified element,
  # false otherwise.
  def add_house(house)
    house.school = self
    success = @houses.add?(house)
    return false if success.nil?
    true
  end

  # Add the specified spell to the set of spells taught by this school.
  # Returne true if this set did not already contain the specified element,
  # false otherwise.
  # Note: This is a unidirectional relationship.
  def add_spell(spell)
    success = @spells.add?(spell)
    return false if success.nil?
    true
  end

  # Returns a list of all students sorted alphabetically.
  def students
    result = []
    @houses.each { |e| result << e.students }
    result.flatten.sort_by { |e| e.name }
  end

  # Returns a hash of all current students where the keys are house name and
  # the values are hashes. Within these hashes, the keys are year numbers and
  # the values are arrays of students.
  def current_student_roster
    result = {}
    @houses.each do |house|
      result[house.name.to_sym] = house.current_students.group_by { |e| e.year }
    end
    result
  end

  # Returns a list of all current students sorted alphbetically.
  def current_students
    result = []
    @houses.each do |e|
      result << e.students.select { |student| !student.alumni_status? }
    end
    result.flatten.sort_by { |e| e.name }
  end

  # Permits all current students to practice spells in the given category
  # ten times. Spells can only be practiced if the student is eligible -
  # in other words, the method ignores the spell if the student year is not
  # at or above the spell level. The spell is added to the student's set
  # of known spells if it is not aleady known and the student is eligible to
  # learn it.
  def hold_spell_workshop(spell_category)
    spells = spells.select { |e| e.category == spell_category }
    current_students.each do |student|
      spells.each do |spell|
        10.times { student.practice_spell(spell) } if spell.level <= student.year
      end
    end
  end

  # Returns the house with the winning number of points.
  def winning_house
    houses.max_by { |e| e.points }
  end
end
