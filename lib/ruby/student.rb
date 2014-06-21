# WDI SQL/Ruby Lab
# Blair Caple
# June 20, 2014

require 'date'
require 'set'
require_relative 'house'
require_relative 'known_spell'

# Represents a student
class Student

  attr_reader :id
  attr_accessor :name, :gender, :year, :birth_date, :house, :admission_date,
    :status

  # Creates a new student with the given information
  def initialize(name:, gender:, year: nil, birth_date: nil, admission_date: nil, status: false)
    @name, @gender, @year, @house, @admission_date, @status =
      name, gender, year, house, admission_date, status
    @birth_date = birth_date.nil? ? nil : Date.parse(birth_date)
    @known_spells = Set.new
  end

  def alumni_status?
    @alumni_status
  end

  # Returns a list of known spells for this student. Modifications to this list
  # will not affect the set of known spells.
  def known_spells
    result = []
    @known_spells.each { |e| result << e }
    result
  end

  # Adds the specified spell to the set of known spells for this student.
  # Returns true if the set of known spells did not contain the given spell,
  # false otherwise.
  def learn_spell(spell)
    known_spell = KnownSpell.new(spell: spell, student: self)
    success = @known_spells.add?(known_spell)
    return false if success.nil?
    true
  end

  # Adds the specified collection of spells to this student. Spells in the
  # given collection that the student already knows are ignored.
  def learn_spells(collection)
    collection.each { |e| learn_spell(e) }
  end
end
