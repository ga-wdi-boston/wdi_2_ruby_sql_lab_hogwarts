# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require_relative 'house'

# Represents a student
class Student

  attr_reader :id, :known_spells
  attr_accessor :name, :gender, :year, :birth_date, :house, :admission_date, :status

  # Creates a new student with the given information
  def initialize(name:, gender:, year:, birth_date:, house:, admission_date:, status: false)
    @name, @gender, @year, @birth_date, @house, @admission_date, @status = name, gender, year, birth_date, house, admission_date, status
    @known_spells = []
  end

  def alumni_status?
    @alumni_status
  end

  def known_spells
    @known_spells.dup
  end

  def add_spell(spell)
    known_spell = KnownSpell.new(spell, self)
    @known_spells << known_spell
  end
end
