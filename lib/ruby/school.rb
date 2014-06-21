# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

# Represents a chool of magic
class School

  attr_reader :id, :spells
  attr_accessor :name

  # Creates a new school with the given name and list of houses and spells.
  def initialize(name:, houses: nil, spells: nil)
    @name = name
    @houses = []
    @spells = []
    houses.each { |e| add_house(e) } if !houses.nil?
    spells.each { |e| add_spell(e) } if !spells.nil?
  end

  def houses
    @houses.dup
  end

  def add_house(h)
    h.school = self
    @houses << h
  end

  def spells
    @spells.dup
  end

  def add_spell(s)
    s.school = self
    @spells << s
  end
end
