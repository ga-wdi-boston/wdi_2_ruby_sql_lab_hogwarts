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
end
